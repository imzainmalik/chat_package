<?php

namespace ChatifyPro;

use Illuminate\Support\ServiceProvider;
use ChatifyPro\Console\InstallCommand;
use Illuminate\Support\Facades\Broadcast;

class ChatServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->mergeConfigFrom(__DIR__.'/../config/chatify.php', 'chatify');
    }
    
    public function boot()
    {
        // Load Routes
        $this->loadRoutesFrom(__DIR__.'/../routes/web.php');
        $this->loadRoutesFrom(__DIR__.'/../routes/api.php');

        // Load Views
        $this->loadViewsFrom(__DIR__.'/../resources/views', 'chatify');

        // Load Migrations
        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');
        Broadcast::routes(['middleware' => ['web', 'auth']]);

        // 2. Load your package channels
        require __DIR__.'/../routes/channels.php';

        // Publishing
        if ($this->app->runningInConsole()) {
            $this->publishes([
                __DIR__.'/../config/chatify.php' => config_path('chatify.php'),
            ], 'chatify-config');

            $this->publishes([
                __DIR__.'/../resources/views' => resource_path('views/vendor/chatify'),
            ], 'chatify-views');

            $this->publishes([
                __DIR__.'/../public' => public_path('vendor/chatify'),
            ], 'chatify-assets');

            $this->commands([
                InstallCommand::class,
            ]);
        }
    }
}