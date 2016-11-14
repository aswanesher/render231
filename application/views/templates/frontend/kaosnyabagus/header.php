<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <title><?php echo $judul." | ".ucfirst($page_title);?></title>
    <meta name="description" content="<?php echo $meta_desc?>">
    <meta name="keywords" content="<?php echo $meta_keywords?>">
    <meta property="og:url" content="<?php echo base_url()?>" />
    <meta property="og:type" content="article" />
    <meta property="og:image" content="<?php echo base_url().$wlogo;?>" />
    <meta property="og:title" content="<?php echo $company;?>" />
    <meta property="og:description" content="<?php echo $meta_desc?>" />

    <meta name="author" content="<?php echo $company?>">
    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
    <meta http-equiv="x-ua-compatible" content="IE=9">
    <!-- Font Awesome -->
    <link href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/font-awesome.css" rel="stylesheet">
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js/html5shiv.js"></script>
      <script src="<?php echo base_url();?>assets/frontend/kaosnyabagus/js/respond.min.js"></script>
    <![endif]-->
    <!--headerIncludes-->
    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/menu.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/flat-ui-slider.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/base.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/skeleton.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/landings.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/main.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/landings_layouts.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/box.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/pixicon.css">
    <link href="<?php echo base_url();?>assets/frontend/kaosnyabagus/assets/css/animations.min.css" rel="stylesheet" type="text/css" media="all" />
    
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="<?php echo $wfavicon;?>">
    <link rel="apple-touch-icon" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/images/apple-touch-icon-114x114.png">
    
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/owl-carousel/owl.carousel.css">
    <!-- Default Theme -->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/owl-carousel/owl.theme.css">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script type="text/javascript" src="http://kaosnyabagus.com/livechat/php/app.php?widget-init.js"></script>
    <style type="text/css">
    #owl-demo .item{
      margin: 3px;
    }
    #owl-demo .item img{
      display: block;
      width: 100%;
      height: auto;
    }
    /* 
    Generic Styling, for Desktops/Laptops 
    */
    table { 
      width: 100%; 
      border-collapse: collapse; 
    }
    /* Zebra striping */
    tr:nth-of-type(odd) { 
      
    }
    th { 
      background: #333; 
      color: white; 
      font-weight: bold; 
    }
    td, th { 
      padding: 6px; 
      border: 1px solid #ccc; 
      text-align: left; 
    }

    /* 
    Max width before this PARTICULAR table gets nasty
    This query will take effect for any screen smaller than 760px
    and also iPads specifically.
    */
    @media 
    only screen and (max-width: 760px),
    (min-device-width: 768px) and (max-device-width: 1024px)  {

      /* Force table to not be like tables anymore */
      table, thead, tbody, th, td, tr { 
        display: block; 
      }
      
      /* Hide table headers (but not display: none;, for accessibility) */
      thead tr { 
        position: absolute;
        top: -9999px;
        left: -9999px;
      }
      
      tr { border: 1px solid #ccc; }
      
      td { 
        /* Behave  like a "row" */
        border: none;
        border-bottom: 1px solid #eee; 
        position: relative;
        padding-left: 50%; 
      }
      
      td:before { 
        /* Now like a table header */
        position: absolute;
        /* Top/left values mimic padding */
        top: 6px;
        left: 6px;
        width: 45%; 
        padding-right: 10px; 
        white-space: nowrap;
      }

    }

    #slideout {
        background: #666;
        position: fixed;
        width: 300px;
        height: 150px;
        top: 45%;
        left:-265px;
        z-index: 9999;
    }
        
    #clickme {
        float: right;
        height: 150px;
        width: 80px;
        background-image: url('<?php echo base_url();?>assets/frontend/kaosnyabagus/images/contact_btn_vertical.png');
    }

    #slidecontent {
        float:left;
    }



    ul.pagination {
    display: inline-block;
    padding: 0;
    margin: 0;
    }

    ul.pagination li {display: inline;}

    ul.pagination li a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
    }

    ul.pagination li a.active {
        background-color: #4CAF50;
        color: white;
    }

    ul.pagination li a:hover:not(.active) {
        background-color: #ddd;
    }

    /* MENU */
    .nav ul {
      list-style: none;
      background-color: #fff;
      border:1px solid #ccc;
      text-align: center;
      padding: 0;
      margin: 0;
      color: #000;
    }

    .nav li {
      font-size: 1.2em;
      line-height: 40px;
      text-align: left;
      color:#000;
      font-weight: bold;
    }

    .nav a {
      text-decoration: none;
      color: #fff;
      display: block;
      padding-left: 15px;
      border-bottom: 1px solid #888;
      transition: .3s background-color;
    }

    .nav a:hover {
      background-color: green;
      font-weight: bold;
      color:#000;
    }

    .nav a.active {
      background-color: #aaa;
      color: #444;
      cursor: default;
    }

    /* Sub Menus */
    .nav li li {
      font-size: .8em;
    }

    /*******************************************
       Style menu for larger screens

       Using 650px (130px each * 5 items), but ems
       or other values could be used depending on other factors
    ********************************************/

    @media screen and (min-width: 650px) {
      .nav li {
        
        margin-right: -4px;
      }

      .nav a {
        border-bottom: none;
      }

      .nav > ul > li {
        text-align: center;
      }

      .nav > ul > li > a {
        padding-left: 0;
      }

      /* Sub Menus */
      .nav li ul {
        position: absolute;
        display: none;
        width: 250px;
        top:76px;
        z-index: 9999;
      }

      .nav li:hover ul {
        display: block;
      }

      .nav li ul li {
        display: block;
      }
    }
    </style>

</head>
<body>