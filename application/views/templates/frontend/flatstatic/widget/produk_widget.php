<div class="container">
	<!--filter navigation-->
	<div class="clearfix">
		<!--<ul class="horizontal_list clearfix tt_uppercase isotope_menu f_size_ex_large f_left f_xs_none m_xs_bottom_15" data-carousel-filter=".wfilter_carousel">
			<li class="active m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr"><button class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none" data-filter="*">All</button></li>
			<li class="m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr"><button class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none" data-filter="filter_class_featured">Featured</button></li>
			<li class="m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr"><button class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none" data-filter="filter_class_new">New</button></li>
			<li class="m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr"><button class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none" data-filter="filter_class_specials">Specials</button></li>
			<li class="m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr"><button class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none" data-filter="filter_class_hit">Hit</button></li>
			<li class="m_right_5 m_bottom_10 m_xs_bottom_5 animate_ftr"><button class="button_type_2 bg_light_color_1 r_corners tr_delay_hover tt_uppercase box_s_none" data-filter="filter_class_rated">Rated</button></li>
		</ul>-->
		<div class="f_right clearfix nav_buttons_wrap f_mxs_none m_mxs_bottom_5 f_xs_none">
			<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left tr_delay_hover r_corners wfilter_prev"><i class="fa fa-angle-left"></i></button>
			<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left m_left_5 tr_delay_hover r_corners wfilter_next"><i class="fa fa-angle-right"></i></button>
		</div>
	</div>
	<!--carousel with filter-->
	<!-- PRODUCT -->
	<div class="wfilter_carousel m_bottom_30 m_xs_bottom_15">
		<?php 
        foreach ($produk_widget_list as $prod) {
        ?>
		<figure class="r_corners photoframe shadow relative tr_all_hover filter_class_featured animate_ftb long">
			<!--product preview-->
			<a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>" class="d_block relative pp_wrap">
				<!--hot product-->
				<img src="<?php echo $prod->gambar_produk;?>" class="tr_all_hover" alt="">
				<!--<span data-popup="#quick_view_product" class="button_type_5 box_s_none color_light r_corners tr_all_hover d_xs_none">Quick View</span>-->
			</a>
			<!--description and price of product-->
			<figcaption>
				<h5 class="m_bottom_10"><a href="<?php echo base_url();?>products/<?php echo $prod->seo_url?>" class="color_dark ellipsis"><?php echo $prod->nama_produk?></a></h5>
				<div class="clearfix">
					<p class="scheme_color f_left f_size_large m_bottom_15">Rp. <?php echo number_format($prod->harga, 0, ',', '.');?></p>
				</div>
				<button class="button_type_4 bg_scheme_color r_corners tr_all_hover color_light mw_0">Detil..</button>
			</figcaption>
		</figure>
		<?php 
        } 
        ?>
	</div>
	<!-- END PRODUCT -->
	</div>