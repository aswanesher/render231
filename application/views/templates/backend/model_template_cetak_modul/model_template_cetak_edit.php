<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('model_template_cetak/model_template_cetak_update'); ?>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Model</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nama" placeholder="nama" value="<?php echo $nama_model?>" class="col-xs-10 col-sm-5" required />
				<input type="hidden" name="id_model" value="<?php echo $id_model;?>" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Template</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="gambar" placeholder="gambar" value="<?php echo $gambar_model;?>" class="col-xs-10 col-sm-5" readonly="readonly" onclick="openKCFinder(this)" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Gambar Template</label>

			<div class="col-sm-9">
				<?php if($gambar_model<>"") { ?>
					<img src="<?php echo $gambar_model?>">
				<?php } else { ?>
					<img src="<?php echo base_url()?>uploads/no_images.jpg">
				<?php } ?>
			</div>
		</div>
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('model_template_cetak'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->