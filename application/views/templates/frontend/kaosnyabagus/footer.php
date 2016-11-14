<div id="slideout">
    <div id="slidecontent">
        Yar, there be dragonns herre!
    </div>
    <a href="#popup_2" id="clickme">
    </a>
</div>

        <div id="popup_2" class="well pix_popup pop_style_1 pop_hidden light_gray_bg pix_builder_bg" style="display:none;">
            <div class="center_text ">
                <div class="big_icon dark_red">
                    <span class="pi pixicon-phone"></span>
                </div>
                <span class="editContent"><h4 class="margin_bottom pix_text"><strong>Kontak Customer Service Kami</strong></h4></span>
                <br>
                <table>
                    <thead>
                        <tr>
                            <th>Nama</th>
                            <th>BBM</th>
                            <th>Whatsapp</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($users as $ru) { ?>
                        <tr>
                            <td><?php echo $ru->name;?></td>
                            <td><?php echo $ru->bbm_pin;?></td>
                            <td><?php echo $ru->whatsapp;?></td>
                        </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>

<div class="section_pointer" pix-name="10_business"></div><div class="padding_top_60 padding_bottom_20 pix_builder_bg animate-in" id="section_intro_title" src="images/main/logo.png" style="outline-offset: -3px; padding-top: 60px; padding-bottom: 20px; box-shadow: none; border-color: rgb(68, 68, 68); background-image: none; background-attachment: scroll; background-color: rgba(0, 0, 0, 0); background-size: auto; background-repeat: repeat;" data-anim-type="fade-in" data-anim-delay="">
            <div class="container ">       
                <div class="eight columns small_padding">
                    <div class="intro_div">
                        <img class="padding_bottom_20" src="<?php echo $wlogo;?>" alt="">
                        <p class="editContent light_gray">
                            <?php 
                            echo $address;
                            ?><br>
                            Phone : <?php echo $phone;?><br>
                            Handphone : <?php echo $cellphone;?>
                        </p>
                        <ul class="bottom-icons padding_top_20">
                                <li><a class="pi pixicon-facebook2 light_gray" href="<?php echo $fb;?>" target="_blank"></a></li>
                                <li><a class="pi pixicon-twitter2 light_gray" href="<?php echo $twitter;?>" target="_blank"></a></li>
                                <li><a class="pi pixicon-instagram light_gray" href="<?php echo $ig;?>" target="_blank"></a></li>
                                <li><a class="pi pixicon-googleplus2 light_gray" href="<?php echo $gplus;?>" target="_blank"></a></li>
                            </ul>
                    </div>
                </div>
                <!-- WIDGET CUSTOM -->
                <?php 
                //if(!empty($custom_widget)) {
                ?>
                <div class="five columns small_padding">
                    <div class="intro_div">
                        <h3 class="gray editContent"><strong>Temukan Kami</strong></h3>
                        <?php //echo $custom_caption;?>
                        <iframe allowtransparency="true" frameborder="0" height="220" scrolling="no" src="https://www.facebook.com/plugins/page.php?href=<?php echo $fb;?>%2F&amp;tabs=timeline&amp;height=220&amp;small_header=false&amp;adapt_container_width=true&amp;hide_cover=false&amp;show_facepile=true&amp;appId" style="border:none;overflow:hidden"></iframe>
                    </div>
                </div>
                <div class="three columns small_padding">
                    <div class="intro_div">
                        <h3 class="gray editContent"><strong></strong></h3>
                        <?php //echo $custom_caption;?>
                        <a class="twitter-timeline" data-widget-id="737616268274999296" href="<?php echo $twitter;?>"></a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
                    </div>
                </div>
                <?php //} ?>
                <hr>
                <div class="editContent light_gray small_text" style="">KaosnyaBagus Copyright © 2016 | Provided by Savana-Tech. All Rights Reserved</div>
            </div>

        </div></div>

<!-- JavaScript
================================================== -->
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/jquery.easing.1.3.js" type="text/javascript"></script>
<script type="text/javascript" src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/jquery.common.min.js"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/ticker.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/custom1.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/assets/js/smoothscroll.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/assets/js/appear.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/jquery.ui.touch-punch.min.js"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/bootstrap.min.js"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/bootstrap-switch.js"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js-files/custom3.js" type="text/javascript"></script>

<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/assets/js/appear.min.js" type="text/javascript"></script>
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/assets/js/animations.js" type="text/javascript"></script>
<!-- Include js plugin -->
<script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript">
$(document).ready(function() {
 
  $("#owl-demo").owlCarousel({
 
      autoPlay: 3000, //Set AutoPlay to 3 seconds
 
      items : 2,
      itemsDesktop : [1199,3],
      itemsDesktopSmall : [979,3]
 
  });
 
});

/*$(function () {
    function () {
        $(this).parent().animate({left:'-265px'}, {queue: false, duration: 500});
    });
});*/
</script>
<?php 
echo $analytics;
?>
<?php 
echo $pixel;
?>
</body>
</html>