<!--slider-->
			<section class="revolution_slider">
				<div class="r_slider">
					<ul>
						<!--<li class="f_left" data-transition="curtain-1" data-slotamount="7" data-custom-thumb="<?php echo base_url();?>assets/frontend/flatstatic/images/slide_07.jpg">
							<img src="<?php echo base_url();?>assets/frontend/flatstatic/images/slide_07.jpg" alt="" data-bgrepeat="no-repeat" data-bgfit="cover" data-bgposition="center center">
							<div class="caption sfl str f_size_large scheme_color tt_uppercase slider_title_3" data-x="160" data-y="127" data-speed="500" data-start="2500">Meet New Theme</div>
							<div class="caption sfr stl divider_type_2" data-x="209" data-y="157" data-speed="500" data-start="2500"></div>
							<div class="caption lft stb color_dark slider_title tt_uppercase t_align_c" data-x="30" data-y="168" data-speed="1500" data-easing="easeOutBounce"><b>The New Direction<br>for Your Success</b></div>
							<div class="caption sft stb color_light" data-x="147" data-y="307" data-speed="900" data-start="2600">
								<a href="#" role="button" class="button_type_4 bg_scheme_color color_light r_corners tt_uppercase">Learn More</a>
							</div>
						</li>-->
						<?php
			            foreach ($slider as $srow) {
			            ?>
						<li class="f_left" data-transition="cube" data-slotamount="7" data-custom-thumb="<?php echo $srow->gambar;?>">
							<img src="<?php echo $srow->gambar;?>" alt="" data-bgrepeat="no-repeat" data-bgfit="cover" data-bgposition="center center">
							
							<div class="caption lft ltb color_light slider_title tt_uppercase t_align_r" data-x="right" data-y="85" data-speed="500" data-easing="ease" data-start="1400"><b><?php echo $srow->nama;?></b></div>
							<div class="caption lfb ltt color_light t_align_r" data-x="right" data-y="185" data-speed="500" data-start="1700">
								<p class="d_inline_middle f_size_large d_sm_none"><?php echo $srow->keterangan;?></p>
							</div>
						</li>
						<?php } ?>
						<!--<li class="f_left" data-transition="cube" data-slotamount="7" data-custom-thumb="<?php echo base_url();?>assets/frontend/flatstatic/images/slide_09.jpg">
							<img src="<?php echo base_url();?>assets/frontend/flatstatic/images/slide_09.jpg" alt="" data-bgrepeat="no-repeat" data-bgfit="cover" data-bgposition="center center">
							<div class="caption lft ltt" data-autoplay="false" data-autoplayonlyfirsttime="false" data-nextslideatend="false" data-x="515" data-y="34" data-speed="1200" data-easing="easeOutBounce">
								<iframe width="640" height="390" src="http://www.youtube.com/embed/SZEflIVnhH8?wmode=transparent" frameborder="0" allowfullscreen></iframe>
							</div>
							<div class="caption sfl str color_dark slider_title tt_uppercase" data-x="left" data-y="102" data-speed="700" data-easing="ease" data-start="1650"><b>Think Outside<br>The Box!</b></div>
							<div class="caption sfl str color_dark f_size_large l_height_medium" data-x="left" data-y="211" data-speed="700" data-start="1850">
								Vestibulum libero nisl, porta vel, scelerisque eget,<br> malesuada at, neque. Etiam cursus leo vel metus.<br> Nulla facilisi. Aenean nec eros. 
							</div>
							<div class="caption sfl str color_light clearfix" data-x="left" data-y="316" data-speed="700" data-start="2050">
								<a href="#" role="button" class="button_type_12 f_size_ex_large bg_scheme_color color_light r_corners tt_uppercase f_left">Get Started</a>
								<a href="#" role="button" class="button_type_12 f_size_ex_large bg_light_color_2 color_dark r_corners tt_uppercase f_left m_left_5">Take A Tour</a>
							</div>
						</li>-->
					</ul>
				</div>
			</section>