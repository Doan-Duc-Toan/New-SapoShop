<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{ asset('css/login.css') }}">
    <title>Đăng nhập</title>
</head>

<body>
    <style>
        small {
            color: rgb(244, 79, 79);
        }
        .error{
            color: rgb(244, 79, 79);
        }
    </style>
    <div id="wrapper">
        <div id="login">
            <h3>Đăng nhập</h3>
            <br>
            <br>
            <form action="{{ route('admin.login_handle') }}" method="POST">
                @csrf
                <label for="username">Tên đăng nhập</label>
                <input type="text" name="email" id="username">
                @error('email')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
                <label for="password">Mật khẩu</label>
                <input type="password" name="password" id="password">
                @error('password')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
                <button name="btn_login" value="login">Đăng nhập</button>
                @if (session('error'))
                    <div class="error">
                        {{ session('error') }}
                    </div>
                @endif
            </form>
        </div>
    </div>
</body>

</html>
