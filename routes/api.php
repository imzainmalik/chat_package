<?php

use Illuminate\Support\Facades\Route;
use ChatifyPro\Http\Controllers\ChatifyApiController;

Route::group(['prefix' => config('chatify.api_prefix'), 'middleware' => config('chatify.api_middleware')], function () {
    // Init
    Route::get('/init', [ChatifyApiController::class, 'init']);
      Route::get('/users', [ChatifyApiController::class, 'searchUsers'])->name('chatify.searchUsers');
    // Route::post('/messages/{id}/reaction', [ChatifyApiController::class, 'toggleReaction'])->name('api.reaction');

    // Conversations
    Route::get('/conversations', [ChatifyApiController::class, 'getConversations']);
    Route::post('/conversations', [ChatifyApiController::class, 'createConversation']);
    
    // Messages
    Route::get('/conversations/{id}/messages', [ChatifyApiController::class, 'getMessages']);
    Route::post('/conversations/{id}/messages', [ChatifyApiController::class, 'sendMessage']);
    Route::post('/messages/{id}/read', [ChatifyApiController::class, 'markAsRead']);
    Route::post('/messages/{id}/reaction', [ChatifyApiController::class, 'toggleReaction']);
    Route::post('/conversations/{id}/read', [ChatifyApiController::class, 'markAsRead']);
    // Settings
    Route::post('/settings', [ChatifyApiController::class, 'updateSettings']);
});