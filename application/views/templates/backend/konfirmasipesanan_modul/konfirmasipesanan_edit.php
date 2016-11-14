<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->
				<?php
					if(isset($pesan)){
						echo '<div class="alert alert-info">'.$pesan.'</div>';
					}
				?>
<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="http://localhost/kaosnyabagus/konfirmasipesanan/konfirmasipesanan_update" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No Faktur</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $isi->no_faktur; ?>" disabled="disabled" id="form-field-1-1" name="no_faktur_" placeholder="no_faktur" class="col-xs-10 col-sm-5" required />
                                <input type="hidden" id="form-field-1-1" name="no_faktur" value="<?php echo $isi->no_faktur; ?>" />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Id Reseller</label>

			<div class="col-sm-9">
                            <input type="text" value="<?php echo $isi->id_reseller; ?>" disabled="disabled" id="form-field-1-1" name="id_reseller" placeholder="id_reseller" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Tanggal</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $isi->tanggal; ?>" disabled="disabled" id="form-field-1-1" name="tanggal" placeholder="tanggal" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Total Belanja</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $isi->total_belanja; ?>" disabled="disabled" id="form-field-1-1" name="total_belanja" placeholder="total_belanja" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Konfirmasi</label>

			<div class="col-sm-3">
			 <select id="konfirmasi" name="konfirmasi" class="form-control" required>
			 <option value="">Please Select</option>
                         <option value="0">Tidak</option>
                         <option value="1">Ya</option>
			</select>
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