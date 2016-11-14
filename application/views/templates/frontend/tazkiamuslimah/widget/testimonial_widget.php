<!-- Testimonials -->
<section class="testimonial-section dark testimonial-section-3">
	<div class="container-fluid">
		<h2 class="title"><?php echo $testimonial_caption;?></h2>
		<div class="carousel-widget ctrl-1" id="carousel-widget" data-margin="20" data-itemrange="0,1|420,1|600,2|768,2|992,2|1200,2" data-autoplay="false" data-nav="false" data-pager="true" data-center="true">
			<div class="owl-carousel">
				<?php 
				foreach ($testimonial as $trow) {
				?>
				<div class="item">
					<div class="feedback-box feedback-box3">
						<i class="quote fa fa-quote-right"></i>
						<p class="feedback">
							<?php 
							// strip tags to avoid breaking any html
							echo $trow->testimonial
							?></p>
						<div class="person">
							<img src="<?php echo base_url();?>assets/frontend/tazkiamuslimah/images/person6.jpg" alt="Person">
							<div class="info">
								<strong><?php echo ucfirst($trow->name);?></strong>
								<!--<em>Creative Director</em>	-->
							</div>
						</div>
						<i class="down-arrow fa fa-caret-down"></i>
					</div><!-- /.feedback-box -->
				</div>
				<?php 
				}
				?>

			</div><!-- /.owl-carousel -->
		</div><!-- /.carousel-widget -->

	</div>
</section><!-- /.testimonial-section -->