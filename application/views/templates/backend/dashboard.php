<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
        global $template;
?>
<?php
$this->load->view('templates/backend/header');
//echo $this->lang->line('test');
?>


		<?php
		$this->load->view('templates/backend/top_navbar');
		?>


		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<?php
				$this->load->view('templates/backend/side_nav');
				?>

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="dashboard">Home</a>
							</li>
							<li class="active"><?php echo $judul_panel;?></li>
						</ul><!-- /.breadcrumb -->
					</div>

					<div class="page-content">
					<?php
					$this->load->view($view);
					?>
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
			</div>
<?php
$this->load->view('templates/backend/footer');
?>
