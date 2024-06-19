<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MessageSend implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Create a new event instance.
     */
    public $message;
    public $conversationId;
    public $id;
    public $type;
    public $file;
    public function __construct($message, $conversationId, $id, $type, $file)
    {
        //
        $this->message = $message;
        $this->conversationId = $conversationId;
        $this->id = $id;
        $this->type = $type;
        $this->file = $file;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return array<int, \Illuminate\Broadcasting\Channel>
     */
    // public function broadcastOn()
    // {
    //     // return [
    //     //     new PrivateChannel('channel-name'),
    //     // ];
    //     return new Channel('messages');
    // }
    public function broadcastOn(): Channel
    {
        return new PrivateChannel('messages.' . $this->conversationId);
    }
    public function broadcastAs(): string
    {

        return 'chat';
    }
}
