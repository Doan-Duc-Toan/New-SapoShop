<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;
    protected $table = 'order_detail';
    protected $fillable = ['order_id', 'product_id', 'color_id', 'count'];

    public function order()
    {
        return $this->belongsTo(Order::class,'order_id');
    }
    public function product()
    {
        return $this->belongsTo(Product::class,'product_id');
    }
    public function color()
    {
        return $this->belongsTo(Color::class,'color_id');
    }
}
