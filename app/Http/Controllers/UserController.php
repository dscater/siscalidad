<?php

namespace App\Http\Controllers;

use App\Models\Area;
use App\Models\Diagnostico;
use App\Models\Material;
use App\Models\Paciente;
use App\Models\Produccion;
use App\Models\Producto;
use App\Models\Publicacion;
use App\Models\Tarea;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{

    public function permisosUsuario(Request $request)
    {
        return response()->JSON([
            "permisos" => Auth::user()->permisos
        ]);
    }

    public function getUser()
    {
        return response()->JSON([
            "user" => Auth::user()
        ]);
    }

    public static function getInfoBoxUser()
    {
        $permisos = [];
        $array_infos = [];
        if (Auth::check()) {
            $oUser = new User();
            $permisos = $oUser->permisos;
            if ($permisos == '*' || (is_array($permisos) && in_array('usuarios.index', $permisos))) {
                $array_infos[] = [
                    'label' => 'USUARIOS',
                    'cantidad' => User::where('id', '!=', 1)->count(),
                    'color' => 'bg-principal',
                    'icon' => "fa-users",
                    "url" => "usuarios.index"
                ];
            }

            if ($permisos == '*' || (is_array($permisos) && in_array('productos.index', $permisos))) {
                $productos = Producto::count();
                $array_infos[] = [
                    'label' => 'PRODUCTOS',
                    'cantidad' => $productos,
                    'color' => 'bg-principal',
                    'icon' => "fa-box",
                    "url" => "productos.index"
                ];
            }

            if ($permisos == '*' || (is_array($permisos) && in_array('produccions.index', $permisos))) {
                $produccions = Produccion::count();
                $array_infos[] = [
                    'label' => 'EN PRODUCCIÓN',
                    'cantidad' => $produccions,
                    'color' => 'bg-principal',
                    'icon' => "fa-list",
                    "url" => "produccions.index"
                ];
            }
        }


        return $array_infos;
    }
}
