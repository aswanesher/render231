<div id="navbar" class="navbar navbar-default">
	<script type="text/javascript">
		try{ace.settings.check('navbar' , 'fixed')}catch(e){}
	</script>

	<div class="navbar-container" id="navbar-container">
		<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
			<span class="sr-only">Toggle sidebar</span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>

			<span class="icon-bar"></span>
		</button>

		<div class="navbar-header pull-left">
			<a href="dashboard" class="navbar-brand">
				<small>
				<?php
                $va = $this->session->userdata('logged_in'); echo $company 
                ?> Admin
				</small>
			</a>
		</div>

		<div class="navbar-buttons navbar-header pull-right" role="navigation">
			<ul class="nav ace-nav">
				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<?php 
						$dt=$this->session->userdata('logged_in');
                        $getdtfoto = $this->db->query("select user_pic from kb_user_detail where ID='".$dt['id']."'");
                        $foto = $getdtfoto->row();
						?>
						<img class="nav-user-photo" src="<?php echo $foto->user_pic; ?>" alt="<?php echo $va['name']; ?>" />
						<span class="user-info">
							<small>Selamat Datang,</small>
							<?php echo $va['name']; ?>
						</span>

						<i class="ace-icon fa fa-caret-down"></i>
					</a>


					<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
						<li>
							<a href="<?php echo base_url()?>setting">
								<i class="ace-icon fa fa-wrench"></i>
								Settings
							</a>
						</li>

						<li>
							<a href="<?php echo base_url()?>profile">
								<i class="ace-icon fa fa-user"></i>
								Profile
							</a>
						</li>

						<li>
							<a href="<?php echo base_url()?>generator/panel">
								<i class="ace-icon fa fa-gear"></i>
								Code Builder
							</a>
						</li>

						<li class="divider"></li>

						<li>
							<a href="<?php echo base_url();?>backend_panel/logout">
								<i class="ace-icon fa fa-power-off"></i>
								Logout
							</a>
						</li>
					</ul>
			</ul>
		</div>
	</div><!-- /.navbar-container -->
</div>