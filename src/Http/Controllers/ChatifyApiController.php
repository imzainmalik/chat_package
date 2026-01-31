<?php

namespace ChatifyPro\Http\Controllers;

use App\Models\User;
use ChatifyPro\Events\MessageSent;
use ChatifyPro\Models\Conversation;
use ChatifyPro\Models\Message;
use ChatifyPro\Models\Participant;
use ChatifyPro\Models\Reaction;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ChatifyApiController extends Controller
{
    /**
     * Search Users for New Conversation
     */
    public function searchUsers(Request $request)
    {
        $query = $request->get('q');
        if (! $query) {
            return response()->json([]);
        }

        $users = User::where('id', '!=', Auth::id())
            ->where(function ($q) use ($query) {
                $q->where('name', 'like', "%{$query}%")
                    ->orWhere('email', 'like', "%{$query}%");
            })
            ->take(20)
            ->get(['id', 'name', 'email']);

        $users->transform(function ($u) {
            $u->avatar = $u->avatar ?? 'https://ui-avatars.com/api/?name='.urlencode($u->name);

            return $u;
        });

        return response()->json($users);
    }

    /**
     * Create or Get Existing Conversation
     */
    public function createConversation(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
        ]);

        $targetUserId = $request->user_id;
        $authUserId = Auth::id();

        // Check if private conversation exists
        $conversation = Conversation::where('type', 'private')
            ->whereHas('participants', function ($q) use ($authUserId) {
                $q->where('user_id', $authUserId);
            })
            ->whereHas('participants', function ($q) use ($targetUserId) {
                $q->where('user_id', $targetUserId);
            })
            ->first();

        if ($conversation) {
            return response()->json($conversation);
        }

        // Create new
        DB::beginTransaction();
        try {
            $conversation = Conversation::create([
                'id' => (string) Str::uuid(),
                'type' => 'private',
                'created_by' => $authUserId,
            ]);

            Participant::create(['conversation_id' => $conversation->id, 'user_id' => $authUserId]);
            Participant::create(['conversation_id' => $conversation->id, 'user_id' => $targetUserId]);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json(['error' => 'Failed to create conversation'], 500);
        }

        return response()->json($conversation);
    }

    /**
     * Get Sidebar Data (Conversations + Unread Counts)
     */
    public function getConversations(Request $request)
    {
        // dd(config('chatify.user.avatar'));
        // if ($request->ajax()) {
        //     $query = $request->get('q');
        //     if (! $query) {
        //         return response()->json([]);
        //     }

        //     $users = User::where('id', '!=', Auth::id())
        //         ->where(function ($q) use ($query) {
        //             $q->where('name', 'like', "%{$query}%")
        //                 ->orWhere('email', 'like', "%{$query}%");
        //         })
        //         ->take(20)
        //         ->get([config('chatify.user.id'), config('chatify.user.name'), config('chatify.user.email'), config('chatify.user.avatar')]);

        //     $users->transform(function ($u) {
        //         $u->avatar = $u->avatar ?? 'https://ui-avatars.com/api/?name='.urlencode($u->name);

        //         return $u;
        //     });
        //     dd($users);
        //     return response()->json($users);
        // }
        $userId = Auth::id();

        $conversations = Conversation::whereHas('participants', function ($q) use ($userId) {
            $q->where('user_id', $userId);
        })
            ->with(['lastMessage', 'participants.user'])
            ->get()
            ->map(function ($conv) use ($userId) {
                $myParticipant = $conv->participants->where('user_id', $userId)->first();
                $lastReadAt = $myParticipant ? $myParticipant->last_read_at : null;

                $unseenCount = $conv->messages()
                    ->where('created_at', '>', $lastReadAt ?? '1970-01-01')
                    ->where('sender_id', '!=', $userId)
                    ->count();

                if ($conv->type === 'private') {
                    $otherUser = $conv->participants->where('user_id', '!=', $userId)->first()?->user;
                    $name = $otherUser ? $otherUser->name : 'Unknown User';
                    // $avatar = $otherUser ? ($otherUser->avatar ?? 'https://ui-avatars.com/api/?name='.urlencode($name)) : '';
                    $folder = config('chatify.user_display_pic_folder_url');
                    $resolver = config('chatify.user.avatar');

                    $avatar = '';

                    if ($otherUser) {

                        // 1️⃣ If avatar resolver is a closure
                        if (is_callable($resolver)) {
                            $avatar = $resolver($otherUser);
                        }

                        // 2️⃣ If avatar is a column name
                        elseif (is_string($resolver) && ! empty($otherUser->{$resolver})) {

                            $value = $otherUser->{$resolver};

                            // Full URL?
                            if (filter_var($value, FILTER_VALIDATE_URL)) {
                                $avatar = $value;
                            }
                            // Use folder if provided
                            elseif (! empty($folder)) {
                                $avatar = asset($folder.'/'.$value);
                            }
                            // Raw value fallback
                            else {
                                $avatar = $value;
                            }
                        }

                        // 3️⃣ Final fallback
                        if (empty($avatar)) {
                            $avatar = 'https://ui-avatars.com/api/?name='.urlencode($name);
                        }
                    }

                } else {
                    $name = $conv->name;
                    $avatar = $conv->avatar;
                }

                return [
                    'id' => $conv->id,
                    'type' => $conv->type,
                    'name' => $name,
                    'avatar' => $avatar,
                    'lastMessage' => $conv->lastMessage,
                    'unseenCount' => $unseenCount,
                ];
            })
            ->sortByDesc(function ($c) {
                return $c['lastMessage'] ? $c['lastMessage']->created_at : null;
            })
            ->values();

        return response()->json($conversations);
    }

    /**
     * Get Messages for a Conversation
     */
    public function getMessages(Request $request, $id)
    {
        $messages = Message::where('conversation_id', $id)
            ->with(['sender', 'reactions'])
            ->orderBy('created_at', 'asc')
            ->get();

        return response()->json($messages);
    }

    /**
     * Send a Message
     */
    public function sendMessage(Request $request, $id)
    {
        // dd($request->all());
        $request->validate([
            'content' => 'required_without:file',
            'file' => 'nullable|file|max:10240', // 10MB
        ]);

        $attachment = null;
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $filename = time() . '_' . $file->getClientOriginalName();
            
            // This moves the file directly to your-project/public/uploads/chat/
            $file->move(public_path('uploads/chat'), $filename);
            
            // Save this string in your 'file_path' column
            $attachment = 'uploads/chat/' . $filename;
        }
 
        $message = Message::create([
            'id' => (string) Str::uuid(),
            'conversation_id' => $id,
            'reply_to_id' => $request->reply_to_id,
            'sender_id' => Auth::id(),
            'content' => $request->content,
            'type' => $request->type ?? 'TEXT',
            'attachment' => $attachment, 
        ]);

        $participant = Participant::where('conversation_id', $id)->first();
        DB::table('chatify_message_status')->insert([
            'message_id' => $message->id,
            'user_id' => $participant->user_id,
            'status' => 'SENT', // 0 = Sent
            'updated_at' => now(),
        ]);

        broadcast(new MessageSent($message))->toOthers();

        return response()->json($message);
    }

    /**
     * Update Settings
     */
    public function updateSettings(Request $request)
    {
        // For demonstration, we just return success.
        // In a real package, writing to .env programmatically is risky and depends on file permissions.
        return response()->json(['message' => 'Settings updated successfully (Simulation). Please update .env manually for persistence.']);
    }

    // Stubs for other routes
    public function markAsRead($conversationId)
    {
        $userId = Auth::user()->id();

        // Find messages in this conversation NOT sent by the current user
        $messageIds = Message::where('conversation_id', $conversationId)
            ->where('sender_id', '!=', $userId)
            ->pluck('id');

        // Update your specific status table
        DB::table('chatify_message_status')
            ->whereIn('message_id', $messageIds)
            ->where('user_id', $userId)
            ->where('status', 'SENT')
            ->where('status', 'DELIVERED')
            ->update([
                'status' => 'READ', // 2 = Seen
                'updated_at' => now(),
            ]);

        // TRIGGER REALTIME: Tell the sender their message was seen
        $this->broadcastSeenStatus($conversationId, $userId);

        return response()->json(['success' => true]);
    }

    public function toggleReaction(Request $request, $id)
    {
        $msg = Message::find($id);
        // dd($msg);
        $emoji = $request->input('emoji');
        $userId = Auth::id();

        // Check if reaction exists
        $reaction = Reaction::where('message_id', $msg->id)
            ->where('user_id', $userId)
            ->where('emoji', $emoji)
            ->first();

        if ($reaction) {
            // Untoggle (remove)
            $reaction->delete();
            $action = 'removed';
        } else {
            // Toggle (add)
            Reaction::create([
                'message_id' => $msg->id,
                'user_id' => $userId,
                'emoji' => $emoji,
            ]);
            $action = 'added';
        }

        return response()->json([
            'action' => $action,
            // Return all current reactions for this message to update UI
            'reactions' => $msg->reactions()->get(),
        ]);
    }

    public function syncReactions($conversationId)
    {
        // Fetch reactions created/updated in the last few seconds
        // or simply fetch all reactions for current active messages
        $reactions = DB::table('chatify_reactions')
            ->where('conversation_id', $conversationId)
            ->get(['message_id', 'reaction', 'user_id']);

        return response()->json($reactions);
    }

    public function store(Request $request)
    {
        $path = null;
        if ($request->hasFile('file')) {
            $path = $request->file('file')->store('chat_attachments', 'public');
        }

        $message = Message::create([
            'content' => $request->content,
            'type' => $request->type, // 'VOICE', 'IMAGE', etc.
            'file_path' => $path,
            'sender_id' => auth()->id(),
            // ...
        ]);

        return response()->json($message);
    }

    public function init()
    {
        return response()->json(['status' => 'ok']);
    }
}
