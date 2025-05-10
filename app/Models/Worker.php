<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Worker extends Model
{
    use HasFactory;

    /**
     * Get the Employer whom belongs to the Worker.
     */
    public function employer(): BelongsTo
    {
        return $this->belongsTo(Employer::class);
    }

    /**
     * Get the ClockIns of the Worker.
     */
    public function clockIns(): HasMany
    {
        return $this->hasMany(ClockIn::class);
    }

    /** 
    * Check worker distance from work location
    *
    * @param $employer_id identify employer of worker 
    * @param $latitude  latitude of worker location
    * @param $longitude longitude of worker location
    * @return Boolean true if worker within 2km of work location
    */
    public function inWorkPremises($lat, $lon) {
        $location = \DB::table('locations')->select(\DB::raw('ST_Y(coordinates) as lat, ST_X(coordinates) as lon'))
                    ->join('employers', 'employers.id', '=', 'locations.employer_id')
                    ->where('employers.id', '=', $this->employer_id)->first();
        $locLat = $location->lat;
        $locLon = $location->lon;
        $distance = $this->getDistanceFromLatLonInKm($locLat,$locLon,$lat,$lon);
        return $distance > 2 ? false : true;
    }

    /** 
    * Calculate distance between to locations
    *
    * @param $lat1 latitude of work location
    * @param $lon1 longitude of work location
    * @param $lat2 latitude of worker location
    * @param $lon2 longitude of worker location
    * @return Integer distance between worker location and work location
    */
    private function getDistanceFromLatLonInKm($lat1,$lon1,$lat2,$lon2) {
        $R = 6371; // Radius of the earth in km
        $dLat = deg2rad($lat2-$lat1);
        $dLon = deg2rad($lon2-$lon1); 
        $a = sin($dLat/2) * sin($dLat/2) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * sin($dLon/2) * sin($dLon/2); 
        $c = 2 * atan2(sqrt($a), sqrt(1-$a)); 
        $d = $R * $c; // Distance in km
        return $d;
    }
}
