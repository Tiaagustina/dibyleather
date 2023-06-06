<?php

namespace App\Controllers\Guest;

use App\Controllers\BaseController;

class Riwayat extends BaseController
{
    protected $db;
    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }

    public function index()
    {
        $getTransaksi = $this->db->table('pesanan')->where('pesanan.user_id', user_id())->get()->getResultArray();

        $data = [
            'title' => 'Riwayat Transaksi',
            'transaksi' => $getTransaksi
        ];

        return view('guest/riwayat/index', $data);
    }

    public function detail($id)
    {
        $total = 0;
        $getPemesan = $this->db->table('pesanan')->where('pesanan.user_id', user_id())->join('users', 'pesanan.user_id = users.id')->where('pesanan.id', $id)->get()->getRowArray();
        $getTotalTransaksi = $this->db->table('pesanan')->select('total')->where('id', $id)->get();

        if ($getTotalTransaksi->getNumRows() > 0) {
            $row = $getTotalTransaksi->getRow();
            $total = $row->total;
        }

        $getDataTransaksi = $this->db->table('detail_pesanan')->select('detail_pesanan.jumlah as jumlah, barang.nama as nama_barang, barang.slug as slug_barang, barang.harga as harga_barang, gambar_produk.nama as nama_gambar')
            ->join('barang', 'detail_pesanan.barang_id = barang.id')
            ->join('gambar_produk', 'detail_pesanan.barang_id = gambar_produk.barang_id', 'left')
            ->where('detail_pesanan.pesanan_id', $id)
            ->get()
            ->getResultArray();

        $data = [
            'title' => 'Detail Transaksi',
            'data_transaksi' => $getDataTransaksi,
            'pemesan' => $getPemesan,
            'total' => $total,
        ];

        return view('guest/riwayat/detail', $data);
    }
}
