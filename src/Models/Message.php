<?php

namespace ChatifyPro\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasUuids;

    protected $table = 'chatify_messages';

    protected $guarded = [];

    protected $casts = [
        'attachment' => 'array',
        'created_at' => 'datetime',
    ];

    public function sender()
    {
        return $this->belongsTo(\App\Models\User::class, 'sender_id');
    }

    public function conversation()
    {
        return $this->belongsTo(Conversation::class);
    }

    public function reactions()
    {
        return $this->hasMany(Reaction::class);
    }

    public function statuses()
    {
        return $this->hasMany(MessageStatus::class);
    }

    public function parent()
    {
        return $this->belongsTo(Message::class, 'reply_to_id');
    }
}
