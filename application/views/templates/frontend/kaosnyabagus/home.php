    <!-- WIDGET SLIDER -->
    <?php 
    if(!empty($slider_widget)) {
        $this->load->view($temp.'widget/slider_widget');
    } 
    ?>
    <!-- END WIDGET SLIDER -->

    <!-- RUNNING WIDGET RUNNING TEXT-->
    <?php 
    if(!empty($runningtext_widget)) {
        $this->load->view($temp.'widget/runningtext_widget');
    } 
    ?>
    <!-- END WIDGET RUNNING TEXT -->    

    <!-- WIDGET PRODUK -->
    <?php 
    if(!empty($produk_widget)) {
        $this->load->view($temp.'widget/produk_widget');
    }   
    ?>
    <!-- END WIDGET PRODUK -->
    <hr>
    <!-- WIDGET ARTIKEL -->
    <?php 
    if(!empty($artikel_widget)) {
        $this->load->view($temp.'widget/artikel_widget');
    }   
    ?>
    <!-- END WIDGET ARTIKEL -->

        
        <!-- WIDGET PRICING -->
        <?php 
        if(!empty($pricing_widget)) {
            $this->load->view($temp.'widget/pricing_widget');
        }
        ?>
        <!-- END WIDGET PRICING -->

        <!-- WIDGET HALAMAN -->
        <?php 
        if(!empty($page_widget)) {
            $this->load->view($temp.'widget/page_widget');
        }   
        ?>
        <!-- END WIDGET HALAMAN -->
    </div>

    <!-- WIDGET TESTIMONIAL -->
    <?php 
    if(!empty($testimonial_widget)) {
        $this->load->view($temp.'widget/testimonial_widget');
    }   
    ?>
    <!-- END WIDGET TESTIMONIAL -->

    <!-- WIDGET BLOG -->
    <?php 
    if(!empty($blog_widget)) {
        $this->load->view($temp.'widget/blog_widget');
    } 
    ?>
    <!-- END WIDGET BLOG --> 

    <!-- WIDGET BANK -->
    <?php 
    if(!empty($bank_widget)) {
        $this->load->view($temp.'widget/bank_widget');
    }   
    ?>
    <!-- END WIDGET BANK -->

    <!-- WIDGET DELIVERY -->
    <?php 
    if(!empty($delivery_widget)) {
        $this->load->view($temp.'widget/delivery_widget');
    }   
    ?>
    <!-- END WIDGET DELIVERY -->

    
	
