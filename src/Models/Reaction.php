<?php

namespace ChatifyPro\Models;

use Illuminate\Database\Eloquent\Model;

class Reaction extends Model
{
    protected $table = 'chatify_reactions';
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(\App\Models\User::class);
    }

    public function message()
    {
        return $this->belongsTo(Message::class);
    }
}