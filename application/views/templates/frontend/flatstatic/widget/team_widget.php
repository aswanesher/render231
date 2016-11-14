	<div class="clearfix m_bottom_25 m_sm_bottom_20">
							<h2 class="tt_uppercase color_dark f_left heading2 animate_fade f_mxs_none m_mxs_bottom_15">Tim Kami</h2>
							<div class="f_right clearfix nav_buttons_wrap animate_fade f_mxs_none">
								<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left tr_delay_hover r_corners orw_prev"><i class="fa fa-angle-left"></i></button>
								<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left m_left_5 tr_delay_hover r_corners orw_next"><i class="fa fa-angle-right"></i></button>
							</div>
						</div>
					<div class="row clearfix our_recent_work_carousel">
						<?php 
						foreach ($users as $ruser) {
						?>
						<div class="col-lg-12 col-md-12 col-sm-12 m_bottom_45 m_xs_bottom_30">
							<figure class="t_align_c">
								<div class="circle wrapper team_photo d_inline_b m_bottom_15">
									<img src="<?php if($ruser->user_pic=='') { echo base_url().'uploads/no_images.jpg'; } else { echo $ruser->user_pic; }?>
									" alt="">
								</div>
								<figcaption>
									<h4 class="fw_medium color_dark"><?php echo $ruser->name;?></h4>
									<p class="color_dark m_bottom_10"><?php echo $ruser->position;?></p>
									<p class="m_bottom_10">No. Whatsapp : <?php echo $ruser->whatsapp;?><br>
									BBM Pin : <?php echo $ruser->bbm_pin;?><br>
									Email : <?php echo $ruser->user_email;?></p>
									<hr class="divider_type_5 d_inline_b m_bottom_5"><br>
									<ul class="clearfix horizontal_list social_icons d_inline_b t_md_align_c">
										<li class="facebook f_md_none d_md_inline_middle m_bottom_5 relative">
											<a href="<?php echo $ruser->fb_url;?>" class="r_corners t_align_c tr_delay_hover f_size_ex_large" target="_blank">
												<i class="fa fa-facebook"></i>
											</a>
										</li>
										<li class="twitter f_md_none d_md_inline_middle m_left_5 m_bottom_5 relative">
											<a href="<?php echo $ruser->twitter_url;?>" class="r_corners f_size_ex_large t_align_c tr_delay_hover" target="_blank">
												<i class="fa fa-twitter"></i>
											</a>
										</li>
									</ul>
								</figcaption>	
							</figure>
						</div>
						<?php } ?>
					</div>