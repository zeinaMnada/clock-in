<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ClockInTest extends TestCase
{
    public function test_fetch_clock_ins_success(): void
    {
        $response = $this->get('api/worker/clock-ins?worker_id=1');

        $response->assertStatus(200);
    }

    public function test_fetch_clock_ins_bad_request(): void
    {
        $response = $this->get('api/worker/clock-ins');

        $response->assertStatus(400);
    }

    public function test_worker_clock_in_success(): void
    {
        $response = $this->post('api/worker/clock-in', [
                    "worker_id"=>"1",
                    "timestamp"=>date('Y-m-d H:i:s', strtotime('-5 minutes')),
                    "latitude"=>"30.04899435644716",
                    "longitude"=>"31.242161446031737"
                    ]);
        $response->assertStatus(201);
    }

    public function test_worker_clock_in_reject(): void
    {
        $response = $this->post('api/worker/clock-in', [
            "worker_id"=>"1",
            "timestamp"=>date('Y-m-d H:i:s', strtotime('-5 minutes')),
            "latitude"=>"31.23023153819982",
            "longitude"=>"30.007273923465522"
            ]);
        $response->assertStatus(422);
    }

    public function test_worker_clock_in_bad_request(): void
    {
        $response = $this->post('api/worker/clock-in', [
            "worker_id"=>"1",
            "timestamp"=>date('Y-m-d H:i:s', strtotime('-5 minutes')),
            "longitude"=>"31.242161446031737"
            ]);
        $response->assertStatus(400);
    }

    public function test_worker_clock_in_past_timestamp_bad_request(): void
    {
        $response = $this->post('api/worker/clock-in', [
            "worker_id"=>"1",
            "timestamp"=>date('Y-m-d H:i:s', strtotime('-20 minutes')),
            "latitude"=>"30.04899435644716",
            "longitude"=>"31.242161446031737"
            ]);
        $response->assertStatus(400);
    }

    public function test_worker_clock_in_future_timestamp_bad_request(): void
    {
        $response = $this->post('api/worker/clock-in', [
            "worker_id"=>"1",
            "timestamp"=>date('Y-m-d H:i:s', strtotime('+1 hour')),
            "latitude"=>"30.04899435644716",
            "longitude"=>"31.242161446031737"
            ]);
        $response->assertStatus(400);
    }

    public function test_worker_clock_in_not_found(): void
    {
        $response = $this->post('api/worker/clock-in', [
            "worker_id"=>"70",
            "timestamp"=>date('Y-m-d H:i:s', strtotime('-5 minutes')),
            "latitude"=>"30.04899435644716",
            "longitude"=>"31.242161446031737"
            ]);
        $response->assertStatus(404);
    }
}
