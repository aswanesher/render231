        <div class="pixfort_real_estate_4" id="section_real_estate_4_2">
        <div class="Homes pix_builder_bg">
            <div class="container">
                <div class="sixteen columns">
                    <h1 class="title_homes editContent"><?php echo $page_title;?></h1>
                    <?php echo $page_content;?>
                    <form action="daftar-agen" method="post">
                        <input type="text" name="query1" value="<?php //echo $qwords?>" id="name" placeholder="Cari agen berdasarkan kota lalu tekan enter" class="pix_text" style="width:99% !important;">
                    </form>
                    <?php 
                    foreach ($produk as $prod) {
                    ?>
                    <div class="eight columns  alpha">
                        <div class="bloc_home">
                            <img src="<?php echo base_url().$prod->gambar_produk;?>" class="Home_photo" alt="">
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
                <center><?php echo $this->pagination->create_links(); ?></center>
            </div>
        </div>
    </div>
    <hr>
