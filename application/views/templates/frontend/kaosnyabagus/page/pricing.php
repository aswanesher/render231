<div class="big_padding pix_builder_bg dark event_bg" id="section_normal_4_1">
            <div class="container">
                <div class="sixteen columns center_text">
                    <p class="big_title editContent"><strong><?php echo $page_title;?></strong></p>
                    <div>
                    </div>
                </div>
           </div>
        </div>
    <div class="pixfort_corporate_2" id="section_text_2_1">
		<div class="container ">
			<div class="sixteen column">
				<div class="content_div">
                    <br>
					<?php echo $page_content;?>
				</div>
			</div>
		</div>
	</div>
    <!-- WIDGET PRICING -->
    <?php 
    if(!empty($pricing_widget)) {
        $this->load->view($temp.'widget/pricing_widget');
    }
    ?>
    <!-- END WIDGET PRICING -->

