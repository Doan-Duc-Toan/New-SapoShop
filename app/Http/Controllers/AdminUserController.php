<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use App\Mail\SapoMail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Models\Role;

class AdminUserController extends Controller
{
    //
    function login()
    {

        return view('admin.login');
    }
    function login_handle(Request $request)
    {
        $validate = $request->validate(
            [
                'email' => 'required|email',
                'password' => 'required|regex:/^[A-Za-z0-9!@#$%^&*()_]{6,32}$/'
            ]
        );
        $email = $request->input('email');
        $password = $request->input('password');
        if (Auth::attempt(['email' => $email, 'password' => $password]))
            return redirect()->route('dashboard');
        else return redirect()->route('admin.login')->with('error', 'Thông tin đăng nhập không chính xác');
    }
    function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('admin.login');
    }
    function show(Request $request)
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();

        $status = $request->input('status');
        if (empty($status)) $status = 'active';
        if ($status == 'trash') {
            $users = User::onlyTrashed()->paginate(5);
            $acts = ['restore' => 'Khôi phục', 'force_delete' => 'Xóa vĩnh viễn'];
        } else {
            $acts = ['soft_delete' => 'Xóa tạm thời'];
            $users = User::paginate(5);
        }
        return view('admin.user.show', compact('users', 'status', 'acts', 'conversations', 'conversationIds', 'checkNew'));
    }
    function add()
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        $roles = Role::all();
        return view('admin.user.add', compact('roles', 'conversations', 'conversationIds', 'checkNew'));
    }
    function store(Request $request)
    {
        $validate = $request->validate(
            [
                'fullname' => 'required|regex:/^[A-Za-z ]{0,100}$/',
                'email' => 'required|unique:users|email',
                'password' => 'required|regex:/^[A-Za-z0-9!@#$%^&*()_]{6,32}$/',
                'phone' => 'required|regex:/^[0-9]{10}$/',
                'birth' => 'required|date',
                'gender' => 'required',
                'address' => 'required|string',
                'note' => 'string'
            ]
        );
        $user = User::create([
            'fullname' => $request->input('fullname'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
            'phone' => $request->input('phone'),
            'address' => $request->input('address'),
            'birth' => $request->input('birth'),
            'gender' => $request->input('gender'),
            'note' => $request->input('note'),
        ]);
        $user->roles()->attach($request->input('roles'));
        $data = [
            'fullname' => $request->input('fullname'),
            'email' => $request->input('email'),
            'password' => $request->input('password'),
        ];
        Mail::to($request->input('email'))
            ->send(new SapoMail($data));
        return redirect()->route('admin_user.show')->with('status', 'Đã thêm và gửi thông báo đến người dùng thành công');
    }
    function profile_show(Request $request, $id)
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        if ($request->input('status') == 'trash') {
            $status = 'trash';
            $user = User::onlyTrashed()->find($id);
        } else {
            $status = 'active';
            $user = User::find($id);
        }
        return view('admin.user.profile', compact('user', 'status', 'conversations', 'conversationIds', 'checkNew'));
    }

    function edit($id)
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        $roles = Role::all();
        $user = User::find($id);
        return view('admin.user.edit', compact('user', 'roles', 'conversations', 'conversationIds', 'checkNew'));
    }
    function update(Request $request, $id)
    {
        $user = User::find($id);
        $validate = $request->validate(
            [
                'phone' => 'required|regex:/^[0-9]{10}$/',
                'address' => 'required|string',
                'note' => 'string|nullable'
            ]
        );
        $user->update(
            [
                'phone' => $request->input('phone'),
                'address' => $request->input('address'),
                'note' => $request->input('note'),
            ]
        );
        $user->roles()->sync($request->input('roles', []));
        return redirect()->route('admin_user.show')->with('status', 'Đã cập nhật thông tin người dùng thành công');
    }
    function softdelete($id)
    {
        $user = User::find($id)->delete();
        return redirect()->route('admin_user.show')->with('status', 'Đã xóa người dùng thành công');
    }
    function restore($id)
    {
        $user = User::onlyTrashed()->where('id', $id)->restore();
        return redirect()->route('admin_user.show')->with('status', 'Đã khôi phục người dùng thành công');
    }
    function force_delete($id)
    {
        User::onlyTrashed()->where('id', $id)->forceDelete();
        return redirect()->route('admin_user.show')->with('status', 'Đã xóa vĩnh viễn người dùng thành công');
    }
    function search_ajax(Request $request)
    {
        if ($request->input('query')) {

            $query = $request->input('query');
            if ($request->input('status') == "trash") {
                $data = User::onlyTrashed()->where('fullname', 'LIKE', "%{$query}%")->get();
            } else
                $data = User::where('fullname', 'LIKE', "%{$query}%")->get();
            $output = '<ul class="dropdown-menu" style="display:block; position:relative">';
            foreach ($data as $row) {
                if ($request->input('status') == "trash") {
                    $output .= '
               <li><a href="' . route('admin_user.profile', [$row->id, '&status=trash']) . '">' . "  " . $row->id . "---" . $row->fullname . '</a></li>
               ';
                } else
                    $output .= '
               <li><a href="' . route('admin_user.profile', $row->id) . '">' . "  " . $row->id . "---" . $row->fullname . '</a></li>
               ';
            }
            $output .= '</ul>';
            echo $output;
        }
    }
    function action(Request $request)
    {
        $users = $request->input('list_check');
        if (empty($users)) {
            return redirect()->route('admin_user.show')->with('status', 'Bạn cần chọn user để thực hiện thao tác');
        } else
        if (empty($request->input('act'))) {
            return redirect()->route('admin_user.show')->with('status', 'Bạn cần chọn thao tác trước khi thực hiện');
        } else
        if ($request->input('act') == 'soft_delete') {
            foreach ($users as $user) {
                User::where('id', $user)->delete();
            }
            return  redirect()->route('admin_user.show')->with('status', 'Đã xóa tạm thời danh sách người dùng thành công');
        } else if ($request->input('act') == 'restore') {
            foreach ($users as $user) {
                User::onlyTrashed()->where('id', $user)->restore();
            }
            return redirect()->route('admin_user.show')->with('status', 'Đã khôi phục danh sách người dùng thành công');
        } else if ($request->input('act') == 'force_delete') {
            foreach ($users as $user) {
                User::onlyTrashed()->where('id', $user)->forceDelete();
            }
            return redirect()->route('admin_user.show')->with('status', 'Đã xóa vĩnh viễn danh sách người dùng thành công');
        }
    }
    function current_user()
    {
        $user = Auth::user();
        return view('admin.user.current', compact('user'));
    }
    function reset_password(Request $request)
    {
        $user = Auth::user();
        $old_pass = $request->input('old_password');
        if (Hash::check($old_pass, Auth::user()->password)) {
            // return "0";
            $validate = $request->validate([
                're_password' => 'required|regex:/^[A-Za-z0-9!@#$%^&*()_]{6,32}$/',
                'password_confirmation' => 'required|same:re_password'
            ]);
            $user->password = Hash::make($request->input('re_password'));
            $user->save();
            return redirect()->route('admin.login');
        } else return redirect()->back();
    }
    // function arrange(Request $request)
    // {
    //     if ($request->input('status') == 'trash') {
    //         if ($request->input('arrange') == 'name')
    //             $users = User::onlyTrashed()->orderBy('name')->get();
    //         else $users = User::onlyTrashed()->orderBy('role')->get();
    //     } else {
    //         if ($request->input('arrange') == 'name')
    //             $users = User::orderBy('name')->get();
    //         else $users = User::orderBy('role')->get();
    //     }
    //     return redirect()->route('admin_user.show',compact('users'));
    // }
}
