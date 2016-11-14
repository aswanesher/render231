
<header class="pghead-section pghead-section3">
	<div class="bg-section full-wh bg-cc bg-cover" data-bg="<?php echo base_url();?>assets/frontend/tazkiamuslimah/images/bg1.jpg" style="background-image: url(&quot;images/bg1.jpg&quot;);"></div>
	<div class="container typo-light">
		<div class="flex-row middle-md">
			<div class="flex-col-md-6">
				<h1 class="title medium mr-b-10"><?php echo $page_title;?></h1>
			</div>
			<div class="flex-col-md-6">
				<div class="pg-path">
					<a href="<?php echo base_url();?>">Home</a>
					<b> / </b>
					<a href="#"><?php echo $page_title;?></a>
				</div>	
			</div>
		</div>
	</div>
</header><!-- / Header --><!-- Testimonials -->
<section class="testimonial-section testimonial-section-4">
	<div class="container">
		<h1 class="title medium mr-b-10">Testimoni Pelanggan</h1>
		<hr class="mr-tb-40">

		<div class="row">
			<?php 
            foreach ($testimonial as $row) {
            ?>
			<div class="col-md-12">
				<div class="feedback-box feedback-box3">
					<i class="quote fa fa-quote-right"></i>
					<p class="feedback"><?php echo ucfirst($row->testimonial);?></p>
					<div class="person">
						<img src="<?php echo base_url();?>assets/frontend/tazkiamuslimah/images/person6.jpg" alt="Person">
						<div class="info">
							<strong><?php echo ucfirst($row->name);?></strong>
							<em><?php echo ucfirst($row->tanggal);?></em>
						</div>
					</div>
					<i class="down-arrow fa fa-caret-down"></i>
				</div><!-- /.feedback-box -->
			</div>
			<?php 
            }
            ?>
		</div>
		<center><?php echo $this->pagination->create_links(); ?></center>
	</div>
</section><!-- /.testimonial-section --><!-- Footer section -->
