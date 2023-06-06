<?php

/*Nama penamaan yang digunakan untuk mengelompokkan ke dalam package/folder*/

namespace App\Controllers\Admin;

/*Menggunakan*/

use App\Controllers\BaseController;

/*Nama kelas*/

class Barang extends BaseController
{
    protected $db;

    public function __construct()
    {
        $this->db = \Config\Database::connect();
    }

    public function index()
    {
        $getAllBarang = $this->db->table('barang')
            ->select('barang.*, kategori.nama as nama_kategori, gambar_produk.nama as nama_gambar')
            ->join('kategori', 'barang.kategori_id = kategori.id')
            ->join('gambar_produk', 'barang.id = gambar_produk.barang_id')
            ->groupBy('barang.id')
            ->orderBy('created_at ASC')
            ->get();

        $data = [
            'title' => 'Data Barang',
            'barang' => $getAllBarang->getResultArray()
        ];

        return view('admin/barang/index', $data);
    }

    public function tambah()
    {
        $getKategori = $this->db->table('kategori')->get();

        $data = [
            'title' => 'Tambah Barang',
            'kategori' => $getKategori->getResultArray()
        ];

        return view('admin/barang/tambah', $data);
    }

    public function add()
    {
        // if (!$this->validate([
        //     'id' => [
        //         'rules' => 'is_unique[barang.id]',
        //         'errors' => [
        //             'is_unique' => 'Kode barang sudah digunakan.',
        //         ]
        //     ],
        //     'nama' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'Kolom nama barang harus diisi.'
        //         ]
        //     ],
        //     'deskripsi' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'Kolom deskripsi barang harus diisi.'
        //         ]
        //     ],
        //     'harga' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'Kolom harga barang harus diisi.'
        //         ]
        //     ],
        //     'stok' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'Kolom stok barang harus diisi.'
        //         ]
        //     ],
        //     'kategori_id' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'Kolom kategori barang harus diisi.'
        //         ]
        //     ],
        //     'berat' => [
        //         'rules' => 'required',
        //         'errors' => [
        //             'required' => 'Kolom berat barang harus diisi.'
        //         ]
        //     ],
        // ])) {
        //     session()->setFlashdata('gagal', $this->validator->listErrors());
        //     return redirect()->back()->withInput();
        // }

        $id = 'BRG-' . random_string('numeric', 5);
        // dd($this->request-> getVar('nama'));
        $slug = url_title($this->request->getVar('nama'), '-', true);

        $data = [
            'id' => $id,
            'nama' => $this->request->getVar('nama'),
            'slug' => $slug,
            'deskripsi' => $this->request->getVar('deskripsi'),
            'kategori_id' => $this->request->getVar('kategori_id'),
            'harga' => $this->request->getVar('harga'),
            'stok' => $this->request->getVar('stok'),
            'berat' => $this->request->getVar('berat'),
            'created_by' => user_id(),
            'updated_by' => user_id()
        ];

        $this->db->table('barang')->insert($data);

        $images_3d = $this->request->getFile('images_3d');
        $images_product = $this->request->getFileMultiple('images_product');

        // pindahkan file zip yang diupload ke folder temp
        if ($images_3d->isValid() && !$images_3d->hasMoved()) {
            $images_3d->move('./temp', $images_3d->getName());
        }

        // buat instance dari ZipArchive
        $zip = new \ZipArchive;

        // ngecek zip images_3d yang diupload tu benaran zip atau nda
        if ($zip->open('./temp/' . $images_3d->getName()) === TRUE) {
            // extract zip nya ke folder /img/temp/{id_barang}
            $zip->extractTo('./temp');
            // ini artinya kita udah selesai melakukan operasi di zip tersebut
            $zip->close();

            unlink('./temp/' . $images_3d->getName());
        }

        $extracted_3d_images = glob("temp/*");

        if ($extracted_3d_images) {
            foreach ($extracted_3d_images as $image_3d) {
                $images_3d_dir = 'img/' . $id;

                if (!is_dir($images_3d_dir)) {
                    mkdir($images_3d_dir, 0777, true);
                }

                $newFileName = $images_3d_dir . '/' . basename($image_3d);
                rename($image_3d, $newFileName);

                $data_gambar_3d[] = [
                    'barang_id' => $id,
                    "nama" => $newFileName
                ];
            }

            $this->db->table('gambar')->insertBatch($data_gambar_3d);
            rmdir('./temp');
        }

        if (count($images_product) > 5) {
            session()->setFlashdata('gagal', "maksimal 5 gambar produk");
            return redirect()->back()->withInput();
        }

        if ($images_product) {
            foreach ($images_product as $image) {
                $filename = $image->getRandomName();
                $image->move('img', $filename);
                $data_gambar_produk[] = [
                    'barang_id' => $id,
                    'nama' => $filename
                ];
            }
            $this->db->table('gambar_produk')->insertBatch($data_gambar_produk);
        }

        $barang_data = [
            'updated_by' => user_id()
        ];

        $this->db->table('barang')->where('id', $id)->update($barang_data);

        session()->setFlashdata('berhasil', 'Data barang berhasil ditambahkan');
        return redirect()->to('data-barang');
    }

