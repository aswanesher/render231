<div class="center_text big_padding light_gray_bg pix_builder_bg animate-in" data-anim-type="bounce-in" id="section_intro_title" src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/main/logo.png" data-anim-type="fade-in" data-anim-delay="" style="outline-offset: -3px; padding-top: 60px; padding-bottom: 60px; box-shadow: none; border-color: rgb(68, 68, 68); background-image: none; background-attachment: scroll; background-color: rgb(243, 243, 243); background-size: auto; background-repeat: repeat;">
            <div class="container ">     
                    <div class="container center_text">       
                        <div class="sixteen columns">
                            <div class="intro_div">
                                <?php echo $pricing_caption?>
                            </div>
                        </div>
                    </div>  
                    <?php 
                    foreach ($pricing as $prow) {
                    ?>
                    <div class="eight columns">
                        <div class="flat_pricing pix_builder_bg">
                            <p class="big_title blue_text editContent">
                                <strong><?php echo $prow->post_title;?></strong>
                            </p>
                            <p class="light_gray editContent">
                                <strong>Syarat & ketentuan</strong>
                            </p>
                            <?php 
                            echo $prow->post_content;
                            ?>
                            <a href="<?php echo base_url()?>reg/<?php echo $prow->permalink?>" class="active_bg_open pix_button btn_normal btn_big bold_text blue_bg ">
                                <span>Mendaftar</span>
                            </a> 
                        </div>
                    </div>
                    <?php 
                    }
                    ?>
            </div>
        </div>