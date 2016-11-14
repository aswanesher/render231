<!-- Navigation -->
<nav class="nav-wrp nav-2">
	<div class="container">
		
		<div class="nav-header">
			<a class="navbar-brand" href="#"><img src="<?php echo $wlogo;?>" alt="Brand logo"></a>
			<a class="nav-handle fs-touch-element" data-nav=".nav"><i class="fa fa-bars"></i></a>	
		</div>
		
		<div class="nav vm-item" style="z-index:9999;">
			<ul class="nav-links">
			<?php
            foreach ($menu as $r) {
            ?>	
				<li><a href="<?php echo base_url().$r->url;?>"><?php echo $r->title;?></a>
					<?php 
                    $subm=$this->menu_model->get_submenu_frontend($r->id);
                    if(!empty($subm)) {
                    echo '<ul>';    
                        foreach ($subm as $submenu) {    
                    ?>
                        <li><a href="<?php echo base_url().$submenu->url;?>"><?php echo $submenu->title;?></a>
                        	<ul>
                                                        <li><a href="#">Aa</a></li>
                                                        <li><a href="#">Bb</a></li>
                                                    </ul>
                        </li>
                    <?php 
                        }
                    echo '</ul>';    
                    } ?>
					<!--<ul>
						<li><a href="#">Photoshop</a></li>
						<li><a href="#">Illustrator</a></li>
						<li><a href="#">Web Design</a>
							<ul>
								<li><a href="#">HTML</a></li>
								<li><a href="#">CSS</a></li>
							</ul>
						</li>
					</ul>-->
				</li>
			<?php } ?>	
			</ul>
			<div class="nav-social">
				<a href="<?php echo $fb;?>"><i class="fa fa-facebook"></i></a>
				<a href="<?php echo $twitter;?>"><i class="fa fa-twitter"></i></a>
				<a href="<?php echo $gplus;?>"><i class="fa fa-google-plus"></i></a>
				<a href="<?php echo $ig;?>"><i class="fa fa-instagram"></i></a>
			</div>
		</div><!-- /.nav --> 
		
	</div><!-- /.container --> 
</nav><!-- /.nav-wrp -->