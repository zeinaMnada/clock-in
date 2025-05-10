<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Location extends Model
{
    use HasFactory;

    /**
     * Get the Employer whom belongs to the Location.
     */
    public function employer(): BelongsTo
    {
        return $this->belongsTo(Employer::class);
    }

}
