<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;
class CustomerController extends Controller
{
    //
    function show(){
        $customers = Customer::get();
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $checkNew = $conversations->where('user_seen', 0)->count();
        return view('admin.customer.show',compact('customers', 'conversations', 'conversationIds', 'checkNew'));
    }
    function profile($id){
        $customers = Customer::get();
        $conversations = Auth::user()->conversations->sortByDesc('updated_at');
        $conversationIds = $conversations->pluck('id');
        $customer = Customer::find($id);
        return view('admin.customer.profile',compact('customer', 'conversations', 'conversationIds', 'checkNew'));
    }
     function search_ajax(Request $request)
    {
        if ($request->input('query')) {

            $query = $request->input('query');
            $data = Customer::where('fullname', 'LIKE', "%{$query}%")->get();
            $output = '<ul class="dropdown-menu" style="display:block; position:relative">';
            foreach ($data as $row) {
                $output .= '
               <li><a href="' . route('customer.profile', $row->id) . '">' . "  " . $row->id . "---" . $row->fullname . '</a></li>
               ';
            }
            $output .= '</ul>';
            echo $output;
        }
    }
    function update(Request $request, $id)
    {
            $customer = Customer::find($id);
            $customer->note = $request->get('note');
            $customer->save();
            return redirect()->back();
    }
    function delete($id) {
        Customer::find($id)->delete();
        return redirect()->route('customer.show')->with('status','Đã xóa khách hàng thành công');
    }
}
