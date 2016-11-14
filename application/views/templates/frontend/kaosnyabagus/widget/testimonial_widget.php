<div class="section_pointer" pix-name="1_normal"></div><div class="pixfort_business_10" id="section_business_6">
	<div class="envato_unbounce pix_builder_bg animate-in" src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/main/logo.png" data-anim-type="bounce-in" data-anim-delay="" style="outline-offset: -3px; padding-top: 0px; padding-bottom: 0px; box-shadow: none; border-color: rgb(68, 68, 68); background-image: url(&quot;<?php echo base_url();?>assets/frontend/kaosnyabagus/images/10_business/8.jpg&quot;); background-attachment: fixed; background-color: rgb(85, 81, 109); background-size: cover; background-repeat: no-repeat;">
		<div class="container">
			<div class="sixteen columns ">
				<div class="cadre_st">
					<!--<h3 class="L1_style editContent">Testimonial</h3>
					<h6 class="L3_style editContent">great words from great people</h6>-->
					<?php echo $testimonial_caption;?>
				</div>
				<?php 
				foreach ($testimonial as $trow) {
				?>
				<div class="eight columns  alpha ">
					<div class="box_1 pix_builder_bg">
						<div class="b_style">
							<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/testimonials/envato-logo.png" class="logo_style" alt="">
						</div>
						<div class="txt_style">
							<p class="editContent">
							<?php 
							// strip tags to avoid breaking any html
							$string = strip_tags($trow->testimonial);

							if (strlen($string) > 100) {

							    // truncate string
							    $stringCut = substr($string, 0, 100);

							    // make sure it ends in a word so assassinate doesn't become ass...
							    $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'... <a href="'.base_url().'p/testimonial" style="text-decoration:none;">Selengkapnya..</a>'; 
							}
							echo $string;
							?>
							</p>

							<span class="env_st"><span class="editContent"><span class="pix_text"><?php echo ucfirst($trow->name);?></span></span></span>
						</div>
					</div>
				</div>
				<?php 
				}
				?>
				<center>
                    <a href="<?php echo base_url();?>p/testimonial" class="active_bg_open pix_button btn_normal btn_big bold_text green_bg">
                        <span>Testimonial lainnya..</span>
                    </a> 
                </center>
			</div>
		</div>
        <br>
	</div>
</div>