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
			<!-- WIDGET PRICING -->
		    <?php 
		    if(!empty($pricing_widget)) {
		        $this->load->view($temp.'widget/pricing_widget');
		    }
		    ?>
		    <!-- END WIDGET PRICING -->
			