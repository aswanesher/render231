    <div class="big_padding dark pix_builder_bg" id="section_normal_4_2" style="outline-offset: -3px;">
        <div class="container">
            <div class="sixteen columns">
                <div class="eight columns alpha pix_container">
                    <img src="<?php echo base_url().$dtprod->gambar_produk;?>" class="img_style" alt="" style="border-radius: 0px; border: 1px none rgb(255, 255, 255); width: 450px;">
                </div>
                <div class="eight columns omega">
                        <span class="bold_text big_text blue_text editContent">Kode Produk : <?php echo $dtprod->kode_produk;?></span>
                        <p class="big_title bold_text editContent"><?php echo $dtprod->nama_produk;?></p>
                        <span class="bold_text big_text blue_text editContent">Harga : Rp. <?php echo number_format($dtprod->harga, 0, '.', '.');?></span>
                        <span class="bold_text big_text blue_text editContent">
                            , <?php 
                        if($dtprod->qty==''||$dtprod->qty=='0') { echo 'Stok kosong'; } else { echo 'Ready stok'; }?>
                        </span>
                        <p class="normal_text light_gray editContent"><?php echo $dtprod->keterangan;?></p>
                        <!--<a href="#" class="pix_button btn_normal pix_button_flat blue_bg bold_text">
                            <i class="pi pixicon-eye"></i> 
                            <span>Pesan Sekarang</span>
                        </a>--> 
                </div>
            </div>
        </div>
    </div>      
    <div class="section_pointer" pix-name="1_normal"></div><div class="pixfort_content_1 pix_contents pix_builder_bg" id="section_content_2">
    <div class="container ">
            <div class="thirds column ">
                <div class="content_div">
                    <?php if(empty($dtprod->deskripsi)) { echo '-'; } else { echo $dtprod->deskripsi; };?>
                </div>
            </div>
        </div>
    </div>  
    <!-- WIDGET PRODUK -->
    <?php 
    if(!empty($produk_widget)) {
        $this->load->view($temp.'widget/produk_widget');
    }   
    ?>
    <!-- END WIDGET PRODUK -->
    <hr>
    
