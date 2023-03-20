<?php

namespace App\Controllers\Guest;

use App\Controllers\BaseController;

class development extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Team'
        ];

        return view('guest/development/index', $data);
    }
}
