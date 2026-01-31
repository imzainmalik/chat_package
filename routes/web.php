<?php

use Illuminate\Support\Facades\Route;
use ChatifyPro\Http\Controllers\ChatifyController;

Route::group(['prefix' => config('chatify.path'), 'middleware' => config('chatify.middleware')], function () {
    Route::get('/', [ChatifyController::class, 'index'])->name('chatify');
});
