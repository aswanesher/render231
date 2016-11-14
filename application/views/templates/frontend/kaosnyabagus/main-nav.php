<div id="page" class="page">
    
        <div class="light_gray_bg small_padding pix_builder_bg" id="section_text_2">
            <div class="container">
                <div class="sixteen columns alpha center_text">
                    <img class="extra_small_padding padding_left_10" src="<?php echo $wlogo;?>" alt="">
                </div>
            </div>
        </div>


        <div class="" id="section_header_5">
            <div class="header_style header_nav_1 pix_builder_bg">
                <div class="container">
                    <div class="sixteen columns">
                        <nav role="navigation" class="navbar navbar_no_margin navbar-white navbar-embossed navbar-lg pix_nav_1">
                            <div class="container">                            
                                <div class="navbar-header">
                                    <button data-target="#navbar-collapse-02" data-toggle="collapse" class="navbar-toggle header_5_nav" type="button">
                                        <span class="sr-only">Toggle navigation</span>

                                    </button>
                                </div>
                                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                                    <ul class="nav navbar-nav navbar-center center_mobile_menu">
                                    <?php
                                    foreach ($menu as $r) {
                                    ?>
                                        <li class="active propClone">
                                            <a href="<?php echo base_url().$r->url;?>"><?php echo $r->title;?></a>
                                            <?php 
                                            $subm=$this->menu_model->get_submenu_frontend($r->id);
                                            if(!empty($subm)) {
                                            echo '<ul>';    
                                                foreach ($subm as $submenu) {    
                                            ?>
                                                <li><a href="<?php echo base_url().$submenu->url;?>"><?php echo $submenu->title;?></a></li>
                                            <?php 
                                                }
                                            echo '</ul>';    
                                            } ?>
                                        </li>
                                    <?php } ?>    
                                    </ul>
                                </div><!-- /.navbar-collapse -->
                            </div><!-- /.container -->
                        </nav>
                    </div>
                </div><!-- container -->
            </div>
        </div>