<?php

namespace App\Services;

use App\Models\ControlCalidad;
use App\Models\Parametrizacion;
use App\Models\Produccion;
use App\Models\ReporteFinanciero;
use App\Services\HistorialAccionService;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class ProduccionService
{
    private $modulo = "PRODUCCIÓN";

    public function __construct(private HistorialAccionService $historialAccionService) {}

    public function listado(): Collection
    {
        $produccions = Produccion::select("produccions.*")
            ->with("producto");
        $produccions = $produccions->orderBy("id", "desc")->get();
        return $produccions;
    }

    public function listadoDataTable(int $length, int $start, int $page, string $search): LengthAwarePaginator
    {
        $produccions = Produccion::select("produccions.*")
            ->with("producto");
        if ($search && trim($search) != '') {
            $produccions->where("nombre", "LIKE", "%$search%");
        }
        $produccions = $produccions->paginate($length, ['*'], 'page', $page);
        return $produccions;
    }

    /**
     * Crear produccion
     *
     * @param array $datos
     * @return Produccion
     */
    public function crear(array $datos): Produccion
    {
        $produccion = Produccion::create([
            "producto_id" => $datos["producto_id"],
            "fecha_inicio" => $datos["fecha_inicio"],
            "descripcion" => mb_strtoupper($datos["descripcion"]),
            "estado" => "INICIADO",
            "fecha_registro" => date("Y-m-d")
        ]);
        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "AGREGO UN REGISTRO DE PRODUCCIÓN", $produccion, null);

        return $produccion;
    }

    /**
     * Actualizar produccion
     *
     * @param array $datos
     * @param Produccion $produccion
     * @return Produccion
     */
    public function actualizar(array $datos, Produccion $produccion): Produccion
    {
        $old_produccion = clone $produccion;
        $produccion->update([
            "producto_id" => $datos["producto_id"],
            "fecha_inicio" => $datos["fecha_inicio"],
            "descripcion" => mb_strtoupper($datos["descripcion"]),
        ]);
        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UN REGISTRO DE PRODUCCIÓN", $old_produccion, $produccion);

        return $produccion;
    }

    public function control_calidad(int $produccion_id): Collection
    {
        $total_procesos = 20;
        $control_calidads = new Collection();
        for ($i = 1; $i <= $total_procesos; $i++) {
            $control_calidad = ControlCalidad::where("produccion_id", $produccion_id)
                ->where("nro_proceso", $i)
                ->first();
            if ($control_calidad) {
                $control_calidads[] = $control_calidad;
            } else {
                $control_calidads[] = ControlCalidad::create([
                    "produccion_id" => $produccion_id,
                    "nro_proceso" => $i,
                ]);
            }
        }
        return $control_calidads;
    }


    public function actualizarControlCalidad(array $datos, ControlCalidad $control_calidad): ControlCalidad
    {
        $old_control_calidad = clone $control_calidad;

        $control_calidad[$datos["campo"]] = $datos["valor"];
        $control_calidad->save();

        $this->verificarControlCalidadProduccion($control_calidad->produccion);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UN CONTROL DE CALIDAD", $old_control_calidad, $control_calidad);

        return $control_calidad;
    }

    public function verificarControlCalidadProduccion(Produccion $produccion)
    {
        $total_procesos = 20;
        $sw_proceso = false;
        $contador_finalizado = 0;

        $contador_optimos = 0;
        $contador_aceptables = 0;
        $contador_baja = 0;
        $contador_mala = 0;

        for ($i = 1; $i <= $total_procesos; $i++) {

            $parametrizacion = Parametrizacion::where('nro_proceso', $i)
                ->where("producto_id", $produccion->producto->id)->first();

            $control_calidad = ControlCalidad::where("produccion_id", $produccion->id)
                ->where("nro_proceso", $i)
                ->first();

            if ($control_calidad && $control_calidad->tiempo != null && $control_calidad->calidad != null) {
                $contador_finalizado++;
                $sw_proceso = true;
            }

            if ($parametrizacion) {
                $control_calidad = ControlCalidad::where('produccion_id', $produccion->id)
                    ->where('nro_proceso', $i)->first();
                if ($control_calidad->tiempo && $control_calidad->tiempo >= $parametrizacion->co_horas && $control_calidad->calidad >= $parametrizacion->co_calidad) {
                    $contador_optimos++;
                }
                if ($control_calidad->tiempo && $control_calidad->tiempo >= $parametrizacion->ca_horas && $control_calidad->calidad >= $parametrizacion->ca_calidad) {
                    $contador_aceptables++;
                }
                if ($control_calidad->tiempo && $control_calidad->tiempo >= $parametrizacion->cb_horas && $control_calidad->calidad >= $parametrizacion->cb_calidad) {
                    $contador_baja++;
                }
                if ($control_calidad->tiempo >= $parametrizacion->cm_horas && $control_calidad->calidad >= $parametrizacion->cm_calidad) {
                    $contador_mala++;
                }
            }
        }

        // DETERMINAR EL CONTADOR MAYOR
        $contador_mayor = max($contador_optimos, $contador_aceptables, $contador_baja, $contador_mala);
        if ($contador_mayor == $contador_optimos) {
            $produccion->calidad = "ÓPTIMA";
        } else if ($contador_mayor == $contador_aceptables) {
            $produccion->calidad = "ACEPTABLE";
        } else if ($contador_mayor == $contador_baja) {
            $produccion->calidad = "BAJA";
        } else if ($contador_mayor == $contador_mala) {
            $produccion->calidad = "MALA";
        }

        if ($sw_proceso) {
            $produccion->estado = "EN PROCESO";

            if ($contador_finalizado == $total_procesos) {
                $produccion->estado = "FINALIZADO";
            }
        } else {
            $produccion->estado = "INICIADO";
        }
        $produccion->save();
        return $produccion;
    }


    public function getPromedioHorasProcesos($produccion_id)
    {
        $total_procesos = 20;
        $total_horas = 0;
        for ($i = 1; $i <= $total_procesos; $i++) {
            $control_calidad = ControlCalidad::where("produccion_id", $produccion_id)
                ->where("nro_proceso", $i)
                ->first();
            if ($control_calidad && $control_calidad->tiempo != null) {
                $total_horas += $control_calidad->tiempo;
            }
        }
        return $total_horas > 0 ? $total_horas / $total_procesos : 0;
    }

    /**
     * Eliminar produccion
     *
     * @param Produccion $produccion
     * @return boolean
     */
    public function eliminar(Produccion $produccion): bool
    {
        $old_produccion = clone $produccion;
        $old_produccion->loadMissing('control_calidads');
        $produccion->control_calidads()->delete();
        $produccion->delete();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UN REGISTRO DE PRODUCCIÓN", $old_produccion, NULL, ["control_calidads"]);

        return true;
    }
}
