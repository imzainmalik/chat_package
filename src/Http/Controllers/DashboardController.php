<?php

namespace ChatifyPro\Http\Controllers;

use Illuminate\Routing\Controller;

class DashboardController extends Controller
{
    public function index()
    {
        return view('chatify::dashboard.index');
    }
}
