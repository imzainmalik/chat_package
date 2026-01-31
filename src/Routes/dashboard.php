
<?php

use Illuminate\Support\Facades\Route;
use ChatifyPro\Http\Controllers\DashboardController;

Route::middleware(['web','auth'])->prefix('chatify/dashboard')->group(function () {
    Route::get('/', [DashboardController::class, 'index']);
});
