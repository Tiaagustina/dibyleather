<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;

class Dashboard extends BaseController
{
    protected $db;
    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }

    public function index()
    {
        $countUser = $this->db->table('users')->get()->getResultArray();
        $countTerjual = $this->db->table('pesanan')->get()->getResultArray();
        $countBarang = $this->db->table('barang')->get()->getResultArray();

        $data = [
            'title' => 'Dashboard Admin',
            'user' => count($countUser),
            'terjual' => count($countTerjual),
            'barang' => count($countBarang)
        ];

        return view('admin/dashboard/index', $data);
    }
}
