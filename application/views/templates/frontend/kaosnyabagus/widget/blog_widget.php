    <div class="dark" id="section_features_4_dark">
        <div class="big_padding pix_builder_bg animate-in" data-anim-type="bounce-in" data-anim-delay="">
            <div class="container">
                <div class="sixteen columns">
                    <?php foreach ($blogw as $rblog) { ?>
                    <div class="one-third column onethird_style alpha">
                        <div class="f1_box pix_container">
                            <div class="margin_bottom">
                                <a href="<?php echo base_url();?>judulberita/<?php echo $rblog->permalink?>" style="color:#fff;text-decoration:none;"><img width="280" height="280" src="<?php echo $rblog->post_image;?>" class="feature_image" alt=""></a>
                            </div>
                            <div class="margin_bottom">
                                <span class="small_title bold_text">
                                    <span class="editContent">
                                        <span class="pix_text">
                                            <a href="<?php echo base_url();?>judulberita/<?php echo $rblog->permalink?>" style="color:#fff;text-decoration:none;"><?php echo $rblog->post_title;?></a>
                                        </span>
                                    </span>
                                </span>
                                <br>
                                <span class="editContent light_gray normal_text">
                                    <span class="pix_text">
                                        <?php 
                                        // strip tags to avoid breaking any html
                                        $string = strip_tags($rblog->post_content);

                                        if (strlen($string) > 100) {

                                            // truncate string
                                            $stringCut = substr($string, 0, 100);

                                            // make sure it ends in a word so assassinate doesn't become ass...
                                            $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'... <br><br><a href="'.base_url().'judulberita/'.$rblog->permalink.'" class="pix_button bold_text small_button btn_normal pix_button_flat dark_yellow_bg"><i class="pi pixicon-eye"></i> <span>Selengkapnya..</span></a>'; 
                                        }
                                        echo $string;
                                        ?>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>
                    <?php } ?>
                    
                </div>
                <center>
                    <a href="<?php echo base_url();?>p/berita" class="pix_button bold_text small_button btn_normal pix_button_flat dark_green_bg">
                        <span>Artikel lainnya..</span>
                    </a> 
                    </center>
            </div>
        </div>
    </div>

