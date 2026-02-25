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

            "produccions.api",
            "produccions.listado",
            "produccions.index",
            "produccions.create",
            "produccions.store",
            "produccions.edit",
            "produccions.show",
            "produccions.update",
            "produccions.destroy",

            "configuracions.index",
            "configuracions.create",
            "configuracions.edit",
            "configuracions.update",
            "configuracions.destroy",

            "reportes.usuarios",
            "reportes.r_usuarios",

        ],
        "DOCTOR" => [],
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
