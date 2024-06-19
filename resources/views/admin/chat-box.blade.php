<div class="chat-header clearfix">
    <div class="row">
        <div class="col-lg-6">
            <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                <img src="{{ asset('img/user.png') }}" alt="avatar">
            </a>
            <div class="chat-about">
                <h6 class="m-b-0">{{ $conversation->customer->fullname }}</h6>
                {{-- <small>Last seen: 2 hours ago</small> --}}
            </div>
        </div>
        <div class="col-lg-6 hidden-sm text-right">
            {{-- <a href="" class="btn btn-outline-secondary"><i class="fa fa-camera"></i></a> --}}
            <label for="img-file" style="margin:0" class="btn btn-outline-primary"><i class="fa fa-image"></i></label>
            <input type="file" id="img-file">
            <span id="emoji-pick" class="btn btn-outline-info"><i class="fa-solid fa-face-smile"></i></span>
            <a href="{{ route('dashboard') }}" class="btn btn-outline-warning"><i class="fa-solid fa-house"></i></a>
        </div>
    </div>
</div>
<div class="chat-history">
    <ul class="m-b-0" id="list-messages">
        @if ($messages)
            @foreach ($messages as $message)
                @if ($message->type == 'customer')
                    @if ($message->file)
                        <li class="clearfix">
                            <div class="message-data">
                            </div>
                            <div class="message my-message message-img"><img src="{{ asset('storage/'.$message->content ) }}"
                                    alt=""></div>
                        </li>
                    @else
                        <li class="clearfix">
                            <div class="message-data">
                            </div>
                            <div class="message my-message">{{ $message->content }}</div>
                        </li>
                    @endif
                @else
                    @if ($message->file)
                        <li class="clearfix">
                            <div class="message-data">
                            </div>
                            <div class="message other-message float-right message-img"><img src="{{ asset('storage/'.$message->content ) }}"
                                    alt=""></div>
                        </li>
                    @else
                        <li class="clearfix">
                            <div class="message-data text-right">
                            </div>
                            <div class="message other-message float-right">{{ $message->content }}</div>
                        </li>
                    @endif
                @endif
            @endforeach
        @endif

    </ul>
</div>
<form id="form-send-message" data-url = "{{ route('chat.sendToCustomer') }}" class="chat-message clearfix"
    method="POST">
    @csrf
    <div id="preview">
        <div class="img-preview">
            <img id="imagePreview" src="" alt="">
            <span class="delete-img"><i class="fa-solid fa-xmark"></i></span>
        </div>
    </div>
    <div class="input-group mb-0">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fa-solid fa-paper-plane"></i></span>
        </div>
        <input type="text" id="output" class="form-control publisher-input" placeholder="Enter text here...">
    </div>
</form>
