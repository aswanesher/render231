<section class="bg_light_color_3 recent_work_wrap">
	<div class="container p_tables">
		<h2 class="tt_uppercase color_dark heading2 animate_fade f_mxs_none m_bottom_25"><?php echo $pricing_caption?></h2>
		<div class="clearfix m_bottom_35">
			<?php 
			$no=0;
            foreach ($pricing as $prow) {
            if ($no % 4 == 0) { 
            	$warna = "bg_color_green_1";
            	$warna2 = "bg_color_green_2";
            } else if($no % 4 == 1) { 
            	$warna = "bg_color_blue_1";
				$warna2 = "bg_color_blue_2";
			} else if($no % 4 == 2) { 
            	$warna = "bg_color_red_1";
				$warna2 = "bg_scheme_color";
			} else {
            	$warna = "bg_color_orange_1";
				$warna2 = "bg_color_orange_2";
			}
            ?>
			<div class="p_table r_corners t_align_c f_left long animate_fade relative">
				<header class="f_size_large fw_medium color_light <?php echo $warna;?>">Paket</header>
				<div class="price <?php echo $warna2?>">
					<dl>
						<dt class="color_light"><?php echo $prow->post_title;?></dt>
						<!--<dd class="color_light">per month</dd>-->
					</dl>
				</div>
				<?php 
                    echo $prow->post_content;
                ?>
				<!--<ul class="p_list">
					<?php 
                    echo $prow->post_content;
                    ?>
					<!--<li><i class="fa fa-check scheme_color"></i>Up to 50 users</li>
					<li><i class="fa fa-times scheme_color"></i>Limited team members</li>
					<li><i class="fa fa-times scheme_color"></i>Limited disk space</li>
					<li><i class="fa fa-check scheme_color"></i>Custom Domain</li>
					<li><i class="fa fa-times scheme_color"></i>PayPal Integration</li>
					<li><i class="fa fa-check scheme_color"></i>Basecamp Integration</li>-->
				<!--</ul>-->
				<footer>
					<a href="<?php echo base_url()?>reg/<?php echo $prow->permalink?>" class="d_block tt_uppercase color_light <?php echo $warna2?>">Daftar</a>
				</footer>
			</div>
			<?php 
			$no++;
            }
            ?>
			<!--<div class="p_table r_corners  t_align_c animate_fade long relative f_left">
				<header class="f_size_large fw_medium color_light bg_color_orange_1">Basic</header>
				<div class="price bg_color_orange_2">
					<dl>
						<dt class="color_light">$15</dt>
						<dd class="color_light">per month</dd>
					</dl>
				</div>
				<ul class="p_list">
					<li><i class="fa fa-check scheme_color"></i>Up to 100 users</li>
					<li><i class="fa fa-times scheme_color"></i>Limited team members</li>
					<li><i class="fa fa-times scheme_color"></i>Limited disk space</li>
					<li><i class="fa fa-check scheme_color"></i>Custom Domain</li>
					<li><i class="fa fa-check scheme_color"></i>PayPal Integration</li>
					<li><i class="fa fa-check scheme_color"></i>Basecamp Integration</li>
				</ul>
				<footer>
					<a href="#" class="d_block tt_uppercase color_light bg_color_orange_2">Sign Up</a>
				</footer>
			</div>
			<div class="p_table r_corners active t_align_c animate_fade long f_left relative">
				<span class="hot_p"><img src="<?php echo base_url();?>assets/frontend/flatstatic/images/hot.png" alt=""></span>
				<header class="f_size_large fw_medium color_light bg_color_red_1">Pro</header>
				<div class="price bg_scheme_color">
					<dl>
						<dt class="color_light">$30</dt>
						<dd class="color_light">per month</dd>
					</dl>
				</div>
				<ul class="p_list">
					<li><i class="fa fa-check scheme_color"></i>Up to 150 users</li>
					<li><i class="fa fa-times scheme_color"></i>Limited team members</li>
					<li><i class="fa fa-check scheme_color"></i>Limited disk space</li>
					<li><i class="fa fa-check scheme_color"></i>Custom Domain</li>
					<li><i class="fa fa-check scheme_color"></i>PayPal Integration</li>
					<li><i class="fa fa-check scheme_color"></i>Basecamp Integration</li>
				</ul>
				<footer>
					<a href="#" class="d_block tt_uppercase color_light bg_scheme_color">Sign Up</a>
				</footer>
			</div>
			<div class="p_table r_corners animate_fade long t_align_c relative f_left">
				<header class="f_size_large fw_medium color_light bg_color_blue_1">Premium</header>
				<div class="price bg_color_blue_2">
					<dl>
						<dt class="color_light">$70</dt>
						<dd class="color_light">per month</dd>
					</dl>
				</div>
				<ul class="p_list">
					<li><i class="fa fa-check scheme_color"></i>Up to 300 users</li>
					<li><i class="fa fa-check scheme_color"></i>Limited team members</li>
					<li><i class="fa fa-check scheme_color"></i>Limited disk space</li>
					<li><i class="fa fa-check scheme_color"></i>Custom Domain</li>
					<li><i class="fa fa-check scheme_color"></i>PayPal Integration</li>
					<li><i class="fa fa-check scheme_color"></i>Basecamp Integration</li>
				</ul>
				<footer>
					<a href="#" class="d_block tt_uppercase color_light bg_color_blue_2">Sign Up</a>
				</footer>
			</div>-->
		</div>
	</div>
</section>