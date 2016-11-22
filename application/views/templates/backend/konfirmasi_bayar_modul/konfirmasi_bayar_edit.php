<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('konfirmasi_bayar/konfirmasi_bayar_update'); ?>" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_pembayaran</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_pembayaran" placeholder="id_pembayaran" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_user</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_user" placeholder="id_user" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">kd_pemesanan</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="kd_pemesanan" placeholder="kd_pemesanan" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_pemesanan</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_pemesanan" placeholder="id_pemesanan" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">bank</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="bank" placeholder="bank" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">nama_pemilik_rekening</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nama_pemilik_rekening" placeholder="nama_pemilik_rekening" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">jumlah_dana</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="jumlah_dana" placeholder="jumlah_dana" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">bukti_pembayaran</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="bukti_pembayaran" placeholder="bukti_pembayaran" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">tgl_pembayaran</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="tgl_pembayaran" placeholder="tgl_pembayaran" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">status_approval</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="status_approval" placeholder="status_approval" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">approve_by</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="approve_by" placeholder="approve_by" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">approve_date</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="approve_date" placeholder="approve_date" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('konfirmasi_bayar'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->