<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ControlCalidad extends Model
{
    use HasFactory;

    protected $fillable = [
        "produccion_id",
        "nro_proceso",
        "tiempo",
        "calidad",
    ];

    protected $appends = ["texto"];

    public function getTextoAttribute()
    {
        $array_textos = ["Recolección de la leche.", "Pruebas de laboratorio.", "Filtración y descremación de la leche.", "Homogenización.", "Pasteurización.", "Envasado.", "Aplicación de fermentos y cultivos lactitos.", "Aplicación de cuajos.", "Corte de cuajada", "Primera agitación", "Calentamiento", "Agitación intermedia", "Desuerado", "Adición de sal", "Agitación final", "Separación de la cuajada y suero", "Prensado", "Corte", "Empaquetado al vacío.", "Almacenaje."];

        return "Proceso " . $this->nro_proceso . ". <br/>" . $array_textos[$this->nro_proceso - 1];
    }

    public function produccion()
    {
        return $this->belongsTo(Produccion::class);
    }
}
