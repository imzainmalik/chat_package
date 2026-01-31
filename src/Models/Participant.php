<?php

namespace ChatifyPro\Models;

use Illuminate\Database\Eloquent\Model;

class Participant extends Model
{
    protected $table = 'chatify_participants';
    protected $guarded = [];
    protected $casts = [
        'last_read_at' => 'datetime',
    ];

    public function user()
    {
        // Assumes standard Laravel User model. 
        // In a real package, this might be configurable via config('auth.providers.users.model')
        return $this->belongsTo(\App\Models\User::class);
    }

    public function conversation()
    {
        return $this->belongsTo(Conversation::class);
    }
}