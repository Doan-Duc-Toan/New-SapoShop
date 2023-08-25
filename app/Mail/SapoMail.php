<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Mail\Mailables\Address;
use Illuminate\Queue\SerializesModels;

class SapoMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */
    public $data;
    public function __construct($data)
    {
        //
        $this->data  = $data;
    }

    /**
     * Get the message envelope.
     */
    // public function build()
    // {
    //     return $this->from('toanymanh@gmail.com')
    //                 ->view('admin.mail.sapomail')
    //                 ->text('mails.demo_plain')
    //                 ->with(
    //                   [
    //                         'testVarOne' => '1',
    //                         'testVarTwo' => '2',
    //                   ])
    //                   ->attach(public_path('/images').'/demo.jpg', [
    //                           'as' => 'demo.jpg',
    //                           'mime' => 'image/jpeg',
    //                   ]);
    // }
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'SapoShop chào mừng thành viên mới ',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'admin.mail.sapomail',
            with: $this->data
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
