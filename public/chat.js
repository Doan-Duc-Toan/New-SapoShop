$(document).ready(function () {
    $(".chat-click").click(function () {
        $("#page-content").stop().slideToggle();
        var $myDiv = $('#chat-content');
        $myDiv.animate({
            scrollTop: $myDiv.prop("scrollHeight")
        }, 1000);
    })

    var conversationId = $("#page-content").data('id');
    eventMessage = "messages." + conversationId
    window.Echo.private(eventMessage)
        .listen('.chat', (e) => {
            if (e.type == 'user') {
                let view = '<div class="media media-chat">' +
                    '<div class="media-body">' +
                    '<p>' + e.message + '</p>' +
                    '</div>' +
                    '</div>'
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
        let message = $(".publisher-input").val();

        let type = $("#page-content").data('type');
        let html = '<div class="media media-chat media-chat-reverse">'
            + '<div class="media-body">'
            + '<p>' + message + '</p>'
            + '</div>'
            + '</div>'
        $("#chat-content").append(html);
        let url = $(this).data('url');

        $(".publisher-input").val('');
        let $myDiv = $('#chat-content');
        $myDiv.animate({
            scrollTop: $myDiv.prop("scrollHeight")
        }, 1000);

        $.ajax({
            url: url,
            type: 'GET',
            data: {
                _token: '{{ csrf_token() }}',
                message: message,
                conversationId: conversationId,
                type: type
            },
            success: function (response) {
                console.log(response.mess);
            },
            error: function (xhr, status, error) {
                console.error('Error: ', error);
            }
        });
    })

    ///////////click conversation to get id///////////
    $(".conversation-item").click(function () {
        let id = $(this).data('conversation-id');
        conversationId = id;
        eventMessage = "messages." + conversationId;
        $.ajax({
            url: "/Sapo/chat/getConversation",
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

})