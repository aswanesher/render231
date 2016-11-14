<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('ekspedisi/ekspedisi_update'); ?>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id_ekspedisi" value="<?php echo $id;?>" required />
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama Jasa Ekpedisi</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nm_ekspedisi" placeholder="Contoh jne/tiki/pos dengan huruf kecil" value="<?php echo $nm_ekspedisi;?>" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('ekspedisi'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->