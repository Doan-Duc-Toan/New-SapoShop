<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Order;
class CustomerController extends Controller
{
    //
    function show(){
        $customers = Customer::get();

        return view('admin.customer.show',compact('customers'));
    }
    function profile($id){
        $customer = Customer::find($id);
        return view('admin.customer.profile',compact('customer'));
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
