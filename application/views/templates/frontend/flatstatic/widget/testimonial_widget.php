<div class="col-lg-6 col-md-6 col-sm-6 m_bottom_45 animate_fade long">
	<div class="clearfix m_bottom_25 m_sm_bottom_20">
		<h2 class="tt_uppercase color_dark f_left f_sm_none m_sm_bottom_15">TESTIMONIAL</h2>
		<div class="f_right clearfix nav_buttons_wrap f_sm_none">
			<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large bg_light_color_1 f_left tr_delay_hover r_corners ti_prev"><i class="fa fa-angle-left"></i></button>
			<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large bg_light_color_1 f_left m_left_5 tr_delay_hover r_corners ti_next"><i class="fa fa-angle-right"></i></button>
		</div>
	</div>
	<!--testimonials carousel-->
	<div class="testiomials_carousel">
		<?php 
		foreach ($testimonial as $trow) {
		?>
		<div>
			<blockquote class="r_corners shadow f_size_large relative m_bottom_15">
				<?php 
				// strip tags to avoid breaking any html
				$string = strip_tags($trow->testimonial);

				if (strlen($string) > 100) {

				    // truncate string
				    $stringCut = substr($string, 0, 300);

				    // make sure it ends in a word so assassinate doesn't become ass...
				    $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'... <a href="'.base_url().'p/testimonial" style="text-decoration:none;">Selengkapnya..</a>'; 
				}
				echo $string;
				?>.</blockquote>
			
			<div class="d_inline_middle m_left_15">
				<h5 class="color_dark"><b><?php echo ucfirst($trow->name);?></b></h5>
			</div>
		</div>
		<?php 
		}
		?>
	</div>
</div>