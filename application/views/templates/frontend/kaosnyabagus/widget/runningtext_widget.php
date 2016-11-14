<div class="pixfort_content_1 intro_1 pix_contents dark pix_builder_bg" id="section_intro_title_dark" style="    padding-top: 10px !important; padding-bottom: 5px !important;">
		<!--<div class="container">       
	            <div class="sixteen columns">
	            	<div class="intro_div">
	                	<p class="editContent" style="">Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad  voluptate velit esse cillum dolore eu fugiat.</p>
	                </div>
	            </div>
	    </div>-->
        <marquee>
        	<?php foreach ($runningtext as $row) { ?>
        	<p class="editContent" style="color:#fffff !important;"><?php echo $row->post_content;?></p>
        	<?php } ?>
        </marquee>
	</div>