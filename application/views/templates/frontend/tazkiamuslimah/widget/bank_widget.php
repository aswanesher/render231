<!-- Clients -->
<section class="client-section client-section-2">
	<div class="container">
		<div class="row eqh fs-equalize-element">
			<div class="col-md-4" style="height: 158px;">
				<div class="content vm-item">
					<h2 class="title small">Transfer Bank</h2>
					<p class="title-sub small"><?php echo $bank_caption;?></p>			
				</div>
			</div>
			<div class="col-md-8" style="height: 158px;">
				<div class="client-logos vm-item">
					<?php 
                        foreach ($bank as $img) { 
                    ?>
					<img src="<?php echo $img->gambar;?>" alt="Brand logo" width="200">
					<?php } ?>
				</div><!-- /.client-logos -->					
			</div>
		</div>
	</div><!-- /.container -->
</section><!-- /.client-section -->