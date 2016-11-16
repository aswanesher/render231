 <div class="row">
        	<div class="col-lg-12 col-sm-12">
                    <span class="title"><?php echo $page_title;?></span>
                    <div id="informasi" style="display:none;"></div>
            	</div>                
                 <?php
				 	/*$batas  = 8;
					$posisi = $function->cariPosisi_semua_produk($batas);
					$sql_produk = mysqli_query($link,"SELECT * FROM tbl_produk ORDER BY id_produk ASC LIMIT $posisi,$batas");
					while($dta_produk = mysqli_fetch_object($sql_produk)){
						$desk1 = strip_tags($dta_produk->deskripsi);
						$deskripsi1 = substr($desk1,0,70);
						$deskripsi1 = substr($desk1, 0, strrpos($deskripsi1, " "));*/
                    foreach ($produk as $prod) {    
					?>
                    <div class="col-lg-3 col-sm-3 hero-feature text-center">
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
                                    $desk1 = strip_tags($prod->deskripsi);
                                $deskripsi1 = substr($desk1,0,100);
                                $deskripsi1 = substr($desk1, 0, strrpos($deskripsi1, " "));
                                echo $deskripsi1;
                                ?></p>
                                <p>
                                    <div class="btn-group">
                                            <a href="<?php echo base_url();?>orderproduct/<?php echo $prod->seo_url?>" class="btn btn-success">Pesan Produk</a>
                                    </div>
                                </p>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                     
          
        	<!-- End Catalogue -->


        </div>
        			<div class="text-center">
                        <?php echo $this->pagination->create_links(); ?>
                    </div>