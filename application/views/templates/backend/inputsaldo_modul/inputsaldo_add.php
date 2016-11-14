<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->
				<?php
					if(isset($pesan)){
						echo '<div class="alert alert-info">'.$pesan.'</div>';
					};
				?>
<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('inputsaldo/inputsaldo_save'); ?>" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No Transfer</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="no_tf" placeholder="no_tf" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Tanggal Transfer</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" data-date-format="yyyy-mm-dd" data-provide="datepicker" name="tgl_tf" placeholder="tgl_tf" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nominal</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nominal" placeholder="nominal" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Id Reseller</label>

			<div class="col-sm-3">
			 <select id="id_reseller" name="id_reseller" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($data_reseller as $m) {
			?>
			<option value="<?php echo $m->id?>"><?php echo ucfirst($m->id)." - ";echo ucfirst($m->display_name);?></option>
			 <?php } ?>
			</select>
			</div>
		</div>
            <?php /*<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_admin</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_admin" placeholder="id_admin" class="col-xs-10 col-sm-5" required />
			</div>
		</div> */ ?>
            <div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('inputsaldo'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>