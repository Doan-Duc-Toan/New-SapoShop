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
            <h1>Chỉnh sửa thông tin cá nhân</h1>
            <div id="login">
                <form action="{{ route('client.profile_update') }}" method="POST">
                    @csrf
                    <input type="text" name="fullname" placeholder="Họ và Tên" value="{{ $customer->fullname }}">
                    @error('fullname')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="text" name="phone" placeholder="Số điện thoại" value="{{ $customer->phone }}">
                    @error('phone')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="email" name="email" placeholder="E-mail" id="email"
                        value="{{ $customer->email }}">
                    @error('email')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <input type="text" name="address" value="{{ $customer->address }}" placeholder="Địa chỉ"
                        id="address">
                    @error('address')
                        <small style="color:rgb(232, 30, 30); font-weight:700;font-size:16px;">{{ $message }}</small>
                    @enderror
                    <select name="gender" id="gender">
                        <option value="male" @php if($customer->gender == 'male') echo "selected"; @endphp>Nam</option>
                        <option value="female" @php if($customer->gender == 'female') echo "selected"; @endphp>Nữ</option>
                    </select>
                    <div id="button">
                        <button name="btn_update" value="update">Cập nhật</button>
                        <a href="{{ route('client.profile') }}">Quay lại</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
