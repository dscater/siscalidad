<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produccion extends Model
{
    use HasFactory;

    protected $fillable = [
        "producto_id",
        "fecha_inicio",
        "descripcion",
        "estado",
        "calidad",
        "calidad_pro",
        "fecha_registro",
    ];


    protected $appends = ["fecha_registro_t", "fecha_inicio_t"];

    public function getFechaRegistroTAttribute()
    {
        return date('d/m/Y', strtotime($this->fecha_registro));
    }

    public function getFechaInicioTAttribute()
    {
        return date('d/m/Y', strtotime($this->fecha_inicio));
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'producto_id');
    }
    public function control_calidads()
    {
        return $this->hasMany(ControlCalidad::class);
    }

    // public function getCalidadActualAttribute()
    // {
    //     $total_procesos = 20;
    //     $contador_optimos = 0;
    //     $contador_aceptables = 0;
    //     $contador_baja = 0;
    //     $contador_mala = 0;
    //     for ($i = 1; $i <= $total_procesos; $i++) {
    //         $parametrizacion = Parametrizacion::where('nro_proceso', $i)
    //             ->where("producto_id", $this->producto->id)->first();

    //         if ($parametrizacion) {
    //             $control_calidad = ControlCalidad::where('produccion_id', $this->id)
    //                 ->where('nro_proceso', $i)->first();
    //             if ($control_calidad->tiempo && $control_calidad->tiempo >= $parametrizacion->co_horas && $control_calidad->calidad >= $parametrizacion->co_calidad) {
    //                 $contador_optimos++;
    //             }
    //             if ($control_calidad->tiempo && $control_calidad->tiempo >= $parametrizacion->ca_horas && $control_calidad->calidad >= $parametrizacion->ca_calidad) {
    //                 $contador_aceptables++;
    //             }
    //             if ($control_calidad->tiempo && $control_calidad->tiempo >= $parametrizacion->cb_horas && $control_calidad->calidad >= $parametrizacion->cb_calidad) {
    //                 $contador_baja++;
    //             }
    //             if ($control_calidad->tiempo >= $parametrizacion->cm_horas && $control_calidad->calidad >= $parametrizacion->cm_calidad) {
    //                 $contador_mala++;
    //             }
    //         }
    //     }

    //     // DETERMINAR EL CONTADOR MAYOR
    //     $contador_mayor = max($contador_optimos, $contador_aceptables, $contador_baja, $contador_mala);
    //     if ($contador_mayor == $contador_optimos) {
    //         return "ÓPTIMA";
    //     } else if ($contador_mayor == $contador_aceptables) {
    //         return "ACEPTABLE";
    //     } else if ($contador_mayor == $contador_baja) {
    //         return "BAJA";
    //     } else if ($contador_mayor == $contador_mala) {
    //         return "MALA";
    //     }
    // }
}
