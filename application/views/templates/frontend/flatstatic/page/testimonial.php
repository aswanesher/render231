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
						<div class="col-lg-12 col-md-12 col-sm-12 m_bottom_45">
							
							<h2 class="tt_uppercase color_dark m_bottom_25"><?php echo $page_title;?></h2>
							<?php 
				            foreach ($testimonial as $row) {
				            ?>
							<div class="m_bottom_45">
								<blockquote class="r_corners shadow f_size_large relative m_bottom_30"><?php echo ucfirst($row->testimonial);?></blockquote>
								<div class="d_inline_middle m_left_20">
									<h5 class="color_dark"><b><?php echo ucfirst($row->name);?></b></h5>
									<p>Diposting tanggal : <?php echo ucfirst($row->tanggal);?></p>
								</div>
							</div>
							<?php } ?>
						</div>
						<center><?php echo $this->pagination->create_links(); ?></center>
					</div>
				</div>
			</div>
			