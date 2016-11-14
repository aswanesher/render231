<!-- Header -->
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
</header><!-- / Header -->
<!-- Content -->
<section class="content-section align-c content-section-9">
	<div class="container z1">
		<div class="row eqh gt40 fs-equalize-element">
			<?php 
        	foreach($blogs as $bg) {
        	?>
			<div class="col-md-4" style="height: 488px;">
				<div class="info-box info-box8">
					<div class="img"><a href="<?php echo base_url().'judulberita/'.$bg->permalink; ?>"><img src="<?php echo base_url();?><?php echo $bg->post_image;?>" class="img-responsive" alt="image"></a></div>
					<div class="info">
						<h2 class="hd"><a href="<?php echo base_url().'judulberita/'.$bg->permalink; ?>"><?php echo $bg->post_title?></a></h2>
						<?php 
								// strip tags to avoid breaking any html
								$string = strip_tags($bg->post_content);

								if (strlen($string) > 100) {

								    // truncate string
								    $stringCut = substr($string, 0, 100);

								    // make sure it ends in a word so assassinate doesn't become ass...
								    $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'... '; 
								}
								echo $string;
								?><br><br>
						<a href="<?php echo base_url().'judulberita/'.$bg->permalink; ?>" class="btn btn-default btn-xs">Selengkapnya..</a>
					</div>
				</div>	
			</div>
			<?php } ?>
		</div>
		<center><?php echo $this->pagination->create_links(); ?></center>

	</div><!-- /.container -->
</section><!-- /.content-section -->