<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Parametrizacion extends Model
{
    use HasFactory;

    protected $fillable = [
        "producto_id",
        "nro_proceso",
        "cm_horas",
        "cm_calidad",
        "cb_horas",
        "cb_calidad",
        "ca_horas",
        "ca_calidad",
        "co_horas",
        "co_calidad",
    ];

    public function producto()
    {
        return $this->belongsTo(Producto::class);
    }
}
