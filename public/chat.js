$(document).ready(function () {
    $(".chat-click").click(function () {
        $(this).removeClass("new-message")
        $("#page-content").stop().slideToggle();
        var $myDiv = $('#chat-content');
        $myDiv.animate({
            scrollTop: $myDiv.prop("scrollHeight")
        }, 1000);
    })

    var conversationId = $("#page-content").data('id');
    var globalFile = null;
    eventMessage = "messages." + conversationId
    window.Echo.private(eventMessage)
        .listen('.chat', (e) => {
            if (e.type == 'user') {
                if ($('#page-content').is(':visible')) {
                    $(".chat-click").removeClass('new-message')
                }
                else {
                    $(".chat-click").addClass('new-message')
                }
                let view
                if (e.file == 1) {
                    let imgUrl = 'http://localhost/Toan/public/storage/' + e.message;
                    view = '<div class="media media-chat message-img">'
                        + '<div class="media-body">'
                        + '<img src="' + imgUrl + '" alt="">'
                        + '</div>'
                        + '</div>'
                }
                else {
                    view = '<div class="media media-chat">' +
                        '<div class="media-body">' +
                        '<p>' + e.message + '</p>' +
                        '</div>' +
                        '</div>'
                }

                $("#chat-content").append(view);
                let $myDiv = $('#chat-content');
                $myDiv.animate({
                    scrollTop: $myDiv.prop("scrollHeight")
                }, 1000);
            }

        });


    ///////////send message client/////////
    $("#form-send-message").submit(function (e) {
        e.preventDefault();
        let message = $(".publisher-input").val().trim();
        if (message.length > 0 || globalFile) {
            let type = $("#page-content").data('type');
            let url = $(this).data('url');
            let formData = new FormData(this);
            formData.append('message', message);
            formData.append('type', type);
            formData.append('file', globalFile);
            formData.append('conversationId', conversationId)

            $.ajax({
                url: url,
                type: 'POST',
                _token: $('meta[name="csrf-token"]').attr('content'),
                data: formData,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response.path) {
                        let imgUrl = 'http://localhost/Toan/public/storage/' + response.path;
                        let html = '<div class="media media-chat media-chat-reverse message-img">'
                            + '<div class="media-body">'
                            + '<img src="' + imgUrl + '" alt="">'
                            + '</div>'
                            + '</div>'
                        $("#chat-content").append(html);
                        $('#preview').removeClass('d-flex-img');
                        globalFile = null;
                        $('#img-file').val('');
                    }
                    if (message.length > 0) {
                        let html = '<div class="media media-chat media-chat-reverse">'
                            + '<div class="media-body">'
                            + '<p>' + message + '</p>'
                            + '</div>'
                            + '</div>'
                        $("#chat-content").append(html);
                        $(".publisher-input").val('');
                    }
                   

                    let $myDiv = $('#chat-content');
                    $myDiv.animate({
                        scrollTop: $myDiv.prop("scrollHeight")
                    }, 1000);
                    
                },
                error: function (xhr, status, error) {
                    console.error('Error: ', error);
                }
            });
        }
    })

    ///////////click conversation to get id///////////
    $(".conversation-item").click(function () {
        let id = $(this).data('conversation-id');
        conversationId = id;
        eventMessage = "messages." + conversationId;
        $.ajax({
            url: "/Toan/chat/getConversation",
            type: 'GET',
            data: {
                _token: '{{ csrf_token() }}',
                id: id
            },
            success: function (response) {
                $("#chatbox").html(response.view)
            },
            error: function (xhr, status, error) {
                console.error('Error: ', error);
            }
        });
    })



    var emojiKeyboard = new EmojiKeyboard();
    emojiKeyboard.instantiate(document.getElementById("test"));

    const output = document.getElementById("output");
    emojiKeyboard.callback = (emoji, closed) => {
        console.info(emoji, closed);
        output.value += emoji.emoji; // Sử dụng 'value' thay cho 'innerText'
    };

    emojiKeyboard.resizable = true;
    emojiKeyboard.auto_reconstruction = true;
    emojiKeyboard.default_placeholder = "Search Emoji...";
    $("#emojikb-maindiv").addClass("emojikb-hidden");

    $('#img-file').change(function () {
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