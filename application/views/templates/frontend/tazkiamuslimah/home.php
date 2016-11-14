<div id="page">

	<!-- WIDGET SLIDER -->
    <?php 
    if(!empty($slider_widget)) {
        $this->load->view($temp.'widget/slider_widget');
    } 
    ?>
    <!-- END WIDGET SLIDER -->

    <!-- WIDGET PAGE -->
    <?php 
    if(!empty($page_widget)) {
        $this->load->view($temp.'widget/page_widget');
    }   
    ?>
    <!-- END WIDGET PAGE -->

    <!-- WIDGET PRODUK -->
    <?php 
    if(!empty($produk_widget)) {
        $this->load->view($temp.'widget/produk_widget');
    }   
    ?>
    <!-- END WIDGET PRODUK -->

    <!-- WIDGET TESTIMONIAL -->
    <?php 
    if(!empty($testimonial_widget)) {
        $this->load->view($temp.'widget/testimonial_widget');
    }   
    ?>
    <!-- END WIDGET TESTIMONIAL -->

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

