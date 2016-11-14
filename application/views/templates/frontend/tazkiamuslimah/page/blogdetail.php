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
					<a href="<?php echo base_url()?>">Home</a>
					<b> / </b>
					<a href="<?php echo base_url(); ?>p/berita">Berita</a>
					<b> / </b>
					<a href="#"><?php echo $page_title;?></a>
				</div>	
			</div>
		</div>
	</div>
</header><!-- / Header --><!-- content-section -->
<section class="content-section content-section-9">
	<div class="container">
		<div class="row">
			
			<!-- Column -->
			<div class="col-md-11">
				<?php echo $dtpost->post_content;?>
			</div><!-- / Column -->
			
		</div><!-- /.row -->
	</div><!-- /.container -->
</section><!-- /.content-section -->