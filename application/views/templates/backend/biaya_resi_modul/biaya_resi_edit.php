<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('biaya_resi/biaya_resi_update'); ?>" method="post" enctype="multipart/form-data">
		<input type="hidden" value="<?php echo $id_resi?>" name="id_resi" required />
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama Penerima</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nama" value="<?php echo $nama?>" placeholder="Nama Penerima" class="col-xs-10 col-sm-5" required readonly/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Jasa Ekspedisi</label>

			<div class="col-sm-2">
				<select class="form-control" id="form-field-select-1" name="jasa_ekspedisi" readonly>
					<option value="">-- Jasa Ekspedisi --</option>
					<?php foreach ($ekspedisi as $data) { ?>
						<option value="<?php echo $data->id_ekspedisi;?>" <?php if($data->id_ekspedisi==$jasa_ekspedisi) { echo 'selected'; } ?>><?php echo ucfirst($data->nm_ekspedisi); ?></option>
					<?php }?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Merk Produk</label>

			<div class="col-sm-2">
				<select class="form-control" id="form-field-select-1" name="merk" readonly>
					<option value="">-- Merk Produk --</option>
					<?php foreach ($merk as $datas) { ?>
						<option value="<?php echo $datas->id_merk;?>" <?php if($datas->id_merk==$kategori_produk) { echo 'selected'; } ?>><?php echo ucfirst($datas->merk); ?></option>
					<?php }?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No. Resi</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="no_resi" value="<?php echo $no_resi?>" placeholder="No. Resi" class="col-xs-10 col-sm-5" required readonly />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Ukuran</label>

			<div class="col-sm-6">
				<input type="text" id="form-field-1-1" name="ukuran" value="<?php echo $ukuran?>" placeholder="Status" class="col-xs-10 col-sm-5" required readonly />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Ongkir (Rp.)</label>

			<div class="col-sm-6">
				<input type="text" id="cal" name="ongkir" value="<?php echo $ongkir?>" placeholder="Ongkos Kirim" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Dibayar (Rp.)</label>

			<div class="col-sm-6">
				<input type="text" id="cal2" name="jml_transfer" value="<?php echo $ditransfer?>" placeholder="Dibayar" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Sisa/Selisih (Rp.)</label>

			<div class="col-sm-6">
				<input type="text" id="sum1" name="selisih" value="<?php echo $selisih?>" placeholder="Selisih" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="form-group" id="date-picker">
			<label class="col-sm-3 control-label no-padding-right" for="date-picker">Tanggal</label>

			<div class="col-sm-2">
				<input type="text" name="post_date" placeholder="Tanggal" value="<?php echo $tanggal?>" class="form-control" data-date-format="yyyy-mm-dd" readonly data-provide="datepicker" required />
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