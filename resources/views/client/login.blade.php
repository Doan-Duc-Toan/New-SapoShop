<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{asset('client/css/login.css')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="{{ asset('client/js/jquery.js') }}"></script>
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
        /* ----------------------Toast-------------------- */
        .wr-toast {
            position: fixed;
            top: 30px;
            right: 15px;
            display: none;
            z-index: 1000;
        }

        .toast-notify {
            display: flex;
            width: 450px;
            height: 70px;
            background-color: #FFFFFF;
            border: 1px solid #DEE2E6;
            border-left: 5px solid #4cd137;
            box-shadow: 4px 4px 4px rgb(168 168 168 / 25%);
        }

        .center {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .toast-icon {
            flex-basis: 50px;
        }

        .toast-icon span {
            height: 22px;
            width: 22px;
            border-radius: 50%;
            background-color: #4cd137;
        }

        .toast-icon span i {
            color: #f5efef;
        }

        .toast-body {
            padding-top: 10px;
        }

        .toast-body .toast-content {
            color: #68687C;
        }

        .toast-x {
            position: absolute;
            right: 12px;
            top: 30%;
            cursor: pointer;
        }

        .toast-x span {
            color: #68687C;
        }

        .toast-x span:hover {
            color: #4c4c4c;
        }
    </style>
     <link rel="stylesheet" href="{{asset('client/css/toast-respon.css')}}">
    @if (!empty(session('status')))
            <script>
                $(document).ready(function() {
                    setTimeout(function() {
                        $(".wr-toast").show(500)
                    }, 0)
                    setTimeout(function() {
                        $(".wr-toast").hide(500); // Ẩn trong 0.5 giây
                    }, 4000);
                    $('.toast-x').click(function() {
                        $(".toast-notify").hide(500);
                    })
                })
            </script>
            <div class="wr-toast">
                <div class="toast-notify">
                    <div class="toast-icon center">
                        <span class="center"><i class="fa-solid fa-check"></i></span>
                    </div>
                    <div class="toast-body">
                        <span class="toast-title">
                            <b>Thành công</b>
                        </span><br>
                        <span class="toast-content">
                            {{session('status')}}
                        </span>
                    </div>
                    <div class="toast-x">
                        <span><i class="fa-solid fa-x"></i></span>
                    </div>
                </div>
            </div>
        @endif
        @if (!empty(session('notify')))
            <script>
                $(document).ready(function() {
                    setTimeout(function() {
                        $(".wr-toast").show(500)
                    }, 0)
                    setTimeout(function() {
                        $(".wr-toast").hide(500); // Ẩn trong 0.5 giây
                    }, 4000);
                    $('.toast-x').click(function() {
                        $(".toast-notify").hide(500);
                    })
                })
            </script>
            <div class="wr-toast">
                <div class="toast-notify" style="border-left: 5px solid #EA2027 !important;">
                    <div class="toast-icon center">
                        <span class="center" style= "background-color:#EA2027 !important;color: #FFFFFF; font-size:17px;">!</span>
                    </div>
                    <div class="toast-body">
                        <span class="toast-title">
                            <b>Thông báo</b>
                        </span><br>
                        <span class="toast-content">
                            {{session('notify')}}
                        </span>
                    </div>
                    <div class="toast-x">
                        <span><i class="fa-solid fa-x"></i></span>
                    </div>
                </div>
            </div>
        @endif
    <div id="wrapper">
        
        <div id="content">
            
             <h1>Đăng nhập</h1>
              <div id="login">
                  <form action="{{route('client.login_handle')}}" method="POST">
                    @csrf
                    <input type="email" value ="{{old('email')}}" placeholder="E-mail" name="email" id="email">
                    @error('email')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="password" placeholder="Password" name="password" id="password">
                    @error('password')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <div id="button">
                        <button name="btn_login" value="login">Đăng nhập</button>
                        <a href="{{ route('client.recover_pass') }}">Quên mật khẩu?</a>
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