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
	<form class="form-horizontal" role="form" action="<?php echo base_url('testimonial/testimonial_save'); ?>" method="post" enctype="multipart/form-data"><div class="form-group">

		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="name" placeholder="nama" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Email</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="email" placeholder="Email" class="col-xs-10 col-sm-5"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Kota</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="kota" placeholder="kota" class="col-xs-10 col-sm-5" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">judul</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="judul_id" placeholder="judul" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Testimonial</label>

			<div class="col-sm-9">
				<textarea style="height:120px" id="form-field-1-1" name="testimonial" placeholder="testimonial" class="col-xs-10 col-sm-5" required ></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">gambar</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="gambar" placeholder="Gambar.." class="col-xs-10 col-sm-5" readonly="readonly" onclick="openKCFinder(this)"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="url" placeholder="url" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
                		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Tampilkan</label>

			<div class="col-sm-4">
                            <select class="form-control" name="showing" id="form-field-select-1" class="col-xs-10 col-sm-5" required>
                                <option value="">Pilih</option>
                                <option value="true">Tampilkan</option>
                                <option value="false">Jangan Tampilkan</option>
                            </select>
			</div>
		</div>
                <div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('testimonial'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>