<?php

namespace App\Http\Controllers\Worker;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\ClockIn;
use App\Models\Worker;

class ClockInController extends Controller
{

    public function __construct() {
        // $this->middleware('auth');
        // auth worker, return 401 if not auth
        // load worker with worker_id, return 404 if not found
        // run validation with dynamic $rules of each api 
    }

    /**
     * Fetch worker clockins.
     *
     * @param  \Illuminate\Http\Request  $request with query params = worker_id
     * @throws 400 Bad Request if worker_id is not present
     * @throws 404 Not Found if worker not found
     * @return Json Array of clock-ins object if any
     */
    public function index(Request $request) {    
        $errors = $this->valid_params($request, ["worker_id" => "required"]);
        if ($errors->any()){
            abort(400, $errors);
        }
        // this should be handled in constructor for all controllers function that expect worker_id
        $worker = Worker::where('id', '=', $request->input("worker_id"))->first();
        if ($worker === null){
            abort(404);
        }
        $clockIns = ClockIn::where('worker_id', '=', $request->query("worker_id"))->get();
        return response()->json($clockIns);
    }

    /** 
    * Create clockIn for a worker
    *
    * @param \Illuminate\Http\Request  $request with input data = { worker_id , timestamp, latitude, longitude }
    * @throws 400 Bad Request if any param of { worker_id , timestamp, latitude, longitude } is not present
    * @throws 404 Not Found if worker not found
    * @throws 422 Unprocessable Entity if worker location not within 2km from work location
    * @return Json object of created clock-in
    */
    public function create(Request $request) {
        // test pont1 30.04899435644716, 31.242161446031737 < 2 km true
        // test pont2 30.007273923465522, 31.23023153819982 < 2 km false
        $dateTimeBuffer = date('Y-m-d H:i:s', strtotime('-15 minutes'));
        $errors = $this->valid_params($request,[
            "worker_id" => "required", "timestamp" => "required|date|after:{$dateTimeBuffer}|before:now",
            "latitude"  => "required", "longitude"  => "required",
        ]);

        if ($errors->any()){
            abort(400, $errors);
        }

        // this should be handled in constructor for all controllers function that expect worker_id
        $worker = Worker::where('id', '=', $request->input("worker_id"))->first();
        if ($worker === null){
            abort(404);
        }

        $lat = $request->input("latitude");
        $lon = $request->input("longitude");
        $canClockIn = $worker->inWorkPremises($lat, $lon);     
        if ($canClockIn) {
            $clockIn = ClockIn::create([
                'signed_in_at' => $request->input('timestamp'),
                'worker_id' => $worker->id,    
                'location' => DB::raw("(ST_GeomFromText('POINT($lon $lat)'))"),
                'ip_address' =>$request->ip(), //change this if using a load balancer
            ]);
            return response()->json($clockIn, 201);
        } else {
            abort(422);
        }
    }

    /** 
    * Validate Request Params
    *
    * @param \Illuminate\Http\Request  $request 
    * @param $rules to apply on params
    * @return Messagebag with errors if any
    */
    private function valid_params($request, $rules) {
        $validator = Validator::make($request->all(), $rules);
        return $validator->errors();
    }
}
