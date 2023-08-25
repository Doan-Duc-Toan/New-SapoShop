<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Role;
use App\Models\Permission;

class RoleController extends Controller
{
    //
    function show()
    {
        $roles = Role::all();
        return view('admin.role.show', compact('roles'));
    }
    function add()
    {
        $permissions = Permission::all()->groupBy(function ($permission) {
            return explode('.', $permission->slug)[0];
        });
        // return $permissions;
        return view('admin.role.add', compact('permissions'));
    }
    function store(Request $request)
    {
        $validate = $request->validate([
            'name' => 'required|unique:roles|regex:/^[A-Za-z_ 0-9]{0,32}$/',
            'description' => 'string|required',
        ]);
        $role = Role::create([
            'name' => $request->input('name'),
            'description' => $request->input('description')
        ]);
        $role->permissions()->attach($request->input('permissions'));
        return redirect()->route('role.show')->with('status', 'Đã thêm vai trò thành công!');
    }
    function edit($id)
    {
        $permissions = Permission::all()->groupBy(function ($permission) {
            return explode('.', $permission->slug)[0];
        });
        $role = Role::find($id);   
        return view('admin.role.edit', compact('role','permissions'));
    }
    function update(Request $request, $id)
    {
        $role = Role::find($id);
        $validate = $request->validate([
            'name' => 'required|unique:roles,name,' . $role->id . '|regex:/^[A-Za-z_ 0-9]{0,32}$/',
            'description' => 'string|required',
        ]);
        $role->update([
            'name' => $request->input('name'),
            'description' => $request->input('description')
        ]);
        $role->permissions()->sync($request->input('permissions',[]));
        return redirect()->route('role.show')->with('status', 'Đã chỉnh sửa vai trò thành công!');
    }
    function delete($id){
     $role = Role::find($id);
     $role->delete();
     return redirect()->route('role.show')->with('status', 'Đã chỉnh xóa vai trò thành công!');
    }
}
