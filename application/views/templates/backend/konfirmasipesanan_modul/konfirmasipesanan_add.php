<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="konfirmasipesanan_save" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">no_faktur</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="no_faktur" placeholder="no_faktur" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_reseller</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_reseller" placeholder="id_reseller" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">tanggal</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="tanggal" placeholder="tanggal" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">total_belanja</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="total_belanja" placeholder="total_belanja" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_admin</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_admin" placeholder="id_admin" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('konfirmasipesanan'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>