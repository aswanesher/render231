<!DOCTYPE html>
<html><head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo $judul." | ".ucfirst($page_title);?></title>
	<meta name="description" content="<?php echo $meta_desc?>">
	<meta name="keywords" content="<?php echo $meta_keywords?>">

	<meta property="og:url" content="<?php echo base_url()?>" />
    <meta property="og:type" content="article" />
    <meta property="og:image" content="<?php echo base_url().$wlogo;?>" />
    <meta property="og:title" content="<?php echo $company;?>" />
    <meta property="og:description" content="<?php echo $meta_desc?>" />

    <meta name="author" content="<?php echo $company?>">
	<!--pageMeta-->

	<!-- Lib CSS -->
	<link href="<?php echo base_url();?>assets/frontend/tazkiamuslimah/minify/rgen_min.css" rel="stylesheet">
	<link href="<?php echo base_url();?>assets/frontend/tazkiamuslimah/css/custom.css" rel="stylesheet">

	<!-- Favicons -->
	<link rel="icon" href="<?php echo base_url().$wfavicon;?>">
	<link rel="apple-touch-icon" href="<?php echo base_url().$wfavicon;?>">
	<link rel="apple-touch-icon" sizes="72x72" href="<?php echo base_url().$wfavicon;?>">
	<link rel="apple-touch-icon" sizes="114x114" href="<?php echo base_url().$wfavicon;?>">

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<!--[if IE 9 ]><script src="js/ie-matchmedia.js"></script><![endif]-->
	<style type="text/css">
	/* MENU */
    nav {
		text-align: center;
	}

	nav ul ul {
		display: none;
	}

	nav ul li:hover > ul {
		display: block;
	}


	nav ul {
		padding: 0 20px;
		border-radius: 10px;  
		list-style: none;
		position: relative;
		display: inline-table;
	}
	nav ul:after {
		content: ""; clear: both; display: block;
	}

	nav ul li {
		float: left;
	}
		nav ul li:hover {
			background: #4b545f;
		}
			nav ul li:hover a {
				color: #fff !important;
			}
		
		nav ul li a {
			display: block; padding: 25px 40px;
			color: #757575; text-decoration: none;
		}
			
		
	nav ul ul {
		background: #5f6975; border-radius: 0px; padding: 0;
		position: absolute; top: 100%;
		margin-left: -4px;
		width: 200px;
	}
		nav ul ul li {
			float: none; 
			border-top: 1px solid #6b727c;
			border-bottom: 1px solid #575f6a; position: relative;
		}
			nav ul ul li a {
				padding: 15px 40px;
				color: #fff;
			}	
				nav ul ul li a:hover {
					background: #4b545f;
				}
		
	nav ul ul ul {
		position: absolute; left: 100%; top:0;
	}

	@media screen and (max-width: 800px) {
		nav ul ul {
			background: #5f6975; border-radius: 0px; padding: 0;
			position: absolute; top: 100%;
			margin-left: -4px;
			width: 100% !important;
			z-index: 9999 !important;
		}
	}

	</style>
</head>
<body>