<?php

namespace ChatifyPro\Models;

use Illuminate\Database\Eloquent\Model;

class MessageStatus extends Model
{
    protected $table = 'chatify_message_status';
    protected $guarded = [];

    public function message()
    {
        return $this->belongsTo(Message::class);
    }

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }
}