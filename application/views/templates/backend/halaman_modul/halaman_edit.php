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
        <form class="form-horizontal" role="form" action="<?php echo base_url('halaman/halaman_update'); ?>" method="post" enctype="multipart/form-data">
		<div class="row">
			<div class="col-sm-9">
				<div class="form-group">
					<div class="col-sm-12">
						<input type="hidden" name="id_post" value="<?php echo $id;?>" required />
						<input type="text" id="input_title" name="post_title" placeholder="Masukkan judul disini.." class="col-xs-10 col-sm-12" value="<?php echo $post_title;?>" required />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-12">
						<textarea class="ckeditor" name="editor"><?php echo $post_content;?></textarea>
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

									<input id="id-button-borders" <?php if($comment_status=='on') { echo 'checked="checked"'; } else if($comment_status=='') { echo 'checked=""'; } ?> type="checkbox" class="ace ace-switch ace-switch-5" name="comment_status">
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
									<input type="text" name="post_date" value="<?php $date=explode(" ", $post_date); echo $date[0];?>" placeholder="Tanggal" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" required />
								</div>	
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Status</label>

								<div class="col-sm-9">
									<select class="form-control" id="form-field-select-1" name="post_status" required>
										<option value="draft" <?php if($post_status=='draft') { echo 'selected'; }?>>Draft</option>
										<option value="publish" <?php if($post_status=='publish') { echo 'selected'; }?>>Publish</option>
									</select>
								</div>
                                                                <input type="hidden" name="link" value="<?php echo $link; ?>">
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
						<h4 class="smaller">Kategori</h4>
					</div>

					<div class="widget-body">
						<div class="widget-main">
							<div class="form-group">
								<div class="col-sm-12">
									<select class="form-control" id="form-field-select-1" name="template" required>

									<option value="">Pilih template</option>
									<option value="index" <?php if($template=="index") { echo "selected"; } ?>>Homepage</option>
									<option value="fullwidth" <?php if($template=="fullwidth") { echo "selected"; } ?>>Fullwidth</option>
									<option value="about_page" <?php if($template=="about_page") { echo "selected"; } ?>>About</option>
									<option value="page_left_sidebar" <?php if($template=="page_left_sidebar") { echo "selected"; } ?>>Page Left Sidebar</option>
									<option value="page_right_sidebar" <?php if($template=="page_right_sidebar") { echo "selected"; } ?>>Page Right Sidebar</option>
									<option value="product_left_sidebar" <?php if($template=="product_left_sidebar") { echo "selected"; } ?>>Product Left Sidebar</option>
									<option value="product_right_sidebar" <?php if($template=="product_right_sidebar") { echo "selected"; } ?>>Product Right Sidebar</option>
									<option value="product_fullwidth" <?php if($template=="product_fullwidth") { echo "selected"; } ?>>Product Right Sidebar</option>
									<option value="contact_left_sidebar" <?php if($template=="contact_left_sidebar") { echo "selected"; } ?>>Contact Left Sidebar</option>
									<option value="contact_right_sidebar" <?php if($template=="contact_right_sidebar") { echo "selected"; } ?>>Contact Right Sidebar</option>
									<option value="contact_fullwidth" <?php if($template=="contact_fullwidth") { echo "selected"; } ?>>Contact Fullwidth</option>
									<option value="pricing" <?php if($template=="pricing") { echo "selected"; } ?>>Pricing Page</option>
									<option value="testimonial" <?php if($template=="testimonial") { echo "selected"; } ?>>Testimonial Page</option>
									<option value="team" <?php if($template=="team") { echo "selected"; } ?>>Team Page</option>
									<option value="datatable" <?php if($template=="datatable") { echo "selected"; } ?>>Datatable</option>
									<option value="blog" <?php if($template=="blog") { echo "selected"; } ?>>Blog</option>
									<option value="register" <?php if($template=="register") { echo "selected"; } ?>>Register</option>
									<option value="login" <?php if($template=="login") { echo "selected"; } ?>>Login</option>
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
									<input type="text" id="form-field-1-1" value="<?php echo $post_image;?>" name="post_image" placeholder="Klik untuk upload gambar.." class="col-xs-10 col-sm-12" readonly="readonly" onclick="openKCFinder(this)" required />
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div><!-- /.col -->
		</div>
	</form>
</div><!-- /.col -->
</div>