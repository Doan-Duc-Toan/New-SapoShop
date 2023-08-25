<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('client/css/login.css') }}">
    <title>Document</title>
</head>

<body>
    <div id="wrapper">
        <div id="content">
            <h1>Đăng ký tài khoản</h1>
            <div id="login">
                <form action="{{ route('client.register_handle') }}" method="POST">
                    @csrf
                    <input type="text" name="fullname" value="{{ old('fullname') }}" placeholder="Họ và Tên">
                    @error('fullname')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="text" name="phone" placeholder="Số điện thoại" value="{{ old('phone') }}">
                    @error('phone')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="email" name="email" placeholder="E-mail" id="email"
                        value="{{ old('email') }}">
                    @error('email')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="password" name="password" placeholder="Password" id="password">
                    @error('password')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="text" name="address" placeholder="Địa chỉ" id="address" value ="{{old('address')}}">
                    @error('address')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <select name="gender" id="gender">
                        <option value="male">Nam</option>
                        <option value="female">Nữ</option>
                    </select>
                    <div id="button">
                        <button name="btn_register" value="register">Đăng ký</button>
                        <a href="{{ route('client.login') }}">Đăng nhập</a>
                    </div>
                </form>
            </div>
            <div id="bottom">
                <div id="title">
                    <span>Bạn đã có tài khoản?</span>
                </div>
                <div class="btn-bot"><a href="{{ route('client.login') }}">Đăng nhập</a></div>
                <div class="btn-bot"><a href="{{ route('client.index') }}">Quay lại trang chủ</a></div>
            </div>
        </div>
    </div>
</body>

</html>
