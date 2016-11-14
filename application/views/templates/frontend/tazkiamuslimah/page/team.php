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
					<a href="#"><?php echo $page_title;?></a>
				</div>	
			</div>
		</div>
	</div>
</header><!-- / Header --><!-- extra-section -->
<section class="extra-section extra-content2">
	<div class="container">
		<div class="flex-row middle-md">
			<div class="flex-col-md-11">
				<div class="content">
					<?php echo $page_content;?>
				</div>
			</div><!-- / column -->
		</div><!-- / row -->
	</div><!-- / container -->
</section><!-- / extra-section -->