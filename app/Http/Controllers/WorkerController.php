<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WorkerController extends Controller
{
    public function clockIns($id)
    {
        return ClockIn::where('worker_id', '=', $id);

    }

    public function clockIn(Request $request)
    {
        $clockIn = ClockIn::create($request->all());

        return response()->json($clockIn, 201);
    }
}
