<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cat;
use Illuminate\Support\Facades\Auth;
class CatController extends Controller
{
    //
    function add()
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        return view('admin.cat.add',compact(['conversations', 'conversationIds', 'checkNew']));
    }
    function store(Request $request)
    {
        $validate = $request->validate([
            'name' => 'required|string|unique:cats',
            'description' => 'required|string|'
        ]);
        Cat::create([
            'name' => $request->input('name'),
            'description' => $request->input('description'),
        ]);
        return redirect()->route('cat.show')->with('status', 'Đã thêm danh mục thành công');
    }
    function show()
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        $cats = Cat::all();
        return view('admin.cat.show', compact('cats', 'conversations', 'conversationIds', 'checkNew'));
    }
    function detail($id)
    {
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        $cat = Cat::find($id);
        return view('admin.cat.detail', compact('cat', 'conversations', 'conversationIds', 'checkNew'));
    }
    function action($id, Request $request)
    {
        $cat = Cat::find($id);
        if ($request->input('btn_act') == 'update') {
            $validate = $request->validate([
                'name' => 'required|string|unique:cats,name,' . $cat->id,
                'description' => 'required|string|'
            ]);
            $cat->update([
                'name' => $request->input('name'),
                'description' => $request->input('description'),
            ]);
            return redirect()->route('cat.show')->with('status', 'Đã cập nhật danh mục thành công');
        } else if ($request->input('btn_act') == 'delete') {
            $cat->delete();
            return redirect()->route('cat.show')->with('status', 'Đã xóa danh mục thành công');
        }
    }
}
