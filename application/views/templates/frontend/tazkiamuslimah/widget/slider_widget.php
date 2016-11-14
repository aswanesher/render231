<!-- intro-ecom -->
<section class="intro-ecom intro-ecom-1">
	<div class="carousel-widget ctrl-2" id="carousel-widget" data-nav="true" data-pager="true" data-items="1" data-itemrange="false" data-margin="0" data-hauto="false" data-loop="true" data-center="true">
		<div class="owl-carousel">
			
			<?php
            foreach ($slider as $srow) {
            ?>	
			<!-- item -->
			<div class="item">
				<div class="caption vm-item">
					<h3 class="main-text">
						<small><?php echo $srow->nama;?></small>
						<?php echo $srow->keterangan;?>
					</h3>
					<hr>
					<?php if($srow->url=='#'||$srow->url=='') { echo ""; } else { ?>
					<a href="<?php echo $srow->url;?>" class="btn btn-default">Selengkapnya</a>
					<?php } ?>
				</div>
				<a href="<?php echo $srow->url;?>" target="_blank" class="full-wh bg-cover bg-cc" data-bg="../<?php echo $srow->gambar;?>"><b class="overlay full-wh"></b></a>
			</div><!-- /.item -->
			<?php } ?>

		</div><!-- /.owl-carousel -->
	</div><!-- /.carousel-widget -->
</section><!-- /.intro-ecom -->