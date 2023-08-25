<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{asset('client/css/login.css')}}">
    <title>Đăng nhập</title>
</head>
<body>
    <style>
        #error-notify{
            padding: 10px 15px;
            border-radius: 10px;
            font-size: 17px;
            font-weight: 600;
            color: rgb(241, 84, 84);
        }
    </style>
    <div id="wrapper">
        <div id="content">
            
             <h1>Lấy lại mật khẩu</h1>
              <div id="login">
                  <form action="{{route('client.reset_pass')}}" method="POST">
                    @csrf
                    <input type="email" placeholder="Nhập E-mail để lấy lại mật khẩu" name="email" id="email">
                    @error('email')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <div id="button">
                        <button name="btn_reset">Lấy mật khẩu</button>
                        <a href="{{route('client.login')}}">Đăng nhập</a>
                    </div>
                  </form>
              </div> 
              <div id="error-notify">
                <span>{{session('error')}}</span>
            </div>
              <div id="register">
                    <div id="title">
                        <span>Bạn chưa có tài khoản?</span>
                    </div>
                    <div class="btn-bot" id="create"><a href="{{route('client.register')}}">Đăng ký</a></div>
                    <div class="btn-bot" id="back"><a href="{{route('client.index')}}">Quay lại trang chủ</a></div>
              </div>
        </div>
    </div>
</body>
</html>