    /////////////////
    public function detail($id)
    {
        $getBarang = $this->db->table('barang')->where('id', $id)->get();
        $getGambar_3d = $this->db->table('gambar')->where('barang_id', $id)->get();
        $getGambar_produk = $this->db->table('gambar_produk')->where('barang_id', $id)->get();
        $getKategori = $this->db->table('kategori')->get();
        $data = [
            'title' => 'Detail Barang',
            'barang' => $getBarang->getRowArray(),
            'gambar' => $getGambar_3d->getResultArray(),
            'gambar_produk' => $getGambar_produk->getResultArray(),
            'kategori' => $getKategori->getResultArray()
        ];

        return view('admin/barang/detail', $data);
    }

    public function edit()
    {
        if (!$this->validate([
            'id' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Kolom nama barang harus diisi.'
                ]
            ],
            'nama' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Kolom nama barang harus diisi.'
                ]
            ],
            'deskripsi' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Kolom deskripsi barang harus diisi.'
                ]
            ],
            'harga' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Kolom harga barang harus diisi.'
                ]
            ],
            'stok' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Kolom stok barang harus diisi.'
                ]
            ],
            'berat' => [
                'rules' => 'required',
                'errors' => [
                    'required' => 'Kolom berat barang harus diisi.'
                ]
            ],
        ])) {
            session()->setFlashdata('gagal', $this->validator->listErrors());
            return redirect()->back()->withInput();
        }

        $id = $this->request->getVar('id');
        $data = [
            'nama' => $this->request->getVar('nama'),
            'deskripsi' => $this->request->getVar('deskripsi'),
            'harga' => $this->request->getVar('harga'),
            'kategori_id' => $this->request->getVar('kategori_id'),
            'stok' => $this->request->getVar('stok'),
            'berat' => $this->request->getVar('berat'),
            'updated_by' => user_id()
        ];

        $this->db->table('barang')->where('id', $id)->update($data);

        $images = $this->request->getFileMultiple('images_product');
        $images_3d = $this->request->getFile('images_3d');

        if ($images) {
            if ($images[0]->isValid()) {
                $this->db->table('gambar_produk')->where('barang_id', $id)->delete();

                foreach ($images as $image) {
                    $filename = $image->getRandomName();
                    $image->move('img', $filename);
                    $data_gambar[] = [
                        'barang_id' => $id,
                        'nama' => $filename
                    ];
                }

                $this->db->table('gambar_produk')->insertBatch($data_gambar);
            }
        }

        // pindahkan file zip yang diupload ke folder temp
        if ($images_3d->isValid() && !$images_3d->hasMoved()) {
            $images_3d->move('./temp', $images_3d->getName());
        }

        // buat instance dari ZipArchive
        $zip = new \ZipArchive;

        // ngecek zip images_3d yang diupload tu benaran zip atau nda
        if ($zip->open('./temp/' . $images_3d->getName()) === TRUE) {
            // extract zip nya ke folder /img/temp/{id_barang}
            $zip->extractTo('./temp');
            // ini artinya kita udah selesai melakukan operasi di zip tersebut
            $zip->close();

            unlink('./temp/' . $images_3d->getName());
        }

        $extracted_3d_images = glob("temp/*");

        if ($extracted_3d_images) {
            $images_3d_dir = 'img/' . $id;

            // hapus foto 3d produk yang lama
            $old_3d_images = glob($images_3d_dir . '/*');
            foreach ($old_3d_images as $old_image) {
                if (is_file($old_image))
                    unlink($old_image);
            }

            foreach ($extracted_3d_images as $image_3d) {
                if (!is_dir($images_3d_dir)) {
                    mkdir($images_3d_dir, 0777, true);
                }

                $newFileName = $images_3d_dir . '/' . basename($image_3d);
                rename($image_3d, $newFileName);

                $data_gambar_3d[] = [
                    'barang_id' => $id,
<<<<<<< HEAD
                    "nama" => $newFileName
=======
                    'nama' => $filename
>>>>>>> a8214f26bd673c6a0dcfba837bb4d821f3259a41
                ];
            }

            $this->db->table('gambar')->where('barang_id', $id)->delete();
            $this->db->table('gambar')->insertBatch($data_gambar_3d);
            rmdir('./temp');
        }

        session()->setFlashdata('berhasil', 'Data barang berhasil ditambahkan');
        return redirect()->to('data-barang');
    }

    public function delete()
    {
        $data = [
            'id' => $this->request->getVar('id')
        ];

        $this->db->table('barang')->delete($data);
        $this->db->table('gambar')->where('barang_id', $data)->delete();

        session()->setFlashdata('berhasil', 'Selamat data berhasil dihapus');
        return redirect()->back();
    }
}
