			<!--breadcrumbs-->
			<section class="breadcrumbs">
				<div class="container">
					<ul class="horizontal_list clearfix bc_list f_size_medium">
						<li class="m_right_10 current"><a href="<?php echo base_url()?>" class="default_t_color">Home<i class="fa fa-angle-right d_inline_middle m_left_10"></i></a></li>
						<li><a href="#" class="default_t_color"><?php echo $page_title;?></a></li>
					</ul>
				</div>
			</section>
			<!--content-->
			<div class="page_content_offset">
				<div class="container">
					<div class="row clearfix">
						<!--Right content column-->
						<section class="col-lg-12 col-md-12 col-sm-12">
							<h2 class="tt_uppercase color_dark m_bottom_25"><?php echo $page_title;?></h2>
							<div class="r_corners photoframe map_container shadow m_bottom_45">
								<?php echo $gmap;?>
							</div>
							<div class="row clearfix">
								<div class="col-lg-4 col-md-4 col-sm-4 m_xs_bottom_30">
									<h2 class="tt_uppercase color_dark m_bottom_25">Info <?php echo $page_title;?></h2>
									<ul class="c_info_list">
										<li class="m_bottom_10">
											<div class="clearfix m_bottom_15">
												<i class="fa fa-map-marker f_left color_dark"></i>
												<p class="contact_e"><?php echo $address;?></p>
											</div>
										</li>
										<li class="m_bottom_10">
											<div class="clearfix m_bottom_10">
												<i class="fa fa-phone f_left color_dark"></i>
												<p class="contact_e"><?php echo $phone;?></p>
											</div>
										</li>
										<li class="m_bottom_10">
											<div class="clearfix m_bottom_10">
												<i class="fa fa-envelope f_left color_dark"></i>
												<a class="contact_e default_t_color" href="mailto:<?php echo $contact_email?>"><?php echo $contact_email?></a>
											</div>
										</li>
									</ul>
								</div>
								<div class="col-lg-8 col-md-8 col-sm-8 m_xs_bottom_30">
									<h2 class="tt_uppercase color_dark m_bottom_25">Kirim Pesan</h2>
									<p class="m_bottom_10">Kirimi Kami email <span class="scheme_color">*</span> harus terisi.</p>
									<form id="contactform">
										<ul>
											<li class="clearfix m_bottom_15">
												<div class="f_left half_column">
													<label for="cf_name" class="required d_inline_b m_bottom_5">Nama</label>
													<input type="text" id="cf_name" name="cf_name" class="full_width r_corners">
												</div>
												<div class="f_left half_column">
													<label for="cf_email" class="required d_inline_b m_bottom_5">Email</label>
													<input type="email" id="cf_email" name="cf_email" class="full_width r_corners">
												</div>
											</li>
											<li class="m_bottom_15">
												<label for="cf_subject" class="d_inline_b m_bottom_5">Subjek</label>
												<input type="text" id="cf_subject" name="cf_subject" class="full_width r_corners">
											</li>
											<li class="m_bottom_15">
												<label for="cf_message" class="d_inline_b m_bottom_5 required">Pesan</label>
												<textarea id="cf_message" name="cf_message" class="full_width r_corners"></textarea>
											</li>
											<li>
												<button class="button_type_4 bg_light_color_2 r_corners mw_0 tr_all_hover color_dark">Kirim</button>
											</li>
										</ul>
									</form>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
			