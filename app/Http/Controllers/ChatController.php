<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ChatController extends Controller
{
    function advise(){
        return view('admin.chat');
    }
}
