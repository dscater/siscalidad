<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('produccions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("producto_id");
            $table->date("fecha_inicio");
            $table->text("descripcion")->nullable();
            $table->string("estado")->default("INICIADO");
            $table->date("fecha_registro")->nullable();
            $table->timestamps();

            $table->foreign("producto_id")->references("id")->on("productos");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('produccions');
    }
};
