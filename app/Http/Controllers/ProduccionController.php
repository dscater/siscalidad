<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProduccionStoreRequest;
use App\Http\Requests\ProduccionUpdateRequest;
use App\Models\ControlCalidad;
use App\Models\Produccion;
use App\Services\ProduccionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use Inertia\Response as InertiaResponse;

class ProduccionController extends Controller
{
    public function __construct(private ProduccionService $produccionService) {}

    /**
     * Página index
     *
     * @return Response
     */
    public function index(): InertiaResponse
    {
        return Inertia::render("Admin/Produccions/Index");
    }

    /**
     * Listado de produccions
     *
     * @return JsonResponse
     */
    public function listado(): JsonResponse
    {
        return response()->JSON([
            "produccions" => $this->produccionService->listado()
        ]);
    }

    /**
     * Listado de produccions para portal
     *
     * @return JsonResponse
     */
    public function listadoPortal(): JsonResponse
    {
        return response()->JSON([
            "produccions" => $this->produccionService->listado()
        ]);
    }

    /**
     * Endpoint para obtener la lista de produccions paginado para datatable
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function api(Request $request): JsonResponse
    {

        $length = (int)$request->input('length', 10); // Valor de `length` enviado por DataTable
        $start = (int)$request->input('start', 0); // Índice de inicio enviado por DataTable
        $page = (int)(($start / $length) + 1); // Cálculo de la página actual
        $search = (string)$request->input('search', '');

        $usuarios = $this->produccionService->listadoDataTable($length, $start, $page, $search);

        return response()->JSON([
            'data' => $usuarios->items(),
            'recordsTotal' => $usuarios->total(),
            'recordsFiltered' => $usuarios->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    /**
     * Registrar un nuevo produccion
     *
     * @param ProduccionStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(ProduccionStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el Produccion
            $this->produccionService->crear($request->validated());
            DB::commit();
            return redirect()->route("produccions.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Mostrar un produccion
     *
     * @param Produccion $produccion
     * @return JsonResponse
     */
    public function show(Produccion $produccion): JsonResponse
    {
        return response()->JSON($produccion);
    }

    public function control_calidad(Produccion $produccion)
    {
        $this->produccionService->control_calidad($produccion->id);
        $produccion = $produccion->load("producto", "control_calidads");

        return Inertia::render("Admin/Produccions/ControlCalidad", compact("produccion"));
    }

    public function update(Produccion $produccion, ProduccionUpdateRequest $request)
    {
        DB::beginTransaction();
        Log::debug("ASDEEEEEEEEEEEEEEEEEEEEEASD");
        try {
            // actualizar produccion
            $this->produccionService->actualizar($request->validated(), $produccion);
            DB::commit();
            return redirect()->route("produccions.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    public function updateControlCalidad(ControlCalidad $control_calidad, Request $request)
    {
        DB::beginTransaction();
        try {
            // actualizar control de calidad
            $data = $request->validate([
                "campo" => "required",
                "valor" => "nullable",
            ]);
            $this->produccionService->actualizarControlCalidad($data, $control_calidad);
            DB::commit();
            return response()->JSON([
                "sw" => true,
                "message" => "Registro actualizado"
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Eliminar produccion
     *
     * @param Produccion $produccion
     * @return JsonResponse|Response
     */
    public function destroy(Produccion $produccion): JsonResponse|Response
    {
        DB::beginTransaction();
        try {
            $this->produccionService->eliminar($produccion);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}
