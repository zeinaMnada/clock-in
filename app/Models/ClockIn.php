<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ClockIn extends Model
{
    use HasFactory;

    protected $fillable = array('signed_in_at', 'location', 'worker_id', 'ip_address');
    /**
     * Get the worker whom belongs to the ClockIn.
     */
    public function worker(): BelongsTo
    {
        return $this->belongsTo(Worker::class);
    }

    /**
     * Define the json format of the model
     */
    public function jsonSerialize():Array
    {
        //look for a spatial package to serialize coordinates
        $location = DB::table('clock_ins')->select(DB::raw('ST_Y(location) as lat, ST_X(location) as lon'))
                    ->where('id', '=', $this->id)->first();
        return [
            'id' => $this->id,
            'worker_id' => $this->worker_id,
            'signed_in_at' => $this->signed_in_at,
            'latitude' => $location->lat,
            'longitude' => $location->lon,
            'ip_address' => $this->ip_address,
            'updated_at' => $this->updated_at,
            'created_at' => $this->created_at,
        ];
    }
}
