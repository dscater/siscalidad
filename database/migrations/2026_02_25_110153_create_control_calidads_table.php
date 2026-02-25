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
        Schema::create('control_calidads', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("produccion_id");
            $table->integer("nro_proceso");
            $table->integer("tiempo")->nullable()->default(null);
            $table->integer("calidad")->nullable()->default(null);
            $table->timestamps();

            $table->foreign("produccion_id")->references("id")->on("produccions");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('control_calidads');
    }
};
