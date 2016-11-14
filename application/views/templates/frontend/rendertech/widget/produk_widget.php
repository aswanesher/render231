<div class="row">
        	
			<!-- Featured -->
        	<div class="col-lg-12 col-md-12 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">DATA PRODUK</span>
            	</div>
	            <?php 
                foreach ($produk_widget_list as $prod) {
                ?>
                    <div class="col-lg-<?php echo $size;?> col-sm-<?php echo $size;?> hero-feature text-center">
                        <div class="thumbnail">
                            <a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>" class="link-p">
                                <?php if ($prod->gambar_produk <> ""){ ?>
                                        <img src="<?php echo $prod->gambar_produk;?>" alt="">
                                    <?php } else { ?>
                                        <img src="<?php echo base_url();?>assets/frontend/rendertech/lib/images/produk/no_image.jpg" alt="">
                                    <?php } ?>
                            </a>
                            <div class="caption prod-caption">
                                <h4><a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>"><?php echo $prod->nama_produk?></a></h4>
                                <h5>Waktu Pengerjaan <br><?php echo $prod->lama_pengerjaan?></h5>
                                <p><?php 
                                //echo $prod->deskripsi;
                                $desk1 = strip_tags($prod->deskripsi);
                                $deskripsi1 = substr($desk1,0,100);
                                $deskripsi1 = substr($desk1, 0, strrpos($deskripsi1, " "));
                                echo $deskripsi1;
                                ?></p>
                                <p>
                                    <div class="btn-group">
                                            <a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>" class="btn btn-success"><i class="fa fa-shopping-cart"></i> Pesan</a>
                                    </div>
                                </p>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
        	</div>
        	<!-- End Featured -->

        	<div class="clearfix visible-sm"></div>

			

        </div>