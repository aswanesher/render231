			<!--breadcrumbs-->
			<section class="breadcrumbs">
				<div class="container">
					<ul class="horizontal_list clearfix bc_list f_size_medium">
						<li class="m_right_10 current"><a href="<?php echo base_url();?>" class="default_t_color">Home<i class="fa fa-angle-right d_inline_middle m_left_10"></i></a></li>
						<li><a href="#" class="default_t_color"><?php echo $page_title;?></a></li>
					</ul>
				</div>
			</section>
			<!--content-->
			<div class="page_content_offset">
				<div class="container">
					<div class="row clearfix">
						<!--left content column-->
						<section class="col-lg-12 col-md-12 col-sm-12 m_xs_bottom_30">
							<h2 class="tt_uppercase color_dark m_bottom_30"><?php echo $page_title;?></h2>
							<div class="bg_light_color_3 r_corners shadow manufacturers">
								<?php echo $page_content;?>
							</div>
						</section>
					</div>
					<br>
					<!-- WIDGET TEAM -->
				    <?php 
				    if(!empty($team_widget)) {
				        $this->load->view($temp.'widget/team_widget');
				    }   
				    ?>
				    <!-- END WIDGET TEAM -->
				</div>
			</div>
			