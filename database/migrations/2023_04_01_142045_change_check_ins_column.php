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
        Schema::table('clock_ins', function (Blueprint $table) {
            $table->ipAddress('ip_address')->nullable();
            $table->point('location')->change();
        });    
    
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
