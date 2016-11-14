<section class="bg_light_color_3 recent_work_wrap m_bottom_45">
					<div class="container">
						<div class="clearfix m_bottom_25 m_sm_bottom_20">
							<h2 class="tt_uppercase color_dark f_left heading2 animate_fade f_mxs_none m_mxs_bottom_15">Artikel Terbaru</h2>
							<div class="f_right clearfix nav_buttons_wrap animate_fade f_mxs_none">
								<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left tr_delay_hover r_corners orw_prev"><i class="fa fa-angle-left"></i></button>
								<button class="button_type_7 bg_cs_hover box_s_none f_size_ex_large t_align_c bg_light_color_1 f_left m_left_5 tr_delay_hover r_corners orw_next"><i class="fa fa-angle-right"></i></button>
							</div>
						</div>
						<div class="our_recent_work_carousel t_align_c">
							<?php foreach ($blogw as $rblog) { ?>
							<figure class="d_inline_b d_md_block t_align_l animate_ftb long">
								<div class="photoframe with_buttons relative shadow r_corners wrapper m_bottom_15">
									<img src="<?php echo $rblog->post_image;?>" alt="" class="tr_all_long_hover">
									<div class="open_buttons clearfix">
										<div class="f_left f_size_large tr_all_hover"><a href="<?php echo $rblog->post_image;?>" role="button" class="color_light button_type_13 r_corners box_s_none d_block jackbox" data-group="portfolio" data-title="title 1"><i class="fa fa-camera"></i></a></div>
										<div class="f_left m_left_10 f_size_large tr_all_hover"><a href="<?php echo base_url();?>judulberita/<?php echo $rblog->permalink?>" role="button" class="color_light button_type_13 r_corners box_s_none d_block"><i class="fa fa-link"></i></a></div>
									</div>
								</div>
								<figcaption class="t_xs_align_l">
									<h4 class="m_bottom_3"><a href="<?php echo base_url();?>judulberita/<?php echo $rblog->permalink?>" class="color_dark"><b><?php echo $rblog->post_title;?></b></a></h4>
									<?php 
                                        // strip tags to avoid breaking any html
                                        $string = strip_tags($rblog->post_content);

                                        if (strlen($string) > 100) {

                                            // truncate string
                                            $stringCut = substr($string, 0, 100);

                                            // make sure it ends in a word so assassinate doesn't become ass...
                                            $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'... <br><br><a href="'.base_url().'judulberita/'.$rblog->permalink.'" class="pix_button bold_text small_button btn_normal pix_button_flat dark_yellow_bg"><i class="pi pixicon-eye"></i> <span>Selengkapnya..</span></a>'; 
                                        }
                                        echo $string;
                                        ?>
								</figcaption>
							</figure>
							<?php } ?>
						</div>
					</div>
				</section>