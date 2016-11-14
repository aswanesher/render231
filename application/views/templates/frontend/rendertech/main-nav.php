<!-- Navigation -->
    <nav class="navbar navbar-inverse" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- text logo on mobile view -->
                <a class="navbar-brand visible-xs" href="Beranda"><small>Render Tech Production</small> </a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
				<?php //if(!$this->session->userdata('user_data')){ ?>
                    <?php foreach ($menu as $r) { ?>
					<li><a href="<?php echo base_url().$r->url;?>"><?php echo $r->title;?></a></li>
					<!--<li><a href="Data-Produk">Data Produk</a></li>
					<li><a href="Keranjang-Belanja">Keranjang Belanja</a></li>
					<li><a href="Registrasi">Registrasi</a></li>
					<li><a href="Kontak-Kami">Kontak Kami</a></li>-->
                    <?php } ?>
		   </div>
        </div>
    </nav>
    <!-- End Navigation -->