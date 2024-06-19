<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PermissionController extends Controller
{
    //
    function show()
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        $permissions = Permission::all()->groupBy(function ($permission) {
            return explode('.', $permission->slug)[0];
        });
        return view('admin.permission.show', compact('permissions', 'conversations', 'conversationIds', 'checkNew'));
    }
    function store(Request $request)
    {
        $validate = $request->validate([
            'name' => 'required|unique:permissions|regex:/^[A-Za-z_ 0-9]{6,32}$/',
            'slug' => 'required|unique:permissions|regex:/^[A-Za-z_\- 0-9\.]{0,20}$/',
            'description' => 'string|nullable',
        ]);
        Permission::create([
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'description' => $request->input('description')
        ]);
        return redirect()->route('permission.show')->with('status', 'Đã thêm quyền thành công');
    }
    function edit($id)
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        $permission = Permission::find($id);
        return view('admin.permission.edit', compact('permission', 'conversations', 'conversationIds', 'checkNew'));
    }
    function update(Request $request, $id)
    {
        $permission = Permission::find($id);
        $validate = $request->validate([
            'name' => 'required|unique:permissions,name,' . $permission->id . '|regex:/^[A-Za-z_ 0-9]{6,32}$/',
            'slug' => 'required|unique:permissions,name,' . $permission->id . '|regex:/^[A-Za-z_\- 0-9\.]{0,20}$/',
            'description' => 'string|nullable',
        ]);
        Permission::where('id', $id)->update([
            'name' => $request->input('name'),
            'slug' => $request->input('slug'),
            'description' => $request->input('description')
        ]);

        return redirect()->route('permission.show')->with('status', 'Đã chỉnh sửa quyền thành công');
    }
    function delete($id){
        Permission::where('id', $id)->delete();
        return redirect()->route('permission.show')->with('status', 'Đã xóa quyền thành công');
    }
}
