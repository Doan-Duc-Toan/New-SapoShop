<div class="page-content page-container" id="page-content" data-type = "customer" data-id="{{ $conversation->id }}">
    <div class="padding">
        <div class="row container d-flex justify-content-center" id="box-form">
            <form id="form-send-message" enctype="multipart/form-data" data-url = "{{ route('chat.send') }}" method="POST"
                class="col-md-12">
                @csrf
                <div class="card card-bordered">
                    <div class="card-header">
                        <h4 class="card-title"><strong>Trò chuyện với chúng tôi</strong></h4>
                        {{-- <a class="btn btn-xs btn-secondary" href="#" data-abc="true">Let's Chat App</a> --}}
                    </div>


                    <div class="ps-container ps-theme-default ps-active-y" id="chat-content"
                        style="overflow-y: scroll !important; height:400px !important;">
                        @if (!empty($messages->first()))
                            @foreach ($messages as $message)
                                @if ($message->type == 'customer')
                                    @if ($message->file)
                                        <div class="media media-chat media-chat-reverse message-img">
                                            <div class="media-body">
                                                <img src="{{ asset('storage/'.$message->content ) }}" alt="">
                                            </div>
                                        </div>
                                    @else
                                        <div class="media media-chat media-chat-reverse">
                                            <div class="media-body">
                                                <p>{{ $message->content }}</p>
                                            </div>
                                        </div>
                                    @endif
                                @else
                                    @if ($message->file)
                                        <div class="media media-chat message-img">
                                            <div class="media-body">
                                                <img src="{{ asset('storage/'.$message->content ) }}" alt="">
                                            </div>
                                        </div>
                                    @else
                                        <div class="media media-chat">
                                            <div class="media-body">
                                                <p>{{ $message->content }}</p>
                                            </div>
                                        </div>
                                    @endif
                                @endif
                            @endforeach
                        @else
                            <span
                                style="text-align:center;padding:10px 15px;display:inline-block;font-size:16px;color: #000000;font-weight:bold">Hãy
                                đặt
                                câu hỏi cho nhân viên chúng tôi để
                                được tư vấn</span>
                        @endif

                    </div>

                    <div id="form-input-message" class="publisher bt-1 border-light">
                        <div id="preview">
                            <div class="img-preview">
                                <img id="imagePreview" src="" alt="">
                                <span class="delete-img"><i class="fa-solid fa-xmark"></i></span>
                            </div>
                        </div>
                        <img class="avatar avatar-xs" src="{{ asset('client/img/account.webp') }}" alt="...">

                        <input class="publisher-input" id="output" type="text" placeholder="Write something">

                        <span class="publisher-btn file-group">
                            <label for="img-file"><i class="fa-solid fa-paperclip"></i></label>
                            <input type="file" id="img-file">
                        </span>
                        <span id="test" class="emoji-picker-container publisher-btn"><i
                                class="fa fa-smile"></i></span>
                        {{-- <a class="publisher-btn text-info" href="#" data-abc="true"><i
                                class="fa fa-paper-plane"></i></a> --}}
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>
