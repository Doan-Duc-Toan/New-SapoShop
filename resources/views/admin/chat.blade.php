<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link rel="stylesheet" href="{{ asset('css/chat.css') }}">
    <link rel="stylesheet" href="{{ asset('twemoji-emoji-keyboard/emoji_keyboard.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <title>Document</title>
</head>

<body>
    <style>
        .input-group-text {
            height: 100%;
        }
    </style>
    <div class="container">
        <div class="row clearfix">
            <div class="col-lg-12">
                <div class="card chat-app">
                    <div id="plist" class="people-list">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                {{-- <span class="input-group-text"><i class="fa fa-search"></i></span> --}}
                                <span class="input-group-text">Danh sách khách hàng</span>
                            </div>
                            {{-- <input type="text" class="form-control" placeholder="Search..."> --}}
                        </div>
                        <ul id="list-conversation" class="list-unstyled chat-list mt-2 mb-0"
                            data-conversation-ids="@json($conversationIds)">
                            @include('admin.chat-list', ['conversations' => $conversations])
                        </ul>
                    </div>
                    <div class="chat" id="chatbox">
                        <span id="pick-conversation">Hãy chọn 1 cuộc trò chuyện để bắt đầu</span>
                        {{-- @include('admin.chat-box') --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="{{ asset('js/jquery.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fuse.js/7.0.0/fuse.min.js"></script>
<script src="{{ asset('twemoji-emoji-keyboard/emoji_keyboard.js') }}"></script>
<script src="{{ asset('chat-client.js') }}"></script>

</html>
