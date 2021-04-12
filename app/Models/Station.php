<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Station extends Model
{
    use HasFactory;

    protected $fillable = ['id', 'name', 'start_id', 'stop_id', 'time', 'train_number'];

    public function start(){
        $this->belongsTO(Start::class, 'start_id');    
    }

    public function stop(){
        $this->belongsTO(Stop::class, 'stop_id');
    }
}
