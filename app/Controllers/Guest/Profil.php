<?php

namespace App\Controllers\Guest;

use App\Controllers\BaseController;

class Profil extends BaseController
{
	public function index()
	{
		$data = [
			'title' => 'Profil'
		];

		return view('guest/profil/index', $data);
	}
}