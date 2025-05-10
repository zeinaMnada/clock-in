<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Employer extends Model
{
    use HasFactory;

    /**
     * Get Workers.
     */
    public function workers(): HasMany
    {
        return $this->hasMany(Worker::class);
    }

    /**
     * Get Locations.
     */
    public function locations(): HasMany
    {
        return $this->hasMany(Location::class);
    }

    /**
     * Get all of the ClockIns for the worker.
     */
    public function clockIns(): HasManyThrough
    {
        return $this->through('workers')->has('clockIns');
    }

}
