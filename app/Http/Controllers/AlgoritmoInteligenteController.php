<?php

namespace App\Http\Controllers;

use App\Models\ControlCalidad;
use App\Models\Parametrizacion;
use App\Models\Produccion;
use Illuminate\Http\Request;

class AlgoritmoInteligenteController extends Controller
{
    /**
     * ALGORITMO INTELIGENTE DE CALIDAD DE PRODUCCIÓN
     *
     * 1. Se obtiene la producción según el ID recibido.
     * 2. Se cargan todos los registros de ControlCalidad
     *    correspondientes a esa producción y se organizan
     *    por número de proceso.
     * 3. Se cargan todas las Parametrizaciones del producto
     *    asociado a la producción, también organizadas por
     *    número de proceso.
     * 4. Se inicializan contadores para cada categoría:
     *    OPTIMA, ACEPTABLE, BAJA y MALA.
     * 5. Se recorren todos los procesos:
     *      - Se compara el tiempo y la calidad registrados
     *        contra los valores definidos en la parametrización.
     *      - Se clasifica cada proceso en una sola categoría.
     *      - Se incrementa el contador correspondiente.
     *      - Se acumula un puntaje numérico según la categoría:
     *            OPTIMA     = 4 puntos
     *            ACEPTABLE  = 3 puntos
     *            BAJA       = 2 puntos
     *            MALA       = 1 punto
     * 6. Se calcula el score promedio dividiendo el total
     *    de puntos entre la cantidad de procesos evaluados.
     * 7. Se aplican reglas inteligentes por prioridad:
     *      - Si hay más de 3 procesos MALA, el resultado final es MALA.
     *      - Si el score promedio es mayor o igual a 3.5, es OPTIMA.
     *      - Si el score promedio es mayor o igual a 2.5, es ACEPTABLE.
     *      - Si el score promedio es mayor o igual a 1.5, es BAJA.
     *      - En cualquier otro caso, es MALA.
     * 8. Se retorna el resultado final
     */

    public function calcular(Request $request)
    {
        $produccion_id = $request->input('produccion_id');
        $produccion = Produccion::findOrFail($produccion_id);

        $procesos = ControlCalidad::where('produccion_id', $produccion->id)
            ->get()
            ->keyBy('nro_proceso');

        $parametrizaciones = Parametrizacion::where('producto_id', $produccion->producto_id)
            ->get()
            ->keyBy('nro_proceso');

        $conteo = [
            'OPTIMA' => 0,
            'ACEPTABLE' => 0,
            'BAJA' => 0,
            'MALA' => 0,
        ];

        $scoreTotal = 0;

        foreach ($procesos as $nro => $control) {

            $param = $parametrizaciones[$nro] ?? null;
            if (!$param) continue;

            $categoria = $this->clasificarProceso($control, $param);

            $conteo[$categoria]++;

            $scoreTotal += match ($categoria) {
                'OPTIMA' => 4,
                'ACEPTABLE' => 3,
                'BAJA' => 2,
                'MALA' => 1,
            };
        }

        $totalProcesos = max(count($procesos), 1);
        $scorePromedio = $scoreTotal / $totalProcesos;

        // REGLAS PARA DETERMINAR CALIDAD FINAL
        $resultado = $this->aplicarReglas($scorePromedio, $conteo);

        return response()->json([
            'produccion_id' => $produccion->id,
            'score_promedio' => round($scorePromedio, 2),
            'detalle' => $conteo,
            'resultado' => $resultado,
        ]);
    }

    private function clasificarProceso($control, $param): string
    {
        if (
            $control->tiempo >= $param->co_horas &&
            $control->calidad >= $param->co_calidad
        ) {
            return 'OPTIMA';
        }

        if (
            $control->tiempo >= $param->ca_horas &&
            $control->calidad >= $param->ca_calidad
        ) {
            return 'ACEPTABLE';
        }

        if (
            $control->tiempo >= $param->cb_horas &&
            $control->calidad >= $param->cb_calidad
        ) {
            return 'BAJA';
        }

        return 'MALA';
    }

    private function aplicarReglas($scorePromedio, $conteo): string
    {
        if ($conteo['MALA'] > 3) {
            return 'MALA';
        }

        if ($scorePromedio >= 3.5) {
            return 'ÓPTIMA';
        }

        if ($scorePromedio >= 2.5) {
            return 'ACEPTABLE';
        }

        if ($scorePromedio >= 1.5) {
            return 'BAJA';
        }

        return 'MALA';
    }
}
