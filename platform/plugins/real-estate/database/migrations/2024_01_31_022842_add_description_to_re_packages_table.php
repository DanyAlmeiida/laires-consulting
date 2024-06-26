<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::table('re_packages', function (Blueprint $table) {
            $table->string('description', 400)->nullable();
        });

        Schema::table('re_packages_translations', function (Blueprint $table) {
            $table->string('description', 400)->nullable();
        });
    }

    public function down(): void
    {
        Schema::table('re_packages', function (Blueprint $table) {
            $table->dropColumn('description');
        });

        Schema::table('re_packages_translations', function (Blueprint $table) {
            $table->dropColumn('description');
        });
    }
};
