<!DOCTYPE html>
<html lang="en">
<head>
    <title><?php echo $judul." | ".ucfirst($page_title);?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!--meta info-->
    <meta name="description" content="<?php echo $meta_desc?>">
    <meta name="author" content="<?php echo $company?>">
    <meta name="keywords" content="<?php echo $meta_keywords?>">
    <meta property="og:url" content="<?php echo base_url()?>" />
    <meta property="og:type" content="article" />
    <meta property="og:image" content="<?php echo base_url().$wlogo;?>" />
    <meta property="og:title" content="<?php echo $company;?>" />
    <meta property="og:description" content="<?php echo $meta_desc?>" />    

	<link rel="icon" type="image/ico" href="<?php echo $wfavicon;?>">
    <link href="<?php echo base_url();?>assets/frontend/rendertech/lib/css/bootstrap.css" rel="stylesheet">
    <link href="<?php echo base_url();?>assets/frontend/rendertech/lib/css/font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo base_url();?>assets/frontend/rendertech/lib/css/jquery.bxslider.css" rel="stylesheet">
    <link href="<?php echo base_url();?>assets/frontend/rendertech/lib/css/style.css" rel="stylesheet">
	<link href="<?php echo base_url();?>assets/frontend/rendertech/lib/css/chat.css" rel="stylesheet">
	<!--<script type="text/javascript" src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/autoCekPesanan.js"></script>-->

</head>
<body>
<div id="pesanan"></div>
    <header>
        <div class="container">
            <div class="row">

                <!-- Logo -->
                <div class="col-lg-4 col-md-3 hidden-sm hidden-xs">
                    <div class="well logo">
                        <a href="<?php echo base_url()?>">
                            Render Tech <span> Production</span>
                        </a>
                        <div>one stop solution digital service</div>
                    </div>
                </div>
                <!-- End Logo -->
                <?php
                if($this->session->userdata('logged_in')) { 
                    $dt=$this->session->userdata('logged_in');
                ?>
                <!-- Search Form -->
                <div class="col-lg-3 col-md-5 col-sm-7 col-xs-12">
                    <div class="well">
                         <form action="./" method="GET" name="search">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control input-search" placeholder="Pencarian Jenis Produk"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-default no-border-left" type="submit"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- End Search Form -->

                <!-- Shopping Cart List -->
                <div class="col-lg-3 col-md-4 col-sm-5">
                    <div class="well">

                        <div class="btn-group btn-group-cart" onClick="loadTopCart();">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="pull-left"><i class="fa fa-shopping-cart icon-cart"></i></span>
                                <span class="pull-left">Keranjang Belanja: <span id="qtyShop"><?//$sql_row;?></span> item(s)</span>
                                <span class="pull-right"><i class="fa fa-caret-down"></i></span>
                            </button>
                            <ul class="dropdown-menu cart-content shp" id="shop" role="menu" >


                            </ul>

                        </div>
                    </div>
                </div>
                <!-- End Shopping Cart List -->
                 <!-- User -->
                <div class="col-lg-2 col-md-2 col-sm-5">
                    <div class="well">
                        <div class="btn-group btn-group-cart" >
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="pull-left"><i class="fa fa-user "></i></span>
                                Akun Pelanggan
                                <span class="pull-right"><i class="fa fa-caret-down"></i></span>
                            </button>
                            <?php //$data = mysqli_fetch_object(mysqli_query($link,"SELECT * FROM tbl_pelanggan WHERE id_pelanggan = '".$_SESSION['sesi_id_pelanggan_render_tech_production']."'")); ?>
                            <?php 
                            $usr=$this->session->userdata('logged_in');
                            //var_dump($usr);
                            $getdtfoto = $this->db->query("select user_pic from kb_user_detail where ID='".$dt['id']."'");
                            $foto = $getdtfoto->row();
                            ?>
                            <ul class="dropdown-menu " id="shop" role="menu" >
                            <li style="text-align:center;">
                                <div id="files1">
                                    <img src="<?php echo base_url().$foto->user_pic;?>" class="img-thumbnail" height="100" width="80%"/>
                                </div>
                            </li>
                            <li class="divider"></li>
                                    <li><a href="<?php echo base_url();?>member-profile">Profil Pelanggan</a></li>
                                    <li><a href="<?php echo base_url();?>change-password">Ubah Password</a></li>
                                    <li><a href="<?php echo base_url();?>logout">Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- End User -->
                <?php }else{ ?>
                <!-- Search Form -->
               <div class="col-lg-3 col-md-5 col-sm-7 col-xs-12">
                    <div class="well">
                         <form action="./" method="GET" name="search">
                            <div class="input-group">
                                <input type="text" name="q" class="form-control input-search" placeholder="Pencarian Jenis Produk"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-default no-border-left" type="submit"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- End Search Form -->

                <!-- Shopping Cart List -->
                <div class="col-lg-3 col-md-4 col-sm-5">
                    <div class="well">

                        <div class="btn-group btn-group-cart" onClick="loadTopCart();">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <span class="pull-left"><i class="fa fa-shopping-cart icon-cart"></i></span>
                                <span class="pull-left">Keranjang Belanja: <span id="qtyShop"><? //$sql_row;?></span> item(s)</span>
                                <span class="pull-right"><i class="fa fa-caret-down"></i></span>
                            </button>
                            <ul class="dropdown-menu cart-content shp" id="shop" role="menu" >


                            </ul>

                        </div>
                    </div>
                </div>
                <!-- End Shopping Cart List -->
                 <!-- User -->
                <div class="col-lg-2 col-md-2 col-sm-5">
                    <div class="well">
                        <div class="btn-group btn-group-cart" >
                            <a class="btn btn-default " href="<?php echo base_url();?>user-login">
                                <span class="pull-left"><i class="fa fa-sign-in "></i></span>
                                Login User
                            </a>

                        </div>
                    </div>
                </div>
                <!-- End User -->
                <?php } ?>
                
            </div>
            
        </div>
    </header>