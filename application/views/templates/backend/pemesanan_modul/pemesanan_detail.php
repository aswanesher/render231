<div class="page-header">
<h1>
	<?php echo $judul_panel;?> <?php echo $datanya->kd_pemesanan;?> 
	<a class="btn btn-danger pull-right" href="<?php echo base_url();?>pemesanan">
		<i class="ace-icon fa fa-angle-left"></i> Kembali
	</a>
	&nbsp;
	<?php if(($datanya->id_operator==''||$datanya->id_operator=='0')&&($grup_user=='4')&&($datanya->status_bayar=='paid')) { ?>
	<a class="btn btn-primary pull-right" href="<?php echo base_url();?>pemesanan/ambilpesanan/<?php echo $datanya->id_tampung_pemesanan;?>">
		<i class="ace-icon fa fa-gear"></i> Ambil Pesanan
	</a>
	<?php } ?>
	<?php if($datanya->id_operator==$uid&&$grup_user=='4'&&$datanya->status_pengerjaan=='onprocess') { ?>
	<a class="btn btn-primary pull-right" href="<?php echo base_url();?>pemesanan/batalkanpesanan/<?php echo $datanya->id_tampung_pemesanan;?>">
		<i class="ace-icon fa fa-close"></i> Batalkan pesanan
	</a>
	<a class="btn btn-success pull-right" href="<?php echo base_url();?>pemesanan/selesaipesanan/<?php echo $datanya->id_tampung_pemesanan;?>">
		<i class="ace-icon fa fa-flag"></i> Pesanan selesai
	</a>
	<?php } ?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<div class="profile-user-info profile-user-info-striped">

		<div class="profile-info-row">
			<div class="profile-info-name"> Tanggal Pesan </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="about"><?php echo date("j F, Y",strtotime($datanya->tgl_pesan))?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Jasa desain? </div>

			<div class="profile-info-value">
				<?php if($datanya->jasa_desain=='Y') {?>
				<span class="btn btn-success btn-xs">Ya</span>
				<?php } else { ?>
				<span class="btn btn-danger btn-xs">Tidak</span>
				<?php } ?>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Pemesan </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="country"><?php echo $datanya->name;?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Produk </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="age"><?php echo $datanya->jenis;?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Kode Bahan </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="signup"><?php echo $datanya->jenis_bahan;?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Jumlah </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="about"><?php echo $datanya->jumlah;?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Panjang </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="about"><?php echo $datanya->panjang;?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Lebar </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="about"><?php echo $datanya->lebar;?></span>
			</div>
		</div>

		<?php if ($datanya->jasa_desain=='Y') { ?>
		<div class="profile-info-row">
			<div class="profile-info-name"> Model </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="login"><?php echo $datanya->nama;?></span><br>
				<img src="<?php echo $datanya->gambar_model;?>">
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Judul </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="about"><?php echo $datanya->judul;?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Isi </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="about"><?php echo $datanya->isi;?></span>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Gambar 1 </div>

			<div class="profile-info-value">
				<a href="<?php echo base_url().$datanya->gambar1;?>" target="_blank"> Download</a>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Gambar 2 </div>

			<div class="profile-info-value">
				<a href="<?php echo base_url().$datanya->gambar2;?>" target="_blank"> Download</a>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Gambar 3 </div>

			<div class="profile-info-value">
				<a href="<?php echo base_url().$datanya->gambar3;?>" target="_blank"> Download</a>
			</div>
		</div>
		<?php } else { ?>
		<div class="profile-info-row">
			<div class="profile-info-name"> File </div>

			<div class="profile-info-value">
				<a href="<?php echo base_url().$datanya->file;?>" target="_blank"> Download file </a>
			</div>
		</div>

		<div class="profile-info-row">
			<div class="profile-info-name"> Keterangan </div>

			<div class="profile-info-value">
				<span class="editable editable-click" id="about"><?php echo $datanya->keterangan;?></span>
			</div>
		</div>
		<?php } ?>
	</div>
</div><!-- /.col -->