<?= $this->extend('guest/layout/index'); ?>

<?= $this->section('guest-content'); ?>

<!-- page title area start  -->
<section class="page-title-area" data-background="assets/img/bg/page-title-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-title-wrapper text-center">
                    <h1 class="page-title mb-10">Team</h1>
                    <div class="breadcrumb-menu">
                        <nav aria-label="Breadcrumbs" class="breadcrumb-trail breadcrumbs">
                            <ul class="trail-items">
                                <li class="trail-item trail-begin"><a href="index.html"><span>Beranda</span></a></li>
                                <li class="trail-item trail-end"><span>Team</span></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- page title area end  -->

<!-- about-heading area start  -->
<div class="about-heading">
    <div class="container container-small">
        <div class="row">
            <div class="col-lg-12">
                <div class="about-heading-content">
                    <h2 class="heading-title">"Diby Leather adalah produsen tas kulit asli dari Yogyakarta"</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- about-heading area end  -->

<!-- about-area start  -->
<section class="about-area pb-90">
    <div class="container container-small">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <div class="about-thumb pos-rel mb-30">
                    <img class="about-thumb-main" src="assets/img/about/founder.png" alt="img">

                </div>
            </div>
            <div class="col-lg-6">
                <div class="about-content mb-30 align-pb-35">
                    <div class="section-title">
                        <h2 class="section-main-title mb-30">Deskripsi Tentang Diby Leather</h2>
                    </div>
                    <p class="mb-40">Diby Leather adalah produsen tas kulit asli yang berada di Yogyakarta dengan mengunggulkan teknologi inovasi finishing samak kulit sapi yang terlukis di dalam air, inovatif serta limited,menjadi produk inovasi pertama dan satu-satunya di Indonesia.

                        kami memakai bahan baku yang ramah lingkungan serta produk yang telah teruji secara Lab, untuk ketahanan terhadap asam,basa, kelunturan,gesekan dan juga panas. Diby Leather juga melakukan sebuah kepedulian terhadap para wanita,sehingga kami konsern pada pemberdayaan wanita lokal dan juga peduli terhadap remaja-remaja panti asuhan.

                        Diby juga melakukan penjualan secara retail,wholesale dan made to order leather goods untuk produk yang terbuat dari bahan baku kulit asli baik untuk klien,toko fashion,souvenir,dan coorporate gift.</p>

                </div>
            </div>
        </div>
    </div>

</section>
<!-- about-area end  -->



<!-- speciality area start  -->
<div class="container">
    <div class="content-video">
        <!-- Tempatkan Video Youtube Disini -->
        <iframe width="100%" height="500" src="https://www.youtube.com/embed/V9XJMe3N9rQ" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

        <!-- speciality area end  -->

        <!-- testimonial area end  -->
        <script src="<?= base_url(); ?>/assets/js/nice-select.min.js"></script>
        <?= $this->endSection(); ?>