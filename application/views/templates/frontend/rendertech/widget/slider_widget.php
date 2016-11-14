<div class="row">
        	<!-- Slider -->
        	<div class="col-lg-12 col-md-12" >
                <div class="slider" >
                    <ul class="bxslider" >
                       	<?php
			            foreach ($slider as $srow) {
			            ?>
							<li>
								<a href="javascript:void(0);">
									<img src="<?php echo $srow->gambar;?>" alt=""/>
								</a>
							</li>
						 
						<?php } ?>
                    </ul>
                </div>
            </div>
            <!-- End Slider -->
        </div>