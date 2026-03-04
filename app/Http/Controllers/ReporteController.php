<?php

namespace App\Http\Controllers;

use App\Models\Area;
use App\Models\Cliente;
use App\Models\Configuracion;
use App\Models\Diagnostico;
use App\Models\HistorialOferta;
use App\Models\HistorialPaciente;
use App\Models\Paciente;
use App\Models\Produccion;
use App\Models\Producto;
use App\Models\Publicacion;
use App\Models\PublicacionDetalle;
use App\Models\SubastaCliente;
use App\Models\Tarea;
use App\Models\User;
use App\Services\ProduccionService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use PDF;
use Carbon\Carbon;

class ReporteController extends Controller
{
    public function __construct(private ProduccionService $produccion_service) {}

    public function usuarios()
    {
        return Inertia::render("Admin/Reportes/Usuarios");
    }

    public function r_usuarios(Request $request)
    {
        $tipo =  $request->tipo;
        $usuarios = User::select("users.*")
            ->where('id', '!=', 1);

        if ($tipo != 'todos') {
            $request->validate([
                'tipo' => 'required',
            ]);
            $usuarios->where('tipo', $tipo);
        }

        $usuarios = $usuarios->orderBy("paterno", "ASC")->get();

        $pdf = PDF::loadView('reportes.usuarios', compact('usuarios'))->setPaper('legal', 'landscape');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->stream('usuarios.pdf');
    }

    public function productos()
    {
        return Inertia::render("Admin/Reportes/Productos");
    }
    public function r_productos(Request $request)
    {
        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;
        $productos = Producto::select("productos.*");

        $productos = $productos->get();

        $pdf = PDF::loadView('reportes.productos', compact('productos'))->setPaper('letter', 'portrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->stream('productos.pdf');
    }

    public function produccions()
    {
        return Inertia::render("Admin/Reportes/Produccions");
    }
    public function r_produccions(Request $request)
    {
        $produccion_id =  $request->produccion_id;
        $estado =  $request->estado;
        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;
        $produccions = Produccion::select("produccions.*");

        if ($produccion_id != 'todos') {
            $produccions->where('produccion_id', $produccion_id);
        }

        if ($estado != 'todos') {
            $produccions->where('estado', $estado);
        }

        if ($fecha_ini && $fecha_fin) {
            $produccions->whereBetween('fecha_registro', [$fecha_ini, $fecha_fin]);
        }

        $produccions = $produccions->get();

        $pdf = PDF::loadView('reportes.produccions', compact('produccions'))->setPaper('legal', 'portrait');

        // ENUMERAR LAS PÁGINAS USANDO CANVAS
        $pdf->output();
        $dom_pdf = $pdf->getDomPDF();
        $canvas = $dom_pdf->get_canvas();
        $alto = $canvas->get_height();
        $ancho = $canvas->get_width();
        $canvas->page_text($ancho - 90, $alto - 25, "Página {PAGE_NUM} de {PAGE_COUNT}", null, 9, array(0, 0, 0));

        return $pdf->stream('produccions.pdf');
    }
    public function calidad_productos()
    {
        return Inertia::render("Admin/Reportes/CalidadProductos");
    }

    public function r_calidad_productos(Request $request)
    {
        $calidad =  $request->calidad;
        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;


        $tipos = ["MALA", "BAJA", "ACEPTABLE", "ÓPTIMA"];
        $listTipos =  [
            0 => "MALA",
            1 => "BAJA",
            2 => "ACEPTABLE",
            3 => "ÓPTIMA"
        ];
        if ($calidad != 'todos') {
            $tipos = [$listTipos[$calidad]];
        }

        $colores = [
            "MALA" => "#dc3545",   // rojo
            "BAJA" => "#ffc107",  // amarillo
            "ACEPTABLE" => "#fd7e14",   // naranja
            "ÓPTIMA" => "#28a745",   // verde
        ];

        $data = [];
        $productos = Producto::all();
        foreach ($productos as $producto) {
            $produccion = Produccion::where("producto_id", $producto->id);
            if ($fecha_ini && $fecha_fin) {
                $produccion->whereBetween("fecha_registro", [$fecha_ini, $fecha_fin]);
            }
            $produccion->where("estado", "FINALIZADO");
            $produccion = $produccion->get()->last();

            // obtener el promedio de horas
            if ($produccion) {
                $calidad = $produccion->calidad;
                if (in_array($calidad, $tipos)) {
                    $data[] = [
                        'name' => $producto->nombre,
                        // promedio de horas
                        'y' => $this->produccion_service->getPromedioHorasProcesos($produccion->id),
                        'color' => $colores[$calidad] ?? '#000000',
                        'calidad' => $calidad,
                    ];
                }
            }
        }

        return response()->JSON([
            "categories" => $tipos,
            "data" => $data,
        ]);
    }
    public function cantidad_productos()
    {
        return Inertia::render("Admin/Reportes/CantidadProductos");
    }

    public function r_cantidad_productos(Request $request)
    {
        $calidad =  $request->calidad;
        $fecha_ini =  $request->fecha_ini;
        $fecha_fin =  $request->fecha_fin;


        $tipos = ["MALA", "BAJA", "ACEPTABLE", "ÓPTIMA"];
        $listTipos =  [
            0 => "MALA",
            1 => "BAJA",
            2 => "ACEPTABLE",
            3 => "ÓPTIMA"
        ];
        if ($calidad != 'todos') {
            $tipos = [$listTipos[$calidad]];
        }

        $colores = [
            "MALA" => "#dc3545",   // rojo
            "BAJA" => "#ffc107",  // amarillo
            "ACEPTABLE" => "#fd7e14",   // naranja
            "ÓPTIMA" => "#28a745",   // verde
        ];

        $data = [];
        foreach ($tipos as $tipo) {
            $produccions = Produccion::where("calidad", $tipo);
            if ($fecha_ini && $fecha_fin) {
                $produccions->whereBetween("fecha_registro", [$fecha_ini, $fecha_fin]);
            }
            $produccions = $produccions->where("estado", "FINALIZADO")->count();
            $data[] = [
                'name' => $tipo,
                'y' => $produccions,
                'color' => $colores[$tipo] ?? '#000000',
            ];
        }

        return response()->JSON([
            "categories" => $tipos,
            "data" => $data,
        ]);
    }
}
