<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/worker/clock-ins', 'App\Http\Controllers\Worker\ClockInController@index');
Route::post('/worker/clock-in', 'App\Http\Controllers\Worker\ClockInController@create');
