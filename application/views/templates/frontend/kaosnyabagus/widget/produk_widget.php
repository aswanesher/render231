<div class="pixfort_real_estate_4" id="section_real_estate_4_2">
        <div class="Homes pix_builder_bg animate-in" style="outline-offset: -3px; padding-top: 50px; padding-bottom: 0px; box-shadow: none; border-color: rgb(68, 68, 68); background-image: none; background-attachment: scroll; background-color: rgb(255, 255, 255); background-size: cover; background-repeat: repeat;" src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/main/logo.png" data-anim-type="bounce-in" data-anim-delay="">
            <div class="container">
                <div class="sixteen columns">
                    <?php echo $prod_caption;?>
                    <?php 
                    foreach ($produk_widget_list as $prod) {
                    ?>
                    <div class="eight columns  alpha">
                        <div class="bloc_home">
                            <img src="<?php echo $prod->thumb;?>" class="Home_photo" alt="">
                            <div class="Home_info">
                                <h3 class="tit_info editContent"><?php echo $prod->nama_produk?></h3>
                                <h4 class="txt_info editContent">Kode : <?php echo $prod->kode_produk?></h4>
                                <div class="info2 editContent">
                                    <span class="gris">Harga:&nbsp;</span> <span class="green">Rp. <?php echo number_format($prod->harga, 0, ',', '.');?></span>
                                    <span class="contact_btn"> <a class="slow_fade" href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>">Detail..</a> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php 
                    } 
                    ?>
                </div>
                <center>
                    <a href="<?php echo base_url();?><?php echo $prod_list_url;?>" class="active_bg_open pix_button btn_normal btn_big bold_text green_bg">
                        <span>Produk lainnya..</span>
                    </a> 
                </center>
                <br><br>
            </div>
        </div>
    </div>