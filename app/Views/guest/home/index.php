<?= $this->extend('guest/layout/index'); ?>

<?= $this->section('guest-content'); ?>

<head>
<meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Diby Leather | Tas Kulit Wanita Inovasi Pertama di Indonesia</title>
    <meta name="description" content="Produsen tas kulit dengan teknik pewarnaan inovasi terbaru. Terbatas dan Istimewa setiap jenisnya. Menerima pesanan custom, hadiah, dan suvenir berbahan kulit.">
    <meta name="keywords" content="tas, kulit, produsen, inovasi, terbatas, istimewa, pesanan, hadiah, suvenir, handbag, slingbag">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="index, follow">
    <!-- Place favicon.ico in the root directory -->
    <link rel="shortcut icon" type="image/x-icon" href="<?= base_url(); ?>/assets/images/logo.png">
</head>
<!-- banner area start  -->
<div class="banner-area banner-area3 pos-rel">
    <div class="swiper-container slider__active">
        <div class="swiper-wrapper">
            <?php foreach ($banner as $key) : ?>
                <div class="swiper-slide">
                    <div class="single-banner single-banner-3 banner-800 d-flex align-items-center pos-rel">
                        <div class="banner-bg banner-bg3 banner-bg3-1" data-background="<?= base_url(); ?>/img/<?= $key['image']; ?>">
                        </div>
                        <div class="container pos-rel">
                            <div class="row align-items-center">
                                <div class="col-lg-8 col-md-8">
                                    <div class="banner-content banner-content3 banner-content3-1 pt-0">
                                        <div class="banner-meta-text" data-animation="fadeInUp" data-delay=".3s">
                                            <span><?= $key['meta_text']; ?></span>
                                        </div>
                                        <h1 class="banner-title" data-animation="fadeInUp" data-delay=".5s">
                                            <?= $key['title']; ?></h1>
                                        <div class="banner-btn" data-animation="fadeInUp" data-delay=".7s">
                                            <a href="<?= base_url('katalog'); ?>" class="fill-btn">Belanja Sekarang</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <!-- If we need navigation buttons -->
        <div class="slider-nav d-none">
            <div class="slider-button-prev"><i class="fal fa-long-arrow-left"></i></div>
            <div class="slider-button-next"><i class="fal fa-long-arrow-right"></i></div>
        </div>
        <div class="slider2-pagination-container">
            <div class="container">

                <!-- If we need pagination -->
                <div class="slider-pagination slider2-pagination"></div>
            </div>
        </div>
    </div>
</div>
<!-- banner area end  -->

