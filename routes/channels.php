<?php

use Illuminate\Support\Facades\Broadcast;
use App\Models\User;
use App\Models\Customer;
use App\Models\Conversation;
/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

// Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
//     return (int) $user->id === (int) $id;
// });
// Broadcast::routes(['middleware' => ['auth','auth.customer']]);
Broadcast::channel('messages.{conversationId}', function ($user, int $conversationId) {
    $chat = Conversation::findOrFail($conversationId);
    // Xác định kiểu người dùng và kiểm tra
    if ($user instanceof User) {
        return $user->id === $chat->user_id;
    } elseif ($user instanceof Customer) {
        return $user->id === $chat->customer_id;
    }

    return false; // Nếu không phải là User hoặc Customer, không cho phép truy cập
}, ['guards' => ['customers', 'web']]);
