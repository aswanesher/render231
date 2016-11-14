<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
	<head>
		<title><?php echo $judul." | ".ucfirst($page_title);?></title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!--meta info-->
		<meta name="description" content="<?php echo $meta_desc?>">
		<meta name="author" content="<?php echo $company?>">
		<meta name="keywords" content="<?php echo $meta_keywords?>">
		<meta property="og:url" content="<?php echo base_url()?>" />
		<meta property="og:type" content="article" />
		<meta property="og:image" content="<?php echo base_url().$wlogo;?>" />
		<meta property="og:title" content="<?php echo $company;?>" />
		<meta property="og:description" content="<?php echo $meta_desc?>" />
		
		<link rel="icon" type="image/ico" href="<?php echo $wfavicon;?>">
		<!--stylesheet include-->
		<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/frontend/flatstatic/css/jackbox.min.css">
		<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/frontend/flatstatic/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/frontend/flatstatic/css/settings.css">
		<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/frontend/flatstatic/css/owl.carousel.css">
		<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/frontend/flatstatic/css/owl.transitions.css">
		<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/frontend/flatstatic/css/jquery.custom-scrollbar.css">
		<link rel="stylesheet" type="text/css" media="all" href="<?php echo base_url();?>assets/frontend/flatstatic/css/style.css">
		<!--font include-->
		<link href="<?php echo base_url();?>assets/frontend/flatstatic/css/font-awesome.min.css" rel="stylesheet">
	</head>
	<body>
		<!--boxed layout-->
		<div class="wide_layout relative w_xs_auto">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header-->
			<header role="banner" class="type_5">
				<!--header top part-->
				<section class="h_top_part">
					<div class="container">
						<div class="row clearfix">
							<div class="col-lg-8 col-md-8 col-sm-4 t_align_l t_xs_align_c">
								<p class="f_size_small">Hubungi Kami. Telp. : <b class="color_dark"><?php echo $phone;?></b>, Whatsapp : <b class="color_dark"><?php echo $whatsapp;?></b>, BBM : <b class="color_dark"><?php echo $bbm;?></b></p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-5 t_align_r t_xs_align_c">
								<ul class="horizontal_list clearfix d_inline_b t_align_l f_size_small site_settings type_2">
									<li class="container3d relative">
										<a role="button" href="#" class="color_dark" id="lang_button"><img class="d_inline_middle m_right_10" src="<?php echo base_url();?>assets/frontend/flatstatic/images/flag_en.jpg" alt="">English</a>
										<ul class="dropdown_list type_2 top_arrow color_light">
											<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<?php echo base_url();?>assets/frontend/flatstatic/images/flag_en.jpg" alt="">English</a></li>
											<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<?php echo base_url();?>assets/frontend/flatstatic/images/flag_fr.jpg" alt="">French</a></li>
											<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<?php echo base_url();?>assets/frontend/flatstatic/images/flag_g.jpg" alt="">German</a></li>
											<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<?php echo base_url();?>assets/frontend/flatstatic/images/flag_i.jpg" alt="">Italian</a></li>
											<li><a href="#" class="tr_delay_hover color_light"><img class="d_inline_middle" src="<?php echo base_url();?>assets/frontend/flatstatic/images/flag_s.jpg" alt="">Spanish</a></li>
										</ul>
									</li>
									<!--<li class="m_left_20 relative container3d">
										<a role="button" href="#" class="color_dark" id="currency_button"><span class="scheme_color">$</span> US Dollar</a>
										<ul class="dropdown_list type_2 top_arrow color_light">
											<li><a href="#" class="tr_delay_hover color_light"><span class="scheme_color">$</span> US Dollar</a></li>
											<li><a href="#" class="tr_delay_hover color_light"><span class="scheme_color">&#8364;</span> Euro</a></li>
											<li><a href="#" class="tr_delay_hover color_light"><span class="scheme_color">&#163;</span> Pound</a></li>
										</ul>
									</li>-->
								</ul>
							</div>
						</div>
					</div>
				</section>
				<!--header bottom part-->
				<section class="h_bot_part">
					<div class="menu_wrap">
						<div class="container">
							<div class="clearfix row">
								<div class="col-lg-2 t_md_align_c m_md_bottom_15">
									<a href="index.html" class="logo d_md_inline_b">
										<img src="<?php echo $wlogo;?>" alt="">
									</a>
								</div>
								<div class="col-lg-10 clearfix t_sm_align_c">
									<div class="clearfix t_sm_align_l f_right f_sm_none relative s_form_wrap m_sm_bottom_15 p_xs_hr_0 m_xs_bottom_5">
										<!--button for responsive menu-->
										<button id="menu_button" class="r_corners centered_db d_none tr_all_hover d_xs_block m_xs_bottom_5">
											<span class="centered_db r_corners"></span>
											<span class="centered_db r_corners"></span>
											<span class="centered_db r_corners"></span>
										</button>
										<!-- Main Nav -->
										<?php
										$this->load->view($temp.'main-nav');
										?>
										<button class="f_right search_button tr_all_hover f_xs_none d_xs_none">
											<i class="fa fa-search"></i>
										</button>
										<!--search form-->
										<div class="searchform_wrap type_2 bg_tr tf_xs_none tr_all_hover w_inherit">
											<div class="vc_child h_inherit relative">
												<form role="search" class="d_inline_middle full_width">
													<input type="text" name="search" placeholder="Ketik kata kunci lalu tekan enter" class="f_size_large p_hr_0">
												</form>
												<button class="close_search_form tr_all_hover d_xs_none color_dark">
													<i class="fa fa-times"></i>
												</button>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<hr class="divider_type_6">
					</div>
				</section>
			</header>