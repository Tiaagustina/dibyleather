<?= $this->extend('guest/layout/index'); ?>

<?= $this->section('guest-content'); ?>

<section class="contact-main-area pt-120 pb-60">
         <div class="container container-small">
            <div class="row">
               <div class="col-lg-12 col-md-12">
                  <div class="sidebar-widget-wrapper mb-60">
                     <div class="sidebar-widget">
                        <h4 class="sidebar-widget-title">Profil</h4>
                        <div class="sidebar-widget-content">
                           <div class="contact-list">
                              <div class="contact-list-item">
                                 <div class="irc-item">
                                    <div class="irc-item-icon">
                                       <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
                                          <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5ZM9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8Zm1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5Z"/>
                                          <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2ZM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12V4Z"/>
                                        </svg>

                                    </div>
                                    <div class="irc-item-content">
                                       <div class="irc-item-heading">Username</div>
                                       <span><a><span><?= dd(session('email')) ?></span></a></span>
                                       </div>
                                 </div>
                              </div>
                              <div class="contact-list-item">
                                 <div class="irc-item">
                                    <div class="irc-item-icon">
                                       <svg id="email_3_" data-name="email (3)" xmlns="http://www.w3.org/2000/svg" width="22.57" height="16.271" viewBox="0 0 22.57 16.271">
                                          <path id="Path_10" data-name="Path 10" d="M20.933,20.521H4.137A2.9,2.9,0,0,1,1.25,17.634V7.137A2.9,2.9,0,0,1,4.137,4.25h16.8A2.9,2.9,0,0,1,23.82,7.137v10.5A2.9,2.9,0,0,1,20.933,20.521Zm-16.8-14.7A1.312,1.312,0,0,0,2.825,7.137v10.5a1.312,1.312,0,0,0,1.312,1.312h16.8a1.312,1.312,0,0,0,1.312-1.312V7.137a1.312,1.312,0,0,0-1.312-1.312Z" transform="translate(-1.25 -4.25)" fill="#171717"></path>
                                          <path id="Path_11" data-name="Path 11" d="M12.534,13.7a3.412,3.412,0,0,1-1.732-.472L1.638,7.778a.8.8,0,0,1-.283-1.05A.777.777,0,0,1,2.4,6.455l9.175,5.438a1.774,1.774,0,0,0,1.848,0L22.6,6.455a.777.777,0,0,1,1.05.273.8.8,0,0,1-.283,1.05l-9.1,5.448a3.412,3.412,0,0,1-1.732.472Z" transform="translate(-1.249 -4.145)" fill="#171717"></path>
                                       </svg>


                                    </div>
                                    <div class="irc-item-content">
                                       <div class="irc-item-heading">Email</div>
                                       <span><a><span>Email</span></a></span>
                                       </div>
                                    </div>
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

<!-- speciality area start  -->
<div class="container">
    <div class="content-video">
        <!-- testimonial area end  -->
        <script src="<?= base_url(); ?>/assets/js/nice-select.min.js"></script>
        <?= $this->endSection(); ?>