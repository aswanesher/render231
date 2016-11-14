<div class="section_pointer" pix-name="10_business"></div><div class="" id="section_clients_2">  
        <div class="big_padding pix_builder_bg animate-in" data-anim-type="bounce-in" data-anim-delay="" style="outline-offset: -3px; padding-top: 60px; padding-bottom: 60px; box-shadow: none; border-color: rgb(68, 68, 68); background-image: none; background-attachment: scroll; background-color: rgba(0, 0, 0, 0); background-size: auto; background-repeat: repeat;">
            <div class="container">
                <div class="pix_inline_block ">
                    <div class="sixteen columns ">
                        <div class="sixteen columns alpha center_text">
                            <?php echo $bank_caption;?>
                        </div>
                        <?php 
                        foreach ($bank as $img) { ?>
                        <div class="five columns center_text">
                            <img src="<?php echo $img->gambar;?>" width="200px" class="margin_vertical" alt=""><br>
                            <?php echo $img->keterangan;?>
                        </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>