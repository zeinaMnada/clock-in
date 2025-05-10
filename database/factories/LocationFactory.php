<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class LocationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->name(),
            'employer_id' => \App\Models\Employer::first()->id,
            'coordinates' => \DB::raw("(ST_GeomFromText('POINT(31.240338786506364 30.04955082302653)'))"),
            // google lat long = > 30.049518319215444, 31.2403173288357
            // lattidue => y-coord 30.04955082302653
            // longitude => x-coord 31.240338786506364
        ];
    }
}
