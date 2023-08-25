<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Feedback extends Model
{
    use HasFactory;
    protected $table = 'feedback';
    protected $fillable = [
        'customer_id',
        'section',
        'title',
        'content'
    ];
    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
