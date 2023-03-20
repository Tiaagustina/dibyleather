<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class GambarProduk extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id'    => [
                'type'  => 'INT',
                'constraint' => 11,
                'unsigned' => true,
                'auto_increment' => true,
            ],
            'barang_id' => [
                'type' => 'VARCHAR',
                'constraint' => 11,

            ],
            'nama' => [
                'type' => 'TEXT',

            ],
        ]);
        $this->forge->addKey('id', true);
        $this->forge->createTable('gambar_produk');
    }

    public function down()
    {
        $this->forge->dropTable('gambar_produk');
    }
}
