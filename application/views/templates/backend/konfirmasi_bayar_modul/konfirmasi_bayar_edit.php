<div class="page-header">
<h1>
	<?php echo $judul_panel;?> <?php echo $data->kd_pemesanan;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('konfirmasi_bayar/konfirmasi_bayar_update'); ?>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Status</label>

			<div class="col-sm-9">
				<input type="hidden" name="id_pembayaran" value="<?php echo $data->id_pembayaran?>" required />
				<input type="hidden" name="id_pemesanan" value="<?php echo $data->id_pemesanan?>" required />
				<input type="hidden" name="uid" value="<?php echo $data->id_user?>" required />
				<div class="col-sm-6">
				<select class="form-control" id="form-field-select-1" name="status">
					<option value="">-- Status --</option>
					<option value="pending" <?php echo $data->status_approval=='pending'?'selected':''; ?>>Menunggu verifikasi</option>
					<option value="approved" <?php echo $data->status_approval=='approved'?'selected':''; ?>>Disetujui</option>
				</select>
				</div>
			</div>
		</div>
		<div class="clearfix form-actions">
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