$(document).ready(function () {
    $(".chat-click").click(function () {
        $("#page-content").stop().slideToggle();
    })
    if (typeof window.Echo !== 'undefined') {
        console.log("ok");
        window.Echo.channel('messages')
        .listen('.chat', (e) => {
            alert("Received message: " + e.message); 
            $('.publisher-input').val(e.message);
        });
    } else {
        console.error('Lỗi Laravel Echo');
    }
})