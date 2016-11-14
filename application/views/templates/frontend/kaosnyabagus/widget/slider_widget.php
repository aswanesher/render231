<div class="pixfort_pix_slider pix_builder_bg" id="section_slider" style="outline-offset: -3px;">
        <div class="container">
            <div class="sixteen columns">
                <div id="myCarousel" class="carousel slide" data-interval="5000" data-ride="carousel">    					
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <?php
                        $i = 0;
                        $len = count($slider); 
                        foreach ($slider as $srow) {
                            if($i==0) {
                                $a='active';
                            } else {
                                $a='';
                            }
                        ?>
                        <li data-target="#myCarousel" data-slide-to="<?php echo $i;?>" <?php echo $a;?>></li>
                        <?php 
                        $i++;
                        }
                        ?>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <?php
                        $i = 0;
                        $len = count($slider); 
                        foreach ($slider as $srow) {
                            if($i==0) {
                                $a='active';
                            } else {
                                $a='';
                            }
                        ?>
                        <div class="item <?php echo $a;?>">
                            <img src="../<?php echo $srow->gambar;?>" alt="">
                            <div class="carousel-caption editContent">
                                <h3><?php echo $srow->nama;?></h3>
                                <p><?php echo $srow->keterangan;?></p>
                            </div>
                        </div>
                        <?php 
                        $i++;
                        }
                        ?>
                        <!--<div class="item">
                            <img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/main/image-2.jpg" alt="">
                            <div class="carousel-caption editContent">
                                <h3>Thumbnail label</h3>
                                <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec.</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/main/image-3.jpg" alt="">
                            <div class="carousel-caption editContent">
                                <h3>Thumbnail label</h3>
                                <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec.</p>
                            </div>
                        </div>-->
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control fui-arrow-left" href="#myCarousel" data-slide="prev"></a>
                    <a class="right carousel-control fui-arrow-right" href="#myCarousel" data-slide="next"></a>
                </div>
            </div>
        </div><!-- /.container -->
    </div>