<!-- Header -->
<header class="pghead-section pghead-section3">
	<div class="bg-section full-wh bg-cc bg-cover" data-bg="<?php echo base_url();?>assets/frontend/tazkiamuslimah/images/bg1.jpg" style="background-image: url(&quot;<?php echo base_url();?>assets/frontend/tazkiamuslimah/images/bg1.jpg&quot;);"></div>
	<div class="container typo-light">
		<div class="flex-row middle-md">
			<div class="flex-col-md-6">
				<h1 class="title medium mr-b-10"><?php echo $page_title;?></h1>
			</div>
			<div class="flex-col-md-6">
				<div class="pg-path">
					<a href="<?php echo base_url();?>">Home</a>
					<b> / </b>
					<a href="#"><?php echo $page_title;?></a>
				</div>	
			</div>
		</div>
	</div>
</header><!-- / Header --><!-- Form section -->
<!-- product-section -->
<section class="product-section align-c product-section-2">
	<div class="container">
		<div class="row eqh mb30 fs-equalize-element">
			<div class="col-md-4">
				<div class="col-md-12">
				<!-- product-box -->
				<div class="product-box product-box1 align-l">
					<div class="info">
						<h3 class="hd">Filter Produk</h3>
						<hr class="mr-tb-10 op">
						<div class="editContent">
							<form action="<?php echo base_url()?>p/<?php echo $page_link;?>" method="post">
							<input class="form-control small" data-label="Name" type="text" name="name" placeholder="Nama produk" aria-required="true" value="<?php echo $nama;?>">
							<select class="form-control small" name="kategori" placeholder="Dari harga">
								<option value="">Kategori</option>
								<?php 
								foreach ($kategorinya as $prokat) { 
								?>
								<option value="<?php echo $prokat->id_prod_category;?>" <?php if($kategori==$prokat->id_prod_category) { echo "selected"; }?>><?php echo $prokat->category;?></option>
								<?php } ?>
							</select>
							<select class="form-control small" name="price" placeholder="Dari harga">
								<option value="">Dari harga</option>
								<option value="asc" <?php if($price=="asc") { echo "selected"; }?>>Termurah</option>
								<option value="desc" <?php if($price=="desc") { echo "selected"; }?>>Termahal</option>
							</select>
							<select class="form-control small" name="sort" placeholder="Dari produk">
								<option value="">Dari produk</option>
								<option value="asc" <?php if($sort=="asc") { echo "selected"; }?>>Terlama</option>
								<option value="desc" <?php if($sort=="desc") { echo "selected"; }?>>Terbaru</option>
							</select>
							<button type="submit" data-loading-text="Pleae wait.." class="btn btn-primary btn-sm btn-block"><i class="fa fa-search"></i> Cari</button>
							</form>
						</div>
					</div>
				</div><!-- /.product-box -->
				<br>
				<!-- product-box -->
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
						<hr class="mr-tb-10 op">
					</div>
				</div><!-- /.product-box -->
			</div><!-- /.column -->
			</div>
			<div class="col-md-8">
			<?php 
            foreach ($produk as $prod) {
            ?>
			<!-- column -->
			<div class="col-md-4">
				<!-- product-box -->
				<div class="product-box product-box1 align-l">
					<div class="img">
						<?php if(!empty($prod->diskon)) { ?>
						<span class="save-tag"><?php echo $prod->diskon;?></span>
						<?php } else { echo ''; }?>
						<a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>"><img src="<?php echo base_url().$prod->gambar_produk;?>" alt="Prd image"></a>
						<div class="price flex-cc">
							<div align="center" style="padding:20px;"><b>Rp. <?php echo number_format($prod->harga, 0, ',', '.');?></b></div>
						</div>
					</div>
					<div class="info">
						<h3 class="hd"><a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>"><?php echo $prod->nama_produk?></a></h3>
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
            <center><?php echo $this->pagination->create_links(); ?></center>
			</div>
		</div><!-- /.row -->
	</div><!-- /.container -->
</section><!-- /.product-section -->