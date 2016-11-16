<div class="row">
			<!-- Product Detail -->
        	<div class="col-lg-12 col-md-12 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">DETAIL PRODUK : <?php echo $dtprod->nama_produk;?></span>
                    <div id="informasi" style="display:none;"></div>
            	</div>
	            <div class="col-lg-12 col-sm-12 hero-feature">

	            	<div class="row">
						<div class="col-lg-4 col-md-4 col-sm-4">
			            	<!-- Main Image -->
							<div class="product-main-image-container">
								<img src="<?php echo base_url();?>assets/frontend/rendertech/lib/images/loader.gif" alt="" class="product-loader">
								<span class="thumbnail product-main-image">
									<?php if ($dtprod->gambar_produk <> ""){ ?>
                                        <img src="<?php echo $dtprod->gambar_produk;?>" alt="">
                                    <?php } else { ?>
                                        <img src="<?php echo base_url();?>assets/frontend/rendertech/lib/images/produk/no_image.jpg" alt="">
                                    <?php } ?>
								</span>
							</div>
							<!-- End Main Image -->
						</div>

						<div class="visible-xs">
							<div class="clearfix"></div>
						</div>

						<div class="col-lg-8 col-md-8 col-sm-8">
							<div class="well product-short-detail">
								<div class="row">
									
                                    <div class="the-list">
										<div class="col-xs-4">Nama Produk</div>
										<div class="col-xs-8">
											<!-- <span class="red">OUT OF STOCK</span> -->
											<span ><?php echo $dtprod->nama_produk;?> </span>
										</div>
									</div>
                                    <div class="the-list">
										<div class="col-xs-4">Waktu Pengerjaan</div>
										<div class="col-xs-8">
										<span><?php echo $dtprod->lama_pengerjaan;?></span>
										</div>
									</div>
									<div class="the-list">
										<div class="col-xs-4"></div>
										<div class="col-xs-12">
											<!-- <span class="red">OUT OF STOCK</span> -->
											<?php echo $dtprod->deskripsi;?>
										</div>
									</div>
									<div class="clearfix"></div>
									<hr/>
									<div class="col-xs-12 input-qty-detail">
										<a class="btn btn-default pull-left" href="<?php echo base_url();?>orderproduct/<?php echo $dtprod->seo_url?>">Pesan Produk</a>
									</div>
									<div class="clearfix"></div><br/>
									
								</div>
							</div>
						</div>

						
					</div>

					<!-- <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
						<a class="addthis_button_preferred_1"></a>
						<a class="addthis_button_preferred_2"></a>
						<a class="addthis_button_preferred_3"></a>
						<a class="addthis_button_preferred_4"></a>
						<a class="addthis_button_compact"></a>
					</div>
					<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=xa-4f0c254f1302adf8"></script>
	             -->
	            </div>
	           
        	</div>
            
        	<!-- End Catalogue -->
            
        	</div>
        	<!-- End Product Detail -->


        </div>