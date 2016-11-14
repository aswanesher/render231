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
	<form class="form-horizontal" role="form" action="<?php echo base_url('reseller_diskon/reseller_diskon_save'); ?>" method="post" enctype="multipart/form-data">
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Label</label>

			<div class="col-sm-3">
			 <select id="id_label" name="id_label" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($data_label as $m) {
			?>
			<option value="<?php echo $m->id_label?>"><?php echo ucfirst($m->nama_label);?></option>
			 <?php } ?>
			</select>
			</div>
		</div>
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Diskon (%)</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="diskon" placeholder="diskon" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Tipe reseller</label>

			
			<div class="col-sm-3">
			 <select id="id_type_reseller" name="id_type_reseller" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($data_type_reseller as $m) {
			?>
			<option value="<?php echo $m->id_typereseller?>"><?php echo ucfirst($m->nama_type);?></option>
			 <?php } ?>
			</select>
			</div>
		</div>
            <?php /* <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_diskon</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_diskon" placeholder="id_diskon" class="col-xs-10 col-sm-5" required />
			</div>
		</div> */ ?>
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Minimal Pembelian</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="min_beli" placeholder="min_beli" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Maksimal Pembelian</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="max_beli" placeholder="max_beli" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('reseller_diskon'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>