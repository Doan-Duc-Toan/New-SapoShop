$(document).ready(function () {
    var conversationIds = $('#list-conversation').data('conversation-ids');
    var conversationId = '';
    // Bây giờ bạn có thể sử dụng `conversationIds` như một mảng
    conversationIds.forEach(id => {
        console.log(id);
        window.Echo.private('messages.' + id)
            .listen('.chat', (e) => {
                if (e.type === 'customer') {
                    if (conversationId == e.conversationId) {
                        let html = '<li class="clearfix">' +
                            '<div class="message-data">' +
                            // '<span class="message-data-time">' + '10:10 AM, Today' + '</span>' +
                            '</div>' +
                            '<div class="message my-message">' + e.message + '</div>' +
                            '</li>'
                        $("#list-messages").append(html);
                        let $myDiv = $('#list-messages');
                        $myDiv.animate({
                            scrollTop: $myDiv.prop("scrollHeight")
                        }, 1000);
                    }
                }
            });
    });

    ///////////send message client/////////
    $("#chatbox").on('submit', '#form-send-message', function (e) {
        e.preventDefault();
        let message = $(".publisher-input").val().trim();
        if (message.length > 0) {
            let type = 'user';
            let url = $(this).data('url');
            let html = '<li class="clearfix">' +
                '<div class="message-data text-right">' +
                // '<span class="message-data-time">' + '10:10 AM, Today' + '</span>' +
                '</div>' +
                '<div class="message other-message float-right">' + message + '</div>' +
                '</li>'
            $("#list-messages").append(html);
            $(".publisher-input").val('');

            let $myDiv = $('#list-messages');
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
        }
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


})