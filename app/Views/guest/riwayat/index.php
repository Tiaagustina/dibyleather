<?= $this->extend('guest/layout/index'); ?>

<?= $this->section('guest-content'); ?>

<!-- page title area start  -->
<section class="page-title-area" data-background="assets/img/bg/page-title-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-title-wrapper text-center">
                    <h1 class="page-title mb-10">Riwayat Transaksi</h1>
                    <div class="breadcrumb-menu">
                        <nav aria-label="Breadcrumbs" class="breadcrumb-trail breadcrumbs">
                            <ul class="trail-items">
                                <li class="trail-item trail-begin"><a href="index.html"><span>Beranda</span></a></li>
                                <li class="trail-item trail-end">Riwayat Transaksi</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- page title area end  -->

<section class="cart-area pt-100 pb-100">
    <div class="container container-small">
        <div class="row">
            <div class="col-12">
                <div class="table-content table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>Total</th>
                            <th>Alamat</th>
                            <th>No. Telepon</th>
                            <th>Aksi</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $i = 1;

                        foreach ($transaksi as $t) : ?>
                            <tr>
                                <td align="center"><?= $i++; ?></td>
                                <td>
                                    <span class="amount"><?= number_to_currency($t['total'], 'IDR') ?></span>
                                </td>
                                <td>
                                    <span><?= $t['alamat'] ?></span>
                                </td>
                                <td>
                                    <span><?= $t['no_telp'] ?></span>
                                </td>
                                <td>
                                    <a class="detail-btn" href="<?= base_url('riwayat/' . $t['id']); ?>">Detail</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- cart area end  -->
<?= $this->endSection(); ?>
