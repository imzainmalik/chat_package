<?php

return [
    App\Providers\AppServiceProvider::class,
    App\Providers\BroadcastServiceProvider::class, // <-- Add this

    'name' => 'Chatify Pro',
    
    // Route prefix for the web interface
    'path' => 'chatify',
    
    // Middleware for the web interface
    'middleware' => ['web', 'auth'],
    
    // API prefix
    'api_prefix' => 'api/chatify',
    
    // API middleware
    'api_middleware' => ['web', 'auth'],
    
    // Broadcasting driver (pusher, reverb, ably)
    'broadcast_driver' => env('BROADCAST_CONNECTION'),
    
    // Storage disk for attachments
    'storage_disk' => 'public',
    'attachment_folder' => 'chatify-attachments',

    'user_display_pic_folder_url' => 'display_picture', //or leave it blank

    'user' => [
        'id' => 'id',
        'name' => 'name',
        'email' => 'email', 
        'avatar' => 'd_pic',
    ],


    // --- Pusher Settings ---
    'pusher' => [
        'app_id'     => env('PUSHER_APP_ID'),
        'key'        => env('PUSHER_APP_KEY'),
        'secret'     => env('PUSHER_APP_SECRET'),
        'options'    => [
            'cluster'   => env('PUSHER_APP_CLUSTER'),
            'useTLS'    => true,
            'encrypted' => true,
            'host'      => null,
            'port'      => 443,
            'scheme'    => 'https',
        ],
    ],

    'providers' => [
        // ... other providers ...
        
        App\Providers\BroadcastServiceProvider::class, // <--- ADD OR UNCOMMENT THIS LINE
        
        // ... other providers ...
    ],
];