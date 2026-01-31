<?php

use Illuminate\Support\Facades\Route;
use ChatifyPro\Http\Controllers\ChatController; // <-- correct namespace

Route::middleware(['web','auth'])->prefix('pro-lara-chat')->group(function () {
    Route::get('/', [ChatController::class, 'index']);
});

Route::get('/chat-test', function () {
    return 'ok';
});

