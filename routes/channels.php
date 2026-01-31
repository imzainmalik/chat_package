<?php
use Illuminate\Support\Facades\Broadcast;

// Note: The channel name here must match exactly what you subscribe to in JS
// JS: private-chat.1  ->  PHP: chat.{id}
Broadcast::channel('chat.{id}', function ($user, $id) {
    // Return true if the authenticated user is the one the message is for
    return (int) $user->id === (int) $id;
});