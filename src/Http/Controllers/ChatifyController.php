<?php

namespace ChatifyPro\Http\Controllers;

use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;

class ChatifyController extends Controller
{
    public function index()
    { 
        return view('chatify::chat.index', [
            'user' => Auth::user(),
            'pusherKey' => config('chatify.pusher.key'),
            'pusherCluster' => config('chatify.pusher.options.cluster'),
        ]);
    }
}