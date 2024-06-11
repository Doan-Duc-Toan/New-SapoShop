<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Events\MessageSend;
use App\Models\Message;
use Illuminate\Support\Facades\Auth;
use App\Models\Conversation;
use App\Models\User;
use App\Models\Customer;

class ChatController extends Controller
{
    function advise()
    {
        $conversations = Auth::user()->conversations;
        $conversationIds = $conversations->pluck('id');
        return view('admin.chat', compact('conversations','conversationIds'));
    }
    function send(Request $request)
    {
        $id = Auth::guard('customers')->user()->id;
        $message = $request->get('message');
        $type = $request->get('type');
        $conversationId = $request->get('conversationId');
        Message::create([
            'conversation_id' => $conversationId,
            'content' => $message,
            'type' => $type,
            'sender_id' => $id
        ]);
        event(new MessageSend($message, $conversationId, $id, $type));
        return response()->json(['mess' => $request->all()]);
    }
    function sendToCustomer(Request $request)
    {
        $id = Auth::user()->id;
        $message = $request->get('message');
        $type = $request->get('type');
        $conversationId = $request->get('conversationId');
        Message::create([
            'conversation_id' => $conversationId,
            'content' => $message,
            'type' => $type,
            'sender_id' => $id
        ]);
        event(new MessageSend($message, $conversationId, $id, $type));
        return response()->json(['mess' => $request->all()]);
    }
 

    function getConversation(Request $request)
    {
        $id = $request->get('id');
        $conversation = Conversation::find($id);
        $messages = $conversation->messages;
        return response()->json(['view' => view('admin.chat-box', compact('messages', 'conversation'))->render()]);
    }
}