<!-- product area start  -->
<section class="product-area pt-80 pb-90">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-8">
                <div class="section-title text-center">
                    <h2 class="section-main-title mb-35">Produk Minggu ini</h2>
                </div>
            </div>
        </div>
        <div class="product-tab-wrapper">
            <div class="product-tab-nav mb-60">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-1-tab" data-bs-toggle="tab" data-bs-target="#nav-1" type="button" role="tab" aria-controls="nav-1" aria-selected="true">Populer<span class="total-product">[<?= count($barang); ?>]</span></button>
                        <button class="nav-link" id="nav-2-tab" data-bs-toggle="tab" data-bs-target="#nav-2" type="button" role="tab" aria-controls="nav-2" aria-selected="false">Terbaru<span class="total-product">
                                [<?= count($terbaru); ?>]</span></button>
                    </div>
                </nav>
            </div>
            <div class="product-tab-content">
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-1" role="tabpanel" aria-labelledby="nav-1-tab">
                        <div class="products-wrapper-slide pos-rel">
                            <div class="product-tab-slider-nav">
                                <div class="product-tab-slider-button-prev"><i class="fal fa-long-arrow-left"></i>
                                </div>
                                <div class="product-tab-slider-button-next"><i class="fal fa-long-arrow-right"></i>
                                </div>
                            </div>
                            <div class="product-tab-slider swiper-container">
                                <div class="swiper-wrapper">
                                    <?php foreach ($barang as $key) : ?>
                                        <div class="swiper-slide product-swiper-wrapper">
                                            <div class="single-product single-product-st2">
                                                <div class="product-image pos-rel">
                                                    <a href="<?= base_url("katalog/" . $key['slug']); ?>" class=""><img src="<?= base_url(); ?>/img/<?= $key['gambar']; ?>" alt="img"></a>
                                                    <div class="product-action-bottom">
                                                        <a href="<?= base_url("katalog/" . $key['slug']); ?>" class="add-cart-btn"><i class="fal fa-shopping-bag"></i>Beli</a>
                                                    </div>
                                                    <div class="product-sticker-wrapper">
                                                        <span class="product-sticker discount">Terjual <?= $key['pembelian']; ?></span>
                                                    </div>
                                                </div>
                                                <div class="product-desc">
                                                    <div class="product-name"><a href="<?= base_url("katalog/" . $key['slug']); ?>"><?= $key['nama']; ?></a>
                                                    </div>
                                                    <div class="product-price">
                                                        <span class="price-now"><?= number_to_currency($key['harga'], 'IDR'); ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>

                                <div class="product-tab-pagination-container">
                                    <div class="container">

                                        <!-- If we need pagination -->
                                        <div class="product-tab-pagination"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-2" role="tabpanel" aria-labelledby="nav-2-tab">
                        <div class="products-wrapper-slide pos-rel">
                            <div class="product-tab-slider-nav">
                                <div class="product-tab-slider-button-prev"><i class="fal fa-long-arrow-left"></i>
                                </div>
                                <div class="product-tab-slider-button-next"><i class="fal fa-long-arrow-right"></i>
                                </div>
                            </div>
                            <div class="product-tab-slider swiper-container">
                                <div class="swiper-wrapper">
                                    <?php foreach ($terbaru as $key) : ?>
                                        <div class="swiper-slide product-swiper-wrapper">
                                            <div class="single-product single-product-st2">
                                                <div class="product-image pos-rel">
                                                    <a href="<?= base_url("katalog/" . $key['slug']); ?>" class=""><img src="<?= base_url(); ?>/img/<?= $key['gambar']; ?>" alt="img"></a>
                                                    <div class="product-action-bottom">
                                                        <a href="<?= base_url("katalog/" . $key['slug']); ?>" class="add-cart-btn"><i class="fal fa-shopping-bag"></i>Beli</a>
                                                    </div>
                                                    <div class="product-sticker-wrapper">
                                                        <span class="product-sticker new">Paling Baru</span>
                                                    </div>
                                                </div>
                                                <div class="product-desc">
                                                    <div class="product-name"><a href="<?= base_url("katalog/" . $key['slug']); ?>"><?= $key['nama']; ?></a>
                                                    </div>
                                                    <div class="product-price">
                                                        <span class="price-now"><?= number_to_currency(floatval($key['harga']), 'IDR'); ?></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>

                                <div class="product-tab-pagination-container">
                                    <div class="container">

                                        <!-- If we need pagination -->
                                        <div class="product-tab-pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- product area end  -->

<!-- contact map area start  -->
<div class="mapouter">
    <div class="gmap_canvas"><iframe width="100%" height="557" id="gmap_canvas" src="https://maps.google.com/maps?q=Jl. Durma No.132 Kutu Dukuh, Sinduadi Kec. Mlati Kabupaten Sleman, Daerah Istimewa Yogyakarta 55284&t=&z=14&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://2yu.co">2yu</a><br>
        <style>
            .mapouter {
                position: relative;
                text-align: right;
                height: 557px;
                width: 100%;
            }
        </style><a href="https://embedgooglemap.2yu.co">Goggle Map</a>
        <style>
            .gmap_canvas {
                overflow: hidden;
                background: none !important;
                height: 557px;
                width: 100%;
            }
        </style>
    </div>
</div>
<!-- contact map area end  -->

<!-- newsletter area end  -->
<script src="<?= base_url(); ?>/assets/js/nice-select.min.js"></script>
<?= $this->endSection(); ?>j