<!-- Clients -->
<section class="client-section client-section-2 bg-gray no-border">
	<div class="container align-c">
		<h2 class="title small"><?php echo $delivery_caption;?></h2>
		
		<div class="client-logos">
			 <?php foreach ($delivery as $img) { ?>
			<img src="<?php echo $img->gambar;?>" alt="Partner logo">
			<?php } ?>
		</div><!-- /.client-logos -->		
	</div><!-- /.container -->
</section><!-- /.client-section -->