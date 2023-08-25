<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Thumb extends Model
{
    use HasFactory;
    protected $table='product_thumbs';
    protected $fillable = [
        'link',
        'product_id',
        'color_id'
    ];
    public function product(){
        return $this->belongsTo(Product::class);
    }
    public function color(){
        return $this->belongsTo(Color::class);
    }
}
