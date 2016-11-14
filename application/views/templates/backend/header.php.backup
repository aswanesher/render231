<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title><?php echo $judul;?></title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="<?php echo base_url("assets/backend/css/bootstrap.min.css");?>" />
		<link rel="stylesheet" href="<?php echo base_url("assets/backend/font-awesome/4.2.0/css/font-awesome.min.css");?>" />
		<link rel="stylesheet" href="<?php echo base_url()?>assets/backend/css/ui.jqgrid.min.css" />

		<!-- page specific plugin styles -->

		<!-- text fonts -->
		<link rel="stylesheet" href="<?php echo base_url("assets/backend/fonts/fonts.googleapis.com.css");?>" />

		<!-- ace styles -->
		<link rel="stylesheet" href="<?php echo base_url("assets/backend/css/ace.min.css");?>" class="ace-main-stylesheet" id="main-ace-style" />
		<link rel="stylesheet" href="<?php echo base_url(); ?>assets/backend/css/bootstrap-datepicker3.css" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="<?php echo base_url(); ?>assets/backend/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="<?php echo base_url(); ?>assets/backend/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->
		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.2.1.1.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<?php echo base_url(); ?>assets/backend/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<?php echo base_url(); ?>assets/backend/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<?php echo base_url(); ?>assets/backend/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery-ui.custom.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.easypiechart.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.sparkline.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.flot.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.flot.pie.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.flot.resize.min.js"></script>

		<!-- Datepicker -->
		<script src="<?php echo base_url(); ?>assets/backend/js/bootstrap-datepicker.js"></script>

		<!-- JqGrid -->
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.jqGrid.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/grid.locale-en.js"></script>

		<!-- Datatable -->
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.dataTables.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/dataTables.tableTools.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/dataTables.colVis.min.js"></script>

		<!-- ace scripts -->
		<script src="<?php echo base_url(); ?>assets/backend/js/ace-elements.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/ace.min.js"></script>

		<!-- ace settings handler -->
		<script src="<?php echo base_url("assets/backend/js/ace-extra.min.js");?>"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/jquery.nestable.min.js"></script>
		<script type="text/javascript" src="<?php echo base_url(); ?>assets/backend/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
		    $("#cal, #cal2").on("keydown keyup", sum);
			function sum() {
				$("#sum1").val(Number($("#cal2").val()) - Number($("#cal").val()));
			}
		});

		var table;
		var tablebiayaresi;
		$(document).ready(function() {
			//datatables
		    table = $('#table').DataTable({ 

		    	"language": {
        			"searchPlaceholder": "Cari Nama, No.Resi, Ekspedisi, Status dan tanggal"
    			},
		 
		        "processing": true, //Feature control the processing indicator.
		        "serverSide": true, //Feature control DataTables' server-side processing mode.
		        "order": [], //Initial no order.
		 
		        // Load data for the table's content from an Ajax source
		        "ajax": {
		            "url": "<?php echo site_url('laporan_resi/get_data')?>",
		            "type": "POST"
		        },
		 
		        //Set column definition initialisation properties.
		        "columnDefs": [
		        { 
		            "targets": [ -1 ], //last column
		            "orderable": false, //set not orderable
		        },
		        ],
		 
		    });

		    //datatables
		    tablebiayaresi = $('#tablebiaya').DataTable({ 

		    	"language": {
        			"searchPlaceholder": "Cari Nama, No.Resi, Ekspedisi dan tanggal"
    			},
		 
		        "processing": true, //Feature control the processing indicator.
		        "serverSide": true, //Feature control DataTables' server-side processing mode.
		        "order": [], //Initial no order.
		 
		        // Load data for the table's content from an Ajax source
		        "ajax": {
		            "url": "<?php echo site_url('biaya_resi/get_data')?>",
		            "type": "POST"
		        },
		 
		        //Set column definition initialisation properties.
		        "columnDefs": [
		        { 
		            "targets": [ -1 ], //last column
		            "orderable": false, //set not orderable
		        },
		        ],
		 
		    });
		});
		jQuery(function($){
			$("#input_title").keyup(function(event){
				var isi = $("#input_title").val();
				$("#input_title2").val(isi);
			});

			$("#nm_widget").change(function(){
				var s = $("#nm_widget").val();
		    	if(s=='post_w') {
		    		$("#pilihartikel").show();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihpricing").hide();
		    		$("#pilihpromo").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#adscopy").hide();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='page_w') {
		    		$("#pilihpage").show();
		    		$("#pilihartikel").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpricing").hide();
		    		$("#pilihpromo").hide();
		    		$("#adscopy").hide();
		    		$("#pilihpageurl").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='slider_w') {
		    		$("#pilihmedia").show();
		    		$("#pilihpage").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpricing").hide();
		    		$("#pilihpromo").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#adscopy").hide();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='pricing_w') {
		    		$("#pilihpricing").show();
		    		$("#pilihmedia").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#adscopy").show();
		    		$("#pilihpageurl").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='testimonial_w') {
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#adscopy").show();
		    		$("#pilihpageurl").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='promo_w') {
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").show();
		    		$("#adscopy").show();
		    		$("#pilihmediadelivery").hide();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='custom_w') {
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#adscopy").show();
		    		$("#pilihpageurl").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='product_w') {
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#adscopy").show();
		    		$("#pilihpageurl").show();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='team_w') {
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#adscopy").hide();
		    		$("#pilihpageurl").hide();	
		    		$("#pilihkatuser").show();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='runningtext_w') {
		    		$("#pilihrunningtext").show();
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#adscopy").hide();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihblog").hide();
		    	} else if(s=='blog_w') {
		    		$("#pilihblog").show();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihpricing").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#adscopy").show();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    	} else if(s=='bank_w') {
		    		$("#pilihmediabank").show();
		    		$("#pilihblog").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihmediadelivery").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#adscopy").show();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    	} else if(s=='delivery_w') {
		    		$("#pilihmediabank").hide();
		    		$("#pilihmediadelivery").show();
		    		$("#pilihblog").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihpromo").hide();
		    		$("#adscopy").show();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    	} else {
		    		$("#pilihmediadelivery").hide();
		    		$("#pilihpricing").hide();
		    		$("#pilihmedia").hide();
		    		$("#pilihpage").hide();
		    		$("#pilihartikel").hide();
		    		$("#pilihmediabank").hide();
		    		$("#pilihpromo").hide();
		    		$("#adscopy").hide();
		    		$("#pilihpageurl").hide();
		    		$("#pilihkatuser").hide();
		    		$("#pilihrunningtext").hide();
		    		$("#pilihblog").hide();
		    	} 
			});
		});
		</script>
		<script type="text/javascript">
			jQuery(function($){
				var kategori = $('#kategori').val();
                    $.ajax({
                        url: '<?php echo base_url();?>produk/sub_kategori/'+kategori,
                        cache: true,
                        success: function(msg){
                            $('#subkategori').html(msg);
                        }
                });
			});
			jQuery(function($){
				$('.date-picker').datepicker({
					autoclose: true,
					todayHighlight: true
				});

				$('#kategori').bind('change',function(){
					var kategori = $('#kategori').val();
                    $.ajax({
                        url: '<?php echo base_url();?>produk/sub_kategori/'+kategori,
                        cache: true,
                        success: function(msg){
                            $('#subkategori').html(msg);
                        }
                    });
				});

				$('.dd').nestable();

				$('.dd-handle a').on('mousedown', function(e){
					e.stopPropagation();
				});

				$('[data-rel="tooltip"]').tooltip();
			});

			jQuery(function($){
				$('#date-picker input').datepicker({
					todayHighlight: true
				});
			});
			jQuery(function($){
				var updateOutput = function(e)
			    {
			        var list   = e.length ? e : $(e.target),
			            output = list.data('output');
			        if (window.JSON) {
			            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
			        } else {
			            output.val('JSON browser support required for this demo.');
			        }
			    };

			    $('.dd').nestable({
			        group: 1,
			        maxDepth : 3
			    })
			    .on('change', updateOutput);
			    updateOutput($('.dd').data('output', $('#nestable-output')));
			    $('.dd').nestable();
			});
                        //FO
			jQuery(function($){
				var updateOutput = function(e)
			    {
			        var list   = e.length ? e : $(e.target),
			            output = list.data('outputfo');
			        if (window.JSON) {
			            output.val(window.JSON.stringify(list.nestable('serialize')));//, null, 2));
			        } else {
			            output.val('JSON browser support required for this demo.');
			        }
			    };

			    $('.dd').nestable({
			        group: 2,
			        maxDepth : 3
			    })
			    .on('change', updateOutput);
			    updateOutput($('.dd').data('outputfo', $('#nestable1-outputfo')));
			    $('.dd').nestable();
			});
		</script>
		<script type="text/javascript">
		function openKCFinder(field) {
		    window.KCFinder = {
		        callBack: function(url) {
		            field.value = url;
		            window.KCFinder = null;
		        }
		    };
		    window.open('<?php echo base_url(); ?>assets/backend/kcfinder/browse.php?type=images', 'kcfinder_textbox',
		        'status=0, toolbar=0, location=0, menubar=0, directories=0, ' +
		        'resizable=1, scrollbars=0, width=800, height=600'
		    );
		}
		</script>
		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="<?php echo base_url(); ?>assets/backend/js/html5shiv.min.js"></script>
		<script src="<?php echo base_url(); ?>assets/backend/js/respond.min.js"></script>
		<![endif]-->
	</head>
		<body class="no-skin">