<?php

namespace App\Http\Controllers;

use App\Http\Requests\ParametrizacionStoreRequest;
use App\Http\Requests\ParametrizacionUpdateRequest;
use App\Models\Parametrizacion;
use App\Models\Producto;
use App\Services\ParametrizacionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use Inertia\Response as InertiaResponse;

class ParametrizacionController extends Controller
{
    public function __construct(private ParametrizacionService $parametrizacionService) {}

    /**
     * Página index
     *
     * @return Response
     */
    public function index(): InertiaResponse
    {
        return Inertia::render("Admin/Parametrizacions/Index");
    }

    /**
     * Listado de parametrizacions
     *
     * @return JsonResponse
     */
    public function listado(): JsonResponse
    {
        return response()->JSON([
            "parametrizacions" => $this->parametrizacionService->listado()
        ]);
    }

    public function parametrizacionProducto(Request $request)
    {
        $producto_id = $request->input('producto_id');
        $producto = Producto::find($producto_id);
        $parametrizacions = $this->parametrizacionService->parametrizacionProducto($producto_id);
        return response()->JSON([
            "parametrizacions" => $parametrizacions,
            "producto" => $producto
        ]);
    }

    /**
     * Endpoint para obtener la lista de parametrizacions paginado para datatable
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

        $usuarios = $this->parametrizacionService->listadoDataTable($length, $start, $page, $search);

        return response()->JSON([
            'data' => $usuarios->items(),
            'recordsTotal' => $usuarios->total(),
            'recordsFiltered' => $usuarios->total(),
            'draw' => intval($request->input('draw')),
        ]);
    }

    /**
     * Registrar un nuevo parametrizacion
     *
     * @param ParametrizacionStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(ParametrizacionStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el Parametrizacion
            $this->parametrizacionService->crear($request->validated());
            DB::commit();
            return redirect()->route("parametrizacions.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Mostrar un parametrizacion
     *
     * @param Parametrizacion $parametrizacion
     * @return JsonResponse
     */
    public function show(Parametrizacion $parametrizacion): JsonResponse
    {
        return response()->JSON($parametrizacion);
    }

    public function update(Parametrizacion $parametrizacion, ParametrizacionUpdateRequest $request)
    {
        DB::beginTransaction();
        try {
            // actualizar parametrizacion
            $this->parametrizacionService->actualizar($request->validated(), $parametrizacion);
            DB::commit();
            return response()->JSON([
                "sw" => true,
                "message" => "Registro actualizado"
            ]);
            // return redirect()->route("parametrizacions.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Eliminar parametrizacion
     *
     * @param Parametrizacion $parametrizacion
     * @return JsonResponse|Response
     */
    public function destroy(Parametrizacion $parametrizacion): JsonResponse|Response
    {
        DB::beginTransaction();
        try {
            $this->parametrizacionService->eliminar($parametrizacion);
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
