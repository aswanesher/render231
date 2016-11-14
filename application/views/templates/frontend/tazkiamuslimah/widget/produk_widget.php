<!-- product-section -->
<section class="product-section align-c product-section-2">
	<div class="container">
		<h2 class="title"><?php echo $prod_caption;?></h2>
		<div class="row eqh mb30 fs-equalize-element">
			<?php 
            foreach ($produk_widget_list as $prod) {
            ?>
			<!-- column -->
			<div class="col-md-4" style="height: 670px;">
				<!-- product-box -->
				<div class="product-box product-box1 align-l">
					<div class="img">
						<?php if(!empty($prod->diskon)) { ?>
						<span class="save-tag"><?php echo $prod->diskon;?></span>
						<?php } else { echo ''; }?>
						<a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>"><img src="<?php echo $prod->gambar_produk;?>" alt="Prd image"></a>
						<div class="price flex-cc">
							<div align="center"><b>Rp. <?php echo number_format($prod->harga, 0, ',', '.');?></b></div>
						</div>
					</div>
					<div class="info">
						<h3 class="hd"><a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>"><?php echo $prod->nama_produk?></a></h3>
						<p class="txt"><?php echo $prod->deskripsi?></p>
						<hr class="mr-tb-10 op">
						
						<div class="editContent">
							<strong>Kode Produk</strong> : <?php echo $prod->kode_produk?><br>
						</div>
						
						<hr class="mr-tb-10 op">
						<a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>" class="btn btn-line dark btn-sm">Detail..</a>
					</div>
				</div><!-- /.product-box -->
			</div><!-- /.column -->
			<?php 
            } 
            ?>
		</div><!-- /.row -->
	</div><!-- /.container -->
</section><!-- /.product-section -->