<div class="light_gray_bg big_padding pix_builder_bg " id="section_text_2">
    <div class="container center_text">       
        <div class="sixteen columns">
            <div class="intro_div">
                <h2 class="editContent"><strong><?php echo $page_title?></strong></h2>
                <?php echo $page_content;?>
                <center>
                    <a href="<?php echo base_url();?>testimoni/input" class="active_bg_open pix_button btn_normal btn_small bold_text green_bg">
                        <span>Kirim testimonial..</span>
                    </a> 
                </center>
            </div>
        </div>
    </div>
    <div class="container">       
        <div class="fourteen columns offset-by-one">
            <?php 
            foreach ($testimonial as $row) {
            ?>
            <div class="event_box row pix_builder_bg">
                <div class="event_box_6">
                    <div class="padding_15 hor_padding">
                        <h4>
                            <strong><?php echo ucfirst($row->name);?></strong>
                        </h4>
                        <p class="editContent small_text light_gray">
                            <?php echo ucfirst($row->testimonial);?>
                        </p>
                        <h6 class="pix_text">Diposting tanggal : <?php echo ucfirst($row->tanggal);?></h6>
                    </div>
                </div>
                
            </div>
            <?php 
            }
            ?>
        </div>
        <center><?php echo $this->pagination->create_links(); ?></center>
    </div>
</div>
