$(document).ready(function () {
    var conversationIds = $('#list-conversation').data('conversation-ids');
    var conversationId = '';
    var globalFile = null;

    conversationIds.forEach(id => {
        console.log(id);
        window.Echo.private('messages.' + id)
            .listen('.chat', (e) => {
                if (e.type === 'customer') {
                    $("#chat-online").addClass('chat-new-message');
                    if (conversationId == e.conversationId) {
                        let html;
                        if (e.file == 1) {
                            let imgUrl = 'http://localhost/Toan/public/storage/' + e.message;
                            html = '<li class="clearfix">'
                                + '<div class="message-data">'
                                + '</div>'
                                + '<div class="message my-message message-img">'
                                + '<img src="' + imgUrl + '" alt="">'
                                + '</div>'
                                + '</li>'
                        }
                        else {
                            html = '<li class="clearfix">' +
                                '<div class="message-data">' +
                                '</div>' +
                                '<div class="message my-message">' + e.message + '</div>' +
                                '</li>'
                        }

                        $("#list-messages").append(html);
                        let $myDiv = $('#list-messages');
                        $myDiv.animate({
                            scrollTop: $myDiv.prop("scrollHeight")
                        }, 1000);
                    }
                    else {
                        $.ajax({
                            url: "/Toan/chat/updateConversation",
                            type: 'GET',
                            data: {
                                id: e.conversationId
                            },
                            success: function (response) {
                                $("#list-conversation").html(response.view);
                            },
                            error: function (xhr, status, error) {
                                console.error('Error: ', error);
                            }
                        });
                    }
                }
            });
    });

    ///////////send message client/////////
    $("#chatbox").on('submit', '#form-send-message', function (e) {
        e.preventDefault();
        let message = $(".publisher-input").val().trim();
        if (message.length > 0 || globalFile) {
            let formData = new FormData(this);
            formData.append('message', message);
            formData.append('type', 'user');
            formData.append('file', globalFile);
            formData.append('conversationId', conversationId)
            $.ajax({
                url: $(this).data('url'),
                type: 'POST',
                _token: $('meta[name="csrf-token"]').attr('content'),
                contentType: false,
                processData: false,
                data: formData,
                success: function (response) {
                    console.log(response.path);
                    if (response.path) {
                        let imgUrl = 'http://localhost/Toan/public/storage/' + response.path;
                        let html = '<li class="clearfix">'
                            + '<div class="message-data">'
                            + '</div>'
                            + '<div class="message other-message float-right message-img">'
                            + '<img src="' + imgUrl + '" alt="">'
                            + '</div>'
                            + '</li>'
                        $("#list-messages").append(html);
                        $('#preview').removeClass('d-flex-img');
                        globalFile = null;
                        $('#img-file').val('');
                    }
                    if (message.length > 0) {
                        let html = '<li class="clearfix">' +
                            '<div class="message-data text-right">' +
                            '</div>' +
                            '<div class="message other-message float-right">' + message + '</div>' +
                            '</li>';
                        $("#list-messages").append(html);
                        $(".publisher-input").val('');
                    }

                    $("#list-messages").animate({
                        scrollTop: $("#list-messages").prop("scrollHeight")
                    }, 1000);
                },
                error: function (xhr, status, error) {
                    console.error('Error: ', xhr.responseText);
                }
            });
        }
    });



    ///////////click conversation to get id///////////
    $("#list-conversation").on('click', '.conversation-item', function () {
        $(".conversation-item").removeClass("active");
        $(this).addClass("active");
        $(this).removeClass("not-seen");
        let id = $(this).data('conversation-id');
        conversationId = id;
        eventMessage = "messages." + conversationId;
        $.ajax({
            url: "/Toan/chat/getConversation",
            type: 'GET',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
                id: id
            },
            success: function (response) {
                $("#chatbox").html(response.view);
                let $myDiv = $('#list-messages');
                $myDiv.animate({
                    scrollTop: $myDiv.prop("scrollHeight")
                }, 1000);
            },
            error: function (xhr, status, error) {
                console.error('Error: ', error);
            }
        });
    })

    // var emojiKeyboard = new EmojiKeyboard();
    // emojiKeyboard.instantiate(document.getElementById("emoji-pick"));

    // const output = document.getElementById("output");
    // emojiKeyboard.callback = (emoji, closed) => {
    //     console.info(emoji, closed);
    //     output.value += emoji.emoji; // Sử dụng 'value' thay cho 'innerText'
    // };

    // emojiKeyboard.resizable = true;
    // emojiKeyboard.auto_reconstruction = true;
    // emojiKeyboard.default_placeholder = "Search Emoji...";
    // $("#emojikb-maindiv").addClass("emojikb-hidden");
    $(document).on('click', '#emoji-pick', function () {
        if (!window.emojiKeyboard) {
            window.emojiKeyboard = new EmojiKeyboard();
            window.emojiKeyboard.instantiate(this);
            const output = document.getElementById("output");
            window.emojiKeyboard.callback = (emoji, closed) => {
                console.info(emoji, closed);
                output.value += emoji.emoji; // Sử dụng 'value' thay cho 'innerText'
            };
            window.emojiKeyboard.resizable = true;
            window.emojiKeyboard.auto_reconstruction = true;
            window.emojiKeyboard.default_placeholder = "Search Emoji...";
            $("#emojikb-maindiv").addClass("emojikb-hidden");
        }
    });


    $('#chatbox').on('change', '#img-file', function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imagePreview').attr('src', e.target.result);
            $('#preview').addClass('d-flex-img');

        }
        reader.readAsDataURL(this.files[0]);
        globalFile = this.files[0];
        $(".delete-img").click(function () {
            $('#preview').removeClass('d-flex-img');
            globalFile = null;
            $('#img-file').val('');
        })
    });

})