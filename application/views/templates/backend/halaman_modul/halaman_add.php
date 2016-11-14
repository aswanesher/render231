<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->
        <?php
        					if(isset($pesan)){
						echo '<div class="alert alert-danger">'.$pesan.'</div>';
					} ?>
<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
        <form class="form-horizontal" role="form" action="<?php echo base_url('halaman/halaman_save'); ?>" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-9">
				<div class="form-group">
					<div class="col-sm-12">
						<input type="text" id="input_title" name="post_title" placeholder="Masukkan judul disini.." class="col-xs-10 col-sm-12" required />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<textarea class="ckeditor" name="editor"></textarea>
					</div>
				</div>
				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">Pengaturan komentar</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<div class="form-group">
								<label class="inline col-sm-8 ">
									<small class="muted smaller-90">Aktifkan komentar?</small>

									<input id="id-button-borders" checked="checked" type="checkbox" class="ace ace-switch ace-switch-5" name="comment_status">
									<span class="lbl middle"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">Komentar</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main">

						</div>
					</div>
				</div>
							
			</div><!-- /.col -->

			<div class="col-sm-3">
				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">Publish</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<div class="form-group" id="date-picker">
								<label class="col-sm-3 control-label no-padding-right" for="date-picker">Publish</label>

								<div class="col-sm-9">
									<input type="text" name="post_date" placeholder="Tanggal" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" required />
								</div>	
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Status</label>

								<div class="col-sm-9">
									<select class="form-control" id="form-field-select-1" name="post_status" required>
										<option value="draft">Draft</option>
										<option value="publish">Publish</option>
									</select>
								</div>
							</div>
							<div class="form-group center">
								<div class="col-md-offset-0 col-md-12">
									<a class="btn btn-sm btn-danger" href="<?php echo base_url('halaman'); ?>">
										<i class="ace-icon fa fa-undo bigger-110"></i>
										Batal
									</a>
									<button class="btn btn-sm btn-info" type="submit">
										<i class="ace-icon fa fa-check bigger-110"></i>
										Simpan
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">Tipe template</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<div class="form-group">
								<div class="col-sm-12">
									<select class="form-control" id="form-field-select-1" name="template" required>
									<option value="">Pilih template</option>
									<option value="index">Homepage</option>
									<option value="fullwidth">Fullwidth</option>
									<option value="about_page">About</option>
									<option value="page_left_sidebar">Page Left Sidebar</option>
									<option value="page_right_sidebar">Page Right Sidebar</option>
									<option value="product_left_sidebar">Product Left Sidebar</option>
									<option value="product_right_sidebar">Product Right Sidebar</option>
									<option value="product_fullwidth">Product Fullwidth</option>
									<option value="contact_left_sidebar">Contact Left Sidebar</option>
									<option value="contact_right_sidebar">Contact Right Sidebar</option>
									<option value="contact_fullwidth">Contact Fullwidth</option>
									<option value="pricing">Pricing Page</option>
									<option value="testimonial">Testimonial Page</option>
									<option value="team">Team Page</option>
									<option value="datatable">Datatable</option>
									<option value="blog">Blog</option>
									<option value="register">Register</option>
									<option value="login">Login</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="widget-box">
					<div class="widget-header">
						<h4 class="smaller">Gambar Post</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<div class="form-group">

								<div class="col-sm-12">
									<input type="text" id="form-field-1-1" name="post_image" placeholder="Klik untuk upload gambar.." class="col-xs-10 col-sm-12" readonly="readonly" onclick="openKCFinder(this)" required />
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div><!-- /.col -->
		</div>
	</form>
</div><!-- /.col -->