<?php

namespace App\Services;

use App\Models\Diagnostico;
use App\Models\HistorialParametrizacion;
use App\Services\HistorialAccionService;
use App\Models\Parametrizacion;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class ParametrizacionService
{
    private $modulo = "PARAMETRIZACIÓN";

    public function __construct(private HistorialAccionService $historialAccionService) {}

    public function listado(): Collection
    {
        $parametrizacions = Parametrizacion::select("parametrizacions.*");
        $parametrizacions->where("status", 1);
        $parametrizacions = $parametrizacions->get();
        return $parametrizacions;
    }

    public function listadoDataTable(int $length, int $start, int $page, string $search): LengthAwarePaginator
    {
        $parametrizacions = Parametrizacion::select("parametrizacions.*");
        $parametrizacions->where("status", 1);
        $parametrizacions = $parametrizacions->paginate($length, ['*'], 'page', $page);
        return $parametrizacions;
    }

    /**
     * Crear parametrizacion
     *
     * @param array $datos
     * @return Parametrizacion
     */
    public function crear(array $datos): Parametrizacion
    {
        $parametrizacion = Parametrizacion::create([
            "nombre" => mb_strtoupper($datos["nombre"]),
            "paterno" => mb_strtoupper($datos["paterno"]),
            "materno" => mb_strtoupper($datos["materno"]),
            "ci" => mb_strtoupper($datos["ci"]),
            "ci_exp" => $datos["ci_exp"],
            "fecha_nac" => $datos["fecha_nac"],
            "genero" => $datos["genero"],
            "cel" => mb_strtoupper($datos["cel"]),
            "dir" => mb_strtoupper($datos["dir"]),
            "ocupacion" => mb_strtoupper($datos["ocupacion"]),
            "fecha_registro" => date("Y-m-d")
        ]);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UNA PARAMETRIZACIÓN", $parametrizacion, null);

        return $parametrizacion;
    }

    /**
     * Actualizar parametrizacion
     *
     * @param array $datos
     * @param Parametrizacion $parametrizacion
     * @return Parametrizacion
     */
    public function actualizar(array $datos, Parametrizacion $parametrizacion): Parametrizacion
    {
        $old_parametrizacion = clone $parametrizacion;

        $parametrizacion[$datos["campo"]] = $datos["valor"];
        $parametrizacion->save();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UNA PARAMETRIZACIÓN", $old_parametrizacion, $parametrizacion);

        return $parametrizacion;
    }

    public function parametrizacionProducto(int $producto_id): Collection
    {
        $total_procesos = 20;
        $parametrizacions = new Collection();
        for ($i = 1; $i <= $total_procesos; $i++) {
            $parametrizacion = Parametrizacion::where("producto_id", $producto_id)
                ->where("nro_proceso", $i)
                ->first();
            if ($parametrizacion) {
                $parametrizacions[] = $parametrizacion;
            } else {
                $parametrizacions[] = Parametrizacion::create([
                    "producto_id" => $producto_id,
                    "nro_proceso" => $i,
                    "cm_horas" => 0,
                    "cm_calidad" => 0,
                    "cb_horas" => 0,
                    "cb_calidad" => 0,
                    "ca_horas" => 0,
                    "ca_calidad" => 0,
                    "co_horas" => 0,
                    "co_calidad" => 0,
                ]);
            }
        }
        return $parametrizacions;
    }

    /**
     * Eliminar parametrizacion
     *
     * @param Parametrizacion $parametrizacion
     * @return boolean
     */
    public function eliminar(Parametrizacion $parametrizacion): bool
    {
        // verificar usos
        $usos = HistorialParametrizacion::where("parametrizacion_id", $parametrizacion->id)->get();
        if (count($usos) > 0) {
            throw ValidationException::withMessages([
                'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
            ]);
        }
        $usos = Diagnostico::where("parametrizacion_id", $parametrizacion->id)->get();
        if (count($usos) > 0) {
            throw ValidationException::withMessages([
                'error' =>  "No es posible eliminar este registro porque esta siendo utilizado por otros registros",
            ]);
        }

        $old_parametrizacion = clone $parametrizacion;
        $parametrizacion->status = 0;
        $parametrizacion->save();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UNA PARAMETRIZACIÓN", $old_parametrizacion);

        return true;
    }
}
