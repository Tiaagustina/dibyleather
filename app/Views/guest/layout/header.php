    <!-- header area start  -->

    <header class="header4">
        <div class="header-top d-none d-md-block">
            <div class="container header-container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="header-top-link">
                            <a href="<?= base_url("index.php"); ?>" class="text-btn"></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6">
                        <div class="header-top-right">
                            <?php if (logged_in()) : ?>
                                <a href="<?= base_url("logout"); ?>" class="text-btn"><i class="flaticon-avatar"></i>Keluar</a>
                            <?php else : ?>
                                <a href="<?= base_url("login"); ?>" class="text-btn"><i class="flaticon-avatar"></i>Masuk</a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="header-sticky" class="header-main header-main1">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-12 col-lg-12">
                        <div class="header-main-content-wrapper">
                            <div class="header-main-left header-main-left-header1">
                                <div class="header-logo header1-logo">
                                    <a href="/beranda" class="logo-bl"><img src="<?= base_url(); ?>/assets/images/logo1.png" alt="logo-img"></a>
                                </div>
                                <div class="main-menu main-menu4 d-none d-lg-block">
                                    <nav id="mobile-menu">
                                        <ul>
                                            <li><a href="<?= base_url("/"); ?>">Beranda</a></li>
                                            <li><a href="<?= base_url("katalog"); ?>">Etalase</a></li>
                                            <li><a href="<?= base_url("about"); ?>">Tentang Kami</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="header-main-right header-main-right-header1">
                                <form action="#" class="filter-search-input header-search d-none d-xl-inline-block">
                                    <input type="text" placeholder="Mencari produk.....">
                                    <button><i class="fal fa-search"></i></button>
                                </form>
                                <div class="action-list d-none d-md-flex action-list-header1">
                                    <div class="action-item action-item-cart">
                                        <a href="<?= base_url('keranjang'); ?>" class="view-cart-button">
                                            <i class="fal fa-shopping-bag"></i></a>
                                        <a href="<?= base_url('riwayat'); ?>" class="view-riwayat-button">
                                            <i class="fal fa-receipt"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header area end -->