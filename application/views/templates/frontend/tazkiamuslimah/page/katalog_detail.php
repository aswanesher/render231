<!-- Header -->
<header class="pghead-section pghead-section3">
	<div class="bg-section full-wh bg-cc bg-cover" data-bg="<?php echo base_url();?>assets/frontend/tazkiamuslimah/images/bg1.jpg" style="background-image: url(&quot;images/bg1.jpg&quot;);"></div>
	<div class="container typo-light">
		<div class="flex-row middle-md">
			<div class="flex-col-md-6">
				<h1 class="title medium mr-b-10"><?php echo $page_title;?></h1>
			</div>
			<div class="flex-col-md-6">
				<div class="pg-path">
					<a href="<?php echo base_url();?>">Home</a>
					<b> / </b>
					<a href="<?php echo base_url();?>p/katalog-produk">Katalog Produk</a>
					<b> / </b>
					<a href="#"><?php echo $page_title?></a>
				</div>	
			</div>
		</div>
	</div>
</header><!-- / Header --><!-- content-section -->
<section class="content-section content-section-9">
	<div class="container">
		<div class="row">
			
			<!-- Column -->
			<div class="col-md-6">
				<p><img src="<?php echo base_url().$dtprod->gambar_produk;?>" class="img-responsive" alt="Image"></p>
				<div class="product-box product-box1 align-l">
					<div class="info">
						<h3 class="hd">Info dan Pemesanan</h3>
						<p class="txt">Untuk info dan pemesanan produk silahkan menghubungi Kami melalui media berikut</p>
						<hr class="mr-tb-10 op">
						
						<div class="editContent">
							<strong>BBM</strong> : <?php if(!empty($bbm)) { echo $bbm; } else { echo "-"; }?><br>
							<strong>Whatsapp</strong> : <?php if(!empty($whatsapp)) { echo $whatsapp; } else { echo "-"; }?><br>
							<strong>Telegram</strong> : <?php if(!empty($telegram)) { echo $telegram; } else { echo "-"; }?><br>
						</div>
					</div>
				</div><!-- /.product-box -->
				
			</div><!-- / Column -->
			
			<!-- Column -->
			<div class="col-md-5 align-l">
				<h2 class="title"><?php echo $dtprod->nama_produk;?></h2>
				<h5>Kode Produk : <?php echo $dtprod->kode_produk;?></h5>
				<h5>Harga : Rp. <?php echo number_format($dtprod->harga, 0, '.', '.');?></h5>
				<div style="color:#000 !important;"><?php echo $dtprod->keterangan;?></div>
				<div style="color:#000 !important;"><?php if(empty($dtprod->deskripsi)) { echo '-'; } else { echo $dtprod->deskripsi; };?></div>

			</div><!-- / Column -->
		</div><!-- /.row -->
	</div><!-- /.container -->
</section><!-- /.content-section -->
<?php 
if(!empty($produk_widget)) {
?>
<!-- Slider -->
<section class="slider-section slider-section-3">
	<div class="container">
		<h2 class="title">Produk lainnya</h2>
		
		<div class="carousel-widget ctrl-2" id="carousel-widget" data-nav="true" data-pager="true" data-itemrange="0,1|420,1|600,2|768,2|992,2|1200,3" data-margin="20" data-rbase="body" data-stpd="1" data-hauto="false">
			<div class="owl-carousel popgallery-widget">
				<?php 
	            foreach ($produk_widget_list as $prod) {
	            ?>
				<div class="item">
					<div class="product-box product-box1 dark">
						<div class="img">
							<?php if(!empty($prod->diskon)) { ?>
							<span class="save-tag"><?php echo $prod->diskon;?></span>
							<?php } else { echo ''; }?>
							<a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>"><img src="<?php echo base_url().$prod->gambar_produk;?>" alt="Prd image"></a>
							<div class="price">
								<span class="vm-item">
									<!--<i class="old">$50.00</i>
									<b>$40.00</b>-->
									<b>Rp. <?php echo number_format($prod->harga, 0, ',', '.');?></b>	
								</span>
							</div>
						</div>
						<div class="info">
							<h3 class="hd"><a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>"><?php echo $prod->nama_produk?></a></h3>
							<a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>" class="btn btn-line btn-xs">Detail</a>
						</div>
					</div>
				</div><!-- /.item -->
				<?php } ?>
			</div><!-- /.owl-carousel -->
		</div><!-- /.carousel-widget -->
	</div><!-- /.container -->
</section><!-- /.slider-section -->
<?php } ?>
<!-- WIDGET DELIVERY -->
<?php 
if(!empty($delivery_widget)) {
    $this->load->view($temp.'widget/delivery_widget');
}   
?>
<!-- END WIDGET DELIVERY -->