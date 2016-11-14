<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('laporan_resi/laporan_resi_save'); ?>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama Penerima</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nama" placeholder="Nama Penerima" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Jasa Ekspedisi</label>

			<div class="col-sm-2">
				<select class="form-control" id="form-field-select-1" name="jasa_ekspedisi">
					<option value="">-- Jasa Ekspedisi --</option>
					<?php foreach ($ekspedisi as $data) { ?>
						<option value="<?php echo $data->id_ekspedisi;?>"><?php echo ucfirst($data->nm_ekspedisi); ?></option>
					<?php }?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Status</label>

			<div class="col-sm-6">
				<input type="text" id="form-field-1-1" name="status" placeholder="Status" class="col-xs-10 col-sm-5" required /> &nbsp;&nbsp;&nbsp;(Apabila belum bisa cek resi otomatis)
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No. Resi</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="no_resi" placeholder="No. Resi" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group" id="date-picker">
			<label class="col-sm-3 control-label no-padding-right" for="date-picker">Tanggal</label>

			<div class="col-sm-2">
				<input type="text" name="post_date" placeholder="Tanggal" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" required />
			</div>	
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Alamat</label>

			<div class="col-sm-9">
				<textarea id="form-field-1-1" name="alamat" placeholder="Alamat" class="col-xs-10 col-sm-5" /></textarea>
			</div>
		</div>
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('biaya_resi'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->