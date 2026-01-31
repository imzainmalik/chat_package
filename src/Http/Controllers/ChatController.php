<?php
namespace ChatifyPro\Http\Controllers;

use Illuminate\Routing\Controller;

class ChatController extends Controller
{
    public function index()
    {
        return view('chatify::chat.index');
    }
}
