<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <h3>Thông báo đến thành viên mới của SapoWeb</h3>
    <span>Xin chào <b>{{$data['fullname']}}</b></span><br><br>
    <span>
        Xin chúc mừng bạn đã trở thành một thành viên của Sapo. <br>
        Tôi với tư cách là người đứng đầu của Sapo xin gửi tới bạn lời cảm ơn chân thành nhất khi đã quyết định đồng hành cùng chúng tôi trong khoảng thời gian sắp tới.
    </span><br>
    <span>
        Dưới đây là tên đăng nhập và tài khoản của bạn: <br>
        Tên đăng nhập: <b>{{$data['email']}}</b> <br>
        Mật khẩu: <b>{{$data['password']}}</b>
    </span><br>
    <span><b>Kể từ khi bạn nhìn thấy mail này</b>, vui lòng truy cập đến <b><a href="#">Sapo.vn</a></b> để <b>đổi mật khẩu ngay lập tức</b> tránh tình trạng bị rò rỉ thông tin.</span> 
    <br>
    <span>Một lần nữa tôi xin chân thành cảm ơn bạn đã đến với Sapo và rất mong được đồng hành với bạn trong thời gian tới.</span> 

</body>
</html>