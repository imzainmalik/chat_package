<?php

use ChatifyPro\Http\Controllers\ChatifyApiController;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'api/chatify', 'middleware' => ['api', 'auth:sanctum']], function () {
    // Init
    Route::get('/init', [ChatifyApiController::class, 'init']);
    Route::get('/users', [ChatifyApiController::class, 'searchUsers'])->name('chatify.searchUsers');
    Route::post('/messages/{id}/reaction', [ChatifyApiController::class, 'reaction'])->name('api.reaction');
    // Conversations
    Route::get('/conversations', [ChatifyApiController::class, 'getConversations']);
    Route::post('/conversations', [ChatifyApiController::class, 'createConversation']);

    // Messages
    Route::get('/conversations/{id}/messages', [ChatifyApiController::class, 'getMessages']);
    Route::post('/conversations/{id}/messages', [ChatifyApiController::class, 'sendMessage']);
    Route::post('/messages/{id}/read', [ChatifyApiController::class, 'markAsRead']);
    Route::post('/messages/{id}/react', [ChatifyApiController::class, 'toggleReaction']);

    // Settings
    Route::post('/settings', [ChatifyApiController::class, 'updateSettings']);
});
