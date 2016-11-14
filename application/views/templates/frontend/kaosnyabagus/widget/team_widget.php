<div class="section_pointer" pix-name="1_normal"></div><div class="pixfort_ebook_9" id="section_ebook_4">
		<div class="writers_section pix_builder_bg">
			<div class="container">
				<!--<div class="sixteen columns">
					<div id="owl-demo" class="owl-carousel">
          
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl1.jpg" alt="Owl Image">
					  </div>
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl2.jpg" alt="Owl Image">
					  </div>
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl3.jpg" alt="Owl Image">
					  </div>
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl4.jpg" alt="Owl Image">
					  </div>
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl5.jpg" alt="Owl Image">
					  </div>
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl6.jpg" alt="Owl Image">
					  </div>
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl7.jpg" alt="Owl Image">
					  </div>
					  <div class="item">
					  	<img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/owl/owl8.jpg" alt="Owl Image">
					  </div>
					 
					</div>
				</div>-->
				<div class="sixteen columns">
					<h2 class="title_st editContent">Tim Kami</h2>
					<h4 class="subtitle_st editContent"><?php echo $company;?></h4>
					<div id="owl-demo" class="owl-carousel">
					<?php 
					foreach ($users as $ruser) {
					?>	
					<div class="item">
					<div class="eight columns alpha">
						<div class="b_style">
							<center>
							<img src="<?php echo base_url();?><?php if($ruser->user_pic=='') { echo 'uploads/images/no_images.jpg'; } else { echo $ruser->user_pic; }?>" class="logo_style" style="width:200px !important;">
							</center>
						</div>
						<div class="author_text">
							<h1 class="name_st editContent"><?php echo $ruser->name;?></h1>
							<h6 class="job_st editContent">Tim <?php echo $company?></h6>
							<p class="details_st editContent">
								No. Whatsapp : <?php echo $ruser->whatsapp;?><br>
								BBM Pin : <?php echo $ruser->bbm_pin;?><br>
								Email : <?php echo $ruser->user_email;?>
							</p>
							<div class="icons_st">
								<span><a href="<?php echo $ruser->twitter_url;?>" class="slow_fade social_button"><img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/social_icons/twitter.png"></a></span>
								<span> <a href="<?php echo $ruser->fb_url;?>" class="slow_fade social_button"><img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/social_icons/facebook.png"></a></span>
							</div>
						</div>
					</div>
					</div>
					<?php 
					}
					?>
					</div>
				</div>
			</div>
		</div>
	</div>