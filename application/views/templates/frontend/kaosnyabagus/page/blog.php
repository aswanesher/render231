    <div class="light_gray_bg normal_padding padding_top_60 pix_builder_bg " id="section_text_2">
            <div class="container center_text">       
                <div class="sixteen columns">
                    <div class="intro_div">
                        <h2 class="editContent"><strong><?php echo $page_title;?></strong></h2>
                    </div>
                </div>
            </div>
        </div>

    <div class="pixfort_real_estate_4" id="section_real_estate_4_2">
        <div class="Homes pix_builder_bg">
            <div class="container">
                <div class="sixteen columns">
                	<?php 
                	foreach($blogs as $bg) {
                	?>
                    <div class="eight columns  alpha">
                        <div class="bloc_home">
        				    <img src="<?php echo $bg->post_image;?>" class="Home_photo" alt="">
        				    <div class="Home_info">
        				    	<br>
                                <h5 class=" editContent"><?php echo $bg->post_title?></h5>
                                <h4 class="txt_info editContent">
	                            <?php 
								// strip tags to avoid breaking any html
								$string = strip_tags($bg->post_content);

								if (strlen($string) > 100) {

								    // truncate string
								    $stringCut = substr($string, 0, 100);

								    // make sure it ends in a word so assassinate doesn't become ass...
								    $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'... <a href="'.base_url().'judulberita/'.$bg->permalink.'" style="text-decoration:none;">Selengkapnya..</a>'; 
								}
								echo $string;
								?></h4>
        				    </div>
                        </div>
                    </div>
                    <?php } ?>
                </div>
                <center><?php echo $this->pagination->create_links(); ?></center>
            </div>
        </div>
    </div>
    <div class="section_pointer" pix-name="4_real_estate"></div>

	<hr>