index_master.php<?= $this->extend('guest/layout/index'); ?>

<?= $this->section('guest-content'); ?>

<style type="text/css">
    @charset "utf-8";
    /* CSS Document */

    .menu {
        height: 13px;
        margin: 0px 20px;
    }

    .menu img {
        max-width: 100%;
        max-height: 100%;
    }

    .left {
        display: flex;
        float: left;
        align-items: center;
    }

    .left select {
        margin: 0px;
        outline: none;
        padding: 13px 8px;
        background-color: rgba(235, 235, 235, 0.6);
        font-size: 11px;
        font-weight: 700;
        border: none;
    }

    .right {
        float: right;
        padding: 10px 20px;
        background-color: #f44c52;
        border-radius: 10px;
    }

    .right a {
        color: #fcfcfc;
        font-weight: bold;
        font-size: 12px;
    }

    .content-container {
        position: relative;
        display: flex;
        align-items: center;
        flex-direction: row-reverse;
        justify-content: flex-end;
        margin: 80px;
    }

    .img-container {
        height: 450px;
        width: 1027;
        display: flex;
        align-items: center;
    }

    .img-container img {

        max-height: 100%;
        max-width: 100%;

    }

    .text-container {
        display: flex;
        margin-right: auto;
        flex-direction: column;
        flex-wrap: wrap;
        width: 600px;
    }

    h1 {
        font-size: 60px;
        margin: 0px;
        padding: 0px;
        font-family: bebas kai;
        letter-spacing: 2px;
        color: #262626;
    }

    p {
        color: #a8a1a1;
        width: 400px;
    }

    .price {
        color: #000000;
        font-size: 40px;
        font-family: bebas kai;
        text-shadow: 2px 2px 12px rgba(128, 128, 128, 0.3);
    }

    .cart {
        margin-top: 10px;
        position: absolute;
        bottom: 0px;
    }

    .cart select {
        padding: 13px 35px;
        border: 1px solid rgba(176, 176, 176, 1.00);
        outline: none;
    }

    .cart a {
        color: #FFFFFF;
        background-color: #f44e52;
        text-decoration: none;
        text-shadow: 0px 2px 12px rgba(0, 0, 0, 0.3);
        padding: 15px;
        width: 200px;
        height: 50px;
        font-weight: 200;
        margin-left: 20px;
        border-radius: 5px;
    }


    .center {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 400px;
    }

    .center img {
        display: flex;
        margin: auto;
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .close {
        font-size: 35px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: red;
        cursor: pointer;
    }

    button {
        background-color: #f44e52;
        box-shadow: 0px 2px 12px rgba(0, 0, 0, 0.4);
        text-shadow: 0px 2px 12px rgba(0, 0, 0, 0.6);
        color: white;
        padding: 14px 20px;
        margin: 8px 26px;
        border-radius: 10px;
        border: none;
        cursor: pointer;
        width: 200px;
        font-size: 20px;
        position: absolute;
        bottom: 0px;
        left: 56%;
        transform: translateX(-70%);
    }

    button:hover {
        opacity: 0.8;
    }
</style>
<!-- page title area start  -->
<section class="page-title-area" data-background="assets/img/bg/page-title-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-title-wrapper text-center">
                    <h1 class="page-title mb-10">Katalog</h1>
                    <div class="breadcrumb-menu">
                        <nav aria-label="Breadcrumbs" class="breadcrumb-trail breadcrumbs">
                            <ul class="trail-items">
                                <li class="trail-item trail-begin"><a href="index.html"><span>Home</span></a></li>
                                <li class="trail-item trail-end"><span>Katalog</span></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- page title area end  -->


<!-- shop main area start  -->
<div class="shop-main-area pt-120 pb-10">
    <div class="container">
        <div class="row">
            <?php
            $pesan = 'Halo kak, saya ingin konfrimasi pembayaran tas kulit';

            $url = 'https://api.whatsapp.com/send?phone=6282174145550&text=' . urlencode($pesan);
            if (session()->getFlashdata('berhasil')) : ?>
                <div class="alert mt-10 alert-success" role="alert">
                    <p><?= session()->getFlashdata('berhasil'); ?></p>
                    <a href="<?= $url; ?>" class="btn btn-success">Konfirmasi</a>
                </div>
                <?php elseif (session()->getFlashdata('gagal')) : ?>
                <div class="alert mt-10 alert-danger" role="alert">
                    <?= session()->getFlashdata('gagal'); ?>
                </div>
            <?php endif; ?>

            <div class="col-xl-9 col-lg-8 col-md-12">
                <div class="shop-main-wrapper mb-60">
                    <div class="shop-main-wrapper-head mb-30">
                        <div class="swowing-list">Showing <span>12 of 39</span> Products</div>
                    </div>
                    <div class="products-wrapper">
                        <?php foreach ($barang as $key) : ?>
                            <div class="single-product">
                                <div class="product-image pos-rel">
                                    <a href="<?= base_url("katalog/" . $key['slug']); ?>" class=""><img src="<?= base_url(); ?>/img/<?= $key['gambar']; ?>" alt="<?= $key['nama']; ?>"></a>
                                    <div class="product-action">
                                        <a href="#" class="quick-view-btn"><i class="fal fa-eye"></i></a>
                                    </div>
                                    <div class="product-action-bottom">
                                        <a href="<?= base_url("katalog/" . $key['slug']); ?>" class="add-cart-btn"><i class="fal fa-shopping-bag"></i>Beli</a>
                                    </div>
                                </div>
                                <div class="product-desc">
                                    <div class="product-name"><a href="shop-details.html"><?= $key['nama']; ?></a></div>
                                    <div class="product-price">
                                        <span class="price-now"><?= number_to_currency($key['harga'], 'IDR'); ?></span>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-lg-4 col-md-6">
                <div class="sidebar-widget-wrapper mb-110 d-none d-lg-block">
                    <div class="product-filters mb-50">
                        <div class="filter-widget">
                            <h4 class="filter-widget-title drop-btn">Category</h4>
                            <div class="filter-widget-content">
                                <div class="category-items">
                                    <a href="<?= base_url('katalog'); ?>" class="category-item">
                                        <div class="category-name">Semua</div>
                                    </a>
                                    <?php foreach ($kategori as $key) : ?>
                                        <a href="<?= base_url('katalog/kategori/' . $key['nama']); ?>" class="category-item">
                                            <div class="category-name"><?= $key['nama']; ?></div>
                                        </a>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- shop main area end  -->

<script src="<?= base_url(); ?>/assets/js/nice-select.min.js"></script>
<script src="<?= base_url(); ?>/assets/js/360deg.js"></script>
<?= $this->endSection(); ?>