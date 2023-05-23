<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;

class Users extends BaseController {
    protected $db;

    public function __construct() {
        $this->db = \Config\Database::connect();
    }

    public function index()
    {
        $dataUsers = $this->db->table('users')->get();

        $data = [
            'title' => 'Data Barang',
            'users' => $dataUsers->getResultArray()
        ];

        return view('admin/users/index', $data);
    }

    public function delete()
    {
        $data = [
            'id' => $this->request->getVar('id')
        ];

        $this->db->table('users')->delete($data);

        session()->setFlashdata('berhasil', 'Selamat data berhasil dihapus');
        return redirect()->back();
    }
}