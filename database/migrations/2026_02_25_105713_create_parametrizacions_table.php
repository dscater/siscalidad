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
        Schema::create('parametrizacions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("producto_id");
            $table->integer("nro_proceso")->default(0);
            $table->integer("cm_horas")->default(0);
            $table->integer("cm_calidad")->default(0);
            $table->integer("cb_horas")->default(0);
            $table->integer("cb_calidad")->default(0);
            $table->integer("ca_horas")->default(0);
            $table->integer("ca_calidad")->default(0);
            $table->integer("co_horas")->default(0);
            $table->integer("co_calidad")->default(0);
            $table->timestamps();

            $table->foreign("producto_id")->references("id")->on("productos");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('parametrizacions');
    }
};
