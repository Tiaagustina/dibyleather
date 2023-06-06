<?= $this->extend('guest/layout/index'); ?>

<?= $this->section('guest-content'); ?>

<!-- page title area start  -->
<section class="page-title-area" data-background="assets/img/bg/page-title-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-title-wrapper text-center">
                    <h1 class="page-title mb-10">Detail Transaksi</h1>
                    <div class="breadcrumb-menu">
                        <nav aria-label="Breadcrumbs" class="breadcrumb-trail breadcrumbs">
                            <ul class="trail-items">
                                <li class="trail-item trail-begin"><a href="/"><span>Beranda</span></a></li>
                                <li class="trail-item trail-begin"><a href="/riwayat"><span>Riwayat Transaksi</span></a></li>
                                <li class="trail-item trail-end"><span>Detail Transaksi</span></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- page title area end  -->

<!-- detail riwayat area start  -->
<section class="cart-area pt-100 pb-100">
    <div class="container container-small">
        <div class="row">
            <div class="col-12">
                <div class="table-content table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th class="product-thumbnail">Gambar</th>
                            <th class="cart-product-name">Produk</th>
                            <th class="product-price">Harga</th>
                            <th class="product-quantity">Jumlah</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $i = 1;

                        foreach ($data_transaksi as $t) : ?>
                            <tr>
                                <td align="center"><?= $i++; ?></td>
                                <td class="product-thumbnail">
                                    <a href="<?= base_url('katalog/' . $t['slug_barang']); ?>"><img src="<?= base_url(); ?>/img/<?= $t['nama_gambar']; ?>" alt="img"></a>
                                </td>
                                <td class="product-name">
                                    <a href="<?= base_url('katalog/' . $t['slug_barang']); ?>"><?= $t['nama_barang']; ?></a>
                                </td>
                                <td class="product-price">
                                    <span class="amount"><?= number_to_currency($t['harga_barang'], 'IDR') ?></span>
                                </td>
                                <td class="product-quantity text-center">
                                    <span><?= $t['jumlah'] ?></span>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
                <div class="row justify-content-end">
                    <div class="col-md-5">
                        <div class="cart-page-total">
                            <h2>Total Transaksi</h2>
                            <ul class="mb-20">
                                <?php $totalBarang = 0; ?>
                                <?php foreach ($data_transaksi as $t) : ?>
                                    <?php $totalBarang += $t['harga_barang'] * $t['jumlah']; ?>
                                <?php endforeach; ?>
                                <li>Subtotal <span id="biaya-kirim"><?= number_to_currency($totalBarang, 'IDR') ?></span></li>
                                <li>Biaya Kirim <span id="biaya-kirim"><?= number_to_currency($total - $totalBarang, 'IDR') ?></span></li>
                                <li class="fw-bold">Total <span id="total-harga"><?= number_to_currency($total, 'IDR') ?></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- detail riwayat area end  -->
<?= $this->endSection(); ?>
