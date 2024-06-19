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
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        return view('admin.chat', compact('conversations', 'conversationIds'));
    }
    function send(Request $request)
    {

        $request->validate([
            'message' => 'nullable|string',
            'type' => 'required|string',
            'conversationId' => 'required|integer',
        ]);
        $id = Auth::guard('customers')->user()->id;
        $message = $request->get('message');
        $type = $request->get('type');
        $conversationId = $request->get('conversationId');
        $path = null;
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
            $extension = strtolower($file->getClientOriginalExtension());
            $filename = time() . '_' . $originalName . '.' . $extension;
            $path = $file->storeAs('uploads', $filename, 'public');
            $validExtensions = ['jpg', 'png', 'txt', 'pdf', 'gif'];
            $actualMimeType = $file->getMimeType();
            $mimeByExtension = [
                'jpg' => 'image/jpeg',
                'jpeg' => 'image/jpeg',
                'png' => 'image/png',
                'gif' => 'image/gif',
                'txt' => 'text/plain',
                'pdf' => 'application/pdf'
            ];

            // Kiểm tra xem phần mở rộng có trong danh sách hợp lệ và MIME type có phù hợp với phần mở rộng
            if (!in_array($extension, $validExtensions) || $actualMimeType !== $mimeByExtension[$extension]) {
                return response()->json(['error' => 'Invalid file format'], 400);
            }
            Message::create([
                'conversation_id' => $conversationId,
                'content' => $path,
                'type' => $type,
                'sender_id' => $id,
                'file' => 1
            ]);
            event(new MessageSend($path, $conversationId, $id, $type, 1));
        }
        if ($message) {
            Message::create([
                'conversation_id' => $conversationId,
                'content' => $message,
                'type' => $type,
                'sender_id' => $id,
                'file' => 0
            ]);
            event(new MessageSend($message, $conversationId, $id, $type, 0));
        }
        return response()->json(['path' => $path]);
    }
    function sendToCustomer(Request $request)
    {
        $request->validate([
            'message' => 'nullable|string',
            'type' => 'required|string',
            'conversationId' => 'required|integer',
            // 'file' => 'nullable|file'
        ]);
        $id = Auth::user()->id;
        $message = $request->get('message');
        $type = $request->get('type');
        $conversationId = $request->get('conversationId');
        $path = null;
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '_' . $originalName . '.' . $extension;
            $path = $file->storeAs('uploads', $filename, 'public');
            $validExtensions = ['jpg', 'png', 'txt', 'pdf', 'gif'];
            $actualMimeType = $file->getMimeType();
            if (!in_array($extension, $validExtensions) || !str_contains($actualMimeType, $extension)) {
                return response()->json(['error' => 'Invalid file format'], 400);
            }
            Message::create([
                'conversation_id' => $conversationId,
                'content' => $path,
                'type' => $type,
                'sender_id' => $id,
                'file' => 1
            ]);
            event(new MessageSend($path, $conversationId, $id, $type, 1));
        }
        if ($message) {
            Message::create([
                'conversation_id' => $conversationId,
                'content' => $message,
                'type' => $type,
                'sender_id' => $id,
                'file' => 0
            ]);
            event(new MessageSend($message, $conversationId, $id, $type, 0));
        }
        return response()->json(['path' => $path]);
    }


    function getConversation(Request $request)
    {
        $id = $request->get('id');
        $conversation = Conversation::find($id);
        $conversation->update([
            'user_seen' => 1
        ]);
        $messages = $conversation->messages;
        return response()->json(['view' => view('admin.chat-box', compact('messages', 'conversation'))->render()]);
    }
    function updateConversation(Request $request)
    {
        $conversation = Conversation::find($request->get('id'));
        $conversation->update([
            'user_seen' => 0
        ]);
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        return response()->json(['view' => view('admin.chat-list', compact('conversations'))->render()]);
    }
}
