<div class="col-lg-6 col-md-6 col-sm-6 m_bottom_45 animate_fade long">
	<h2 class="tt_uppercase color_dark m_bottom_20"><?php echo $section_title;?></h2>
	<p class="m_bottom_10">
		<?php 
        // strip tags to avoid breaking any html
        $string = strip_tags($page_content);

        if (strlen($string) > 100) {

            // truncate string
            $stringCut = substr($string, 0, 800);

            // make sure it ends in a word so assassinate doesn't become ass...
            $string = substr($stringCut, 0, strrpos($stringCut, ' ')).'...'; 
        }
        echo $string;
        ?></p>
</div>