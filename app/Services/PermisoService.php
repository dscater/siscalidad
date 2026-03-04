<?php

namespace App\Services;

use Illuminate\Support\Facades\Auth;

class PermisoService
{
    protected $arrayPermisos = [
        "ADMINISTRADOR" => [
            "usuarios.api",
            "usuarios.index",
            "usuarios.listado",
            "usuarios.create",
            "usuarios.store",
            "usuarios.edit",
            "usuarios.show",
            "usuarios.update",
            "usuarios.destroy",
            "usuarios.password",

            "productos.api",
            "productos.listado",
            "productos.index",
            "productos.create",
            "productos.store",
            "productos.edit",
            "productos.show",
            "productos.update",
            "productos.destroy",

            "parametrizacions.api",
            "parametrizacions.listado",
            "parametrizacions.index",
            "parametrizacions.create",
            "parametrizacions.store",
            "parametrizacions.edit",
            "parametrizacions.show",
            "parametrizacions.update",
            "parametrizacions.destroy",
            "parametrizacions.parametrizacionProducto",

            "produccions.api",
            "produccions.listado",
            "produccions.index",
            "produccions.create",
            "produccions.store",
            "produccions.edit",
            "produccions.show",
            "produccions.update",
            "produccions.destroy",
            "produccions.control_calidad",
            "produccions.updateControlCalidad",
            "algoritmo_inteligente.calcular",

            "configuracions.index",
            "configuracions.create",
            "configuracions.edit",
            "configuracions.update",
            "configuracions.destroy",

            "reportes.usuarios",
            "reportes.r_usuarios",
            "reportes.productos",
            "reportes.r_productos",
            "reportes.produccions",
            "reportes.r_produccions",
            "reportes.calidad_productos",
            "reportes.r_calidad_productos",
            "reportes.cantidad_productos",
            "reportes.r_cantidad_productos",

        ],
        "GERENTE" => [
            "produccions.listado",
            "algoritmo_inteligente.calcular",

            "reportes.productos",
            "reportes.r_productos",
            "reportes.produccions",
            "reportes.r_produccions",
            "reportes.calidad_productos",
            "reportes.r_calidad_productos",
            "reportes.cantidad_productos",
            "reportes.r_cantidad_productos",
        ],
        "SUPERVISOR" => [
            "productos.api",
            "productos.listado",
            "productos.index",
            "productos.create",
            "productos.store",
            "productos.edit",
            "productos.show",
            "productos.update",
            "productos.destroy",

            "parametrizacions.api",
            "parametrizacions.listado",
            "parametrizacions.index",
            "parametrizacions.create",
            "parametrizacions.store",
            "parametrizacions.edit",
            "parametrizacions.show",
            "parametrizacions.update",
            "parametrizacions.destroy",
            "parametrizacions.parametrizacionProducto",

            "produccions.api",
            "produccions.listado",
            "produccions.index",
            "produccions.create",
            "produccions.store",
            "produccions.edit",
            "produccions.show",
            "produccions.update",
            "produccions.destroy",
            "produccions.control_calidad",
            "produccions.updateControlCalidad",
            "algoritmo_inteligente.calcular",

            "reportes.usuarios",
            "reportes.r_usuarios",
            "reportes.productos",
            "reportes.r_productos",
            "reportes.produccions",
            "reportes.r_produccions",
            "reportes.calidad_productos",
            "reportes.r_calidad_productos",
            "reportes.cantidad_productos",
            "reportes.r_cantidad_productos",
        ],
        "TÉCNICO" => [
            // "parametrizacions.api",
            // "parametrizacions.listado",
            // "parametrizacions.index",
            // "parametrizacions.create",
            // "parametrizacions.store",
            // "parametrizacions.edit",
            // "parametrizacions.show",
            // "parametrizacions.update",
            // "parametrizacions.destroy",
            // "parametrizacions.parametrizacionProducto",

            "produccions.api",
            "produccions.listado",
            "produccions.index",
            "produccions.create",
            "produccions.store",
            "produccions.edit",
            "produccions.show",
            "produccions.update",
            "produccions.destroy",
            "produccions.control_calidad",
            "produccions.updateControlCalidad",
            "algoritmo_inteligente.calcular",

            "reportes.produccions",
            "reportes.r_produccions",
            "reportes.calidad_productos",
            "reportes.r_calidad_productos",
            "reportes.cantidad_productos",
            "reportes.r_cantidad_productos",
        ],
    ];

    public function getPermisosUser()
    {
        $user = Auth::user();
        $permisos = [];
        if ($user) {
            return $this->arrayPermisos[$user->tipo];
        }

        return $permisos;
    }
}
