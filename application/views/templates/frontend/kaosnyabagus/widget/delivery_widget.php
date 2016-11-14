<div class="pixfort_corporate_2" id="section_corporate_7">
		<div class="logos_style pix_builder_bg animate-in" style="outline-offset: -3px; padding-top: 40px; padding-bottom: 40px; box-shadow: none; border-color: rgb(223, 230, 236) rgb(68, 68, 68) rgb(68, 68, 68); background-image: none; background-attachment: scroll; background-color: rgb(239, 243, 246); background-size: auto; background-repeat: repeat;" data-anim-type="bounce-in" data-anim-delay="">
			<div class="container">
					<div class="sixteen columns">
                        <?php echo $delivery_caption;?>
                        </div>
                        <?php 
                        foreach ($delivery as $img) { ?>
                        <div class="four columns center_text">
                            <img src="<?php echo $img->gambar;?>" width="120" height="75" class="margin_vertical" alt="">
                            <br>
                            <?php echo $img->keterangan;?>
                        </div>
                        <?php } ?>
			</div><!-- container -->
		</div>
	</div>