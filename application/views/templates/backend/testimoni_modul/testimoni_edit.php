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
	<form class="form-horizontal" role="form" action="http://localhost/kaosnyabagus/testimoni/testimoni_update" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_testimonial</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_testimonial" placeholder="id_testimonial" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">name</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="name" placeholder="name" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">judul_id</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="judul_id" placeholder="judul_id" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">judul_en</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="judul_en" placeholder="judul_en" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">testimonial</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="testimonial" placeholder="testimonial" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">gambar</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="gambar" placeholder="gambar" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">tanggal</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="tanggal" placeholder="tanggal" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="url" placeholder="url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="../testimoni">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>