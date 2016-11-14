<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('bahan/bahan_update'); ?>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Jenis bahan</label>

			<div class="col-sm-9">
				<input type="hidden" name="id_bahan" value="<?php echo $id_bahan?>" required />
				<input type="text" id="form-field-1-1" name="jenis_bahan" value="<?php echo $jenis_bahan?>" placeholder="jenis_bahan" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Harga</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="harga" placeholder="Harga" value="<?php echo $harga?>" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right"  for="form-field-1-1">Qty</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="qty" placeholder="Jumlah stok" value="<?php echo $qty?>" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('bahan'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->