<?php

namespace ChatifyPro\Events;

use ChatifyPro\Models\Message;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MessageSent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;

    public function __construct(Message $message)
    {
        $this->message = $message->load(['sender', 'reactions']);
    }

    /**
     * Broadcast on a specific private channel for the conversation.
     * Channel: chat.conversation.{id}
     */
    public function broadcastOn()
    {
        return new PrivateChannel('chat.' . $this->message->receiver_id);
    }

    public function broadcastAs()
    {
        return 'message.sent';
    }

    public function broadcastWith()
    {
        return [
            'message' => [
                'id' => $this->message->id,
                'content' => $this->message->content,
                'conversation_id' => $this->message->conversation_id,
                'sender_id' => $this->message->sender_id,
                'created_at' => $this->message->created_at->toIso8601String(),
                'status' => $this->message->status,
            ],
        ];
    }
}
