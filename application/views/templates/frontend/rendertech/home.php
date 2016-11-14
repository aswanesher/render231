			

		    <!-- RUNNING WIDGET RUNNING TEXT-->
		    <?php 
		    /*if(!empty($runningtext_widget)) {
		        $this->load->view($temp.'widget/runningtext_widget');
		    } */
		    ?>
		    <!-- END WIDGET RUNNING TEXT -->

			<!--content-->
			
				<!-- WIDGET SLIDER -->
			    <?php 
			    if(!empty($slider_widget)) {
			        $this->load->view($temp.'widget/slider_widget');
			    } 
			    ?>
			    <!-- END WIDGET SLIDER -->
				<!-- WIDGET PRODUK -->
			    <?php 
			    if(!empty($produk_widget)) {
			        $this->load->view($temp.'widget/produk_widget');
			    }   
			    ?>
			    <!-- END WIDGET PRODUK -->

				<!-- WIDGET BLOG -->
			    <?php 
			    /*if(!empty($blog_widget)) {
			        $this->load->view($temp.'widget/blog_widget');
			    } */
			    ?>
			    <!-- END WIDGET BLOG --> 
				<!--<div class="container">
					<div class="row clearfix animate_corporate_container">
						<!-- WIDGET HALAMAN -->
					    <?php 
					    /*if(!empty($page_widget)) {
					        $this->load->view($temp.'widget/page_widget');
					    } */  
					    ?>
					    <!-- END WIDGET HALAMAN -->
						<!-- WIDGET TESTIMONIAL -->
					    <?php 
					    /*if(!empty($testimonial_widget)) {
					        $this->load->view($temp.'widget/testimonial_widget');
					    } */  
					    ?>
					    <!-- END WIDGET TESTIMONIAL -->
					<!--</div>
				</div>-->
				<!-- WIDGET PRICING -->
				<?php 
				/*if(!empty($pricing_widget)) {
				    $this->load->view($temp.'widget/pricing_widget');
				}*/
				?>
				<!-- END WIDGET PRICING -->	
			