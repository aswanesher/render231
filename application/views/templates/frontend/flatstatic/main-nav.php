<!--main menu-->
<nav role="navigation" class="f_left f_xs_none d_xs_none m_right_35 m_md_right_30 m_sm_right_0">	
	<ul class="horizontal_list main_menu type_2 clearfix">
		<?php
        foreach ($menu as $r) {
        ?>
		<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="<?php echo base_url().$r->url;?>" class="tr_delay_hover color_dark tt_uppercase r_corners"><b><?php echo $r->title;?></b></a>
			<!--sub menu-->
			<?php 
            $subm=$this->menu_model->get_submenu_frontend($r->id);
            if(!empty($subm)) {       
            ?>
			<div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
				<ul class="sub_menu">
					<?php 
					foreach ($subm as $submenu) {
					?>
					<li><a class="color_dark tr_delay_hover" href="<?php echo base_url().$submenu->url;?>"><?php echo $submenu->title;?></a></li>
					<?php } ?>
				</ul>
			</div>
			<?php } ?>
		</li>
		<?php } ?>
		
		<!--<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="category_grid.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Shop</b></a>
			<!--sub menu-->
			<!--<div class="sub_menu_wrap top_arrow d_xs_none tr_all_hover clearfix r_corners w_xs_auto">
				<div class="f_left f_xs_none">
					<b class="color_dark m_left_20 m_bottom_5 m_top_5 d_inline_b">Dresses</b>
					<ul class="sub_menu first">
						<li><a class="color_dark tr_delay_hover" href="#">Evening Dresses</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Casual Dresses</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Party Dresses</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Maxi Dresses</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Midi Dresses</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Strapless Dresses</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Day Dresses</a></li>
					</ul>
				</div>
				<div class="f_left m_left_10 m_xs_left_0 f_xs_none">
					<b class="color_dark m_left_20 m_bottom_5 m_top_5 d_inline_b">Accessories</b>
					<ul class="sub_menu">
						<li><a class="color_dark tr_delay_hover" href="#">Bags and Purces</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Belts</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Scarves</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Gloves</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Jewellery</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Sunglasses</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Hair Accessories</a></li>
					</ul>
				</div>
				<div class="f_left m_left_10 m_xs_left_0 f_xs_none">
					<b class="color_dark m_left_20 m_bottom_5 m_top_5 d_inline_b">Tops</b>
					<ul class="sub_menu">
						<li><a class="color_dark tr_delay_hover" href="#">Evening Tops</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Long Sleeved</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Short Sleeved</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Sleeveless</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Tanks</a></li>
						<li><a class="color_dark tr_delay_hover" href="#">Tunics</a></li>
					</ul>
				</div>
				<img src="<?php echo base_url();?>assets/frontend/flatstatic/images/woman_image_1.jpg" class="d_sm_none f_right m_bottom_10" alt="">
			</div>
		</li>-->
	</ul>
</nav>