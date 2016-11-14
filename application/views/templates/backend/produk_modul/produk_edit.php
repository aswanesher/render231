<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->
        <?php
        					if(isset($pesan)){
						echo '<div class="alert alert-danger">'.$pesan.'</div>';
					} ?>
<div class="row">
<form class="form-horizontal" role="form" action="<?php echo base_url('produk/produk_update'); ?>" method="post" enctype="multipart/form-data">	
	<div class="col-sm-12">
	<div class="tabbable">
		<ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
			<li class="active">
				<a data-toggle="tab" href="#umum" aria-expanded="true">Umum</a>
			</li>

			<!--<li class="">
				<a data-toggle="tab" href="#harga" aria-expanded="false">Harga & Stok</a>
			</li>-->

			<li class="">
				<a data-toggle="tab" href="#seo" aria-expanded="false">SEO</a>
			</li>
		</ul>

		<div class="tab-content">
			<div id="umum" class="tab-pane active">
				<div class="alert alert-warning">
					<strong>Pengaturan umum.</strong>
					Kolom ini untuk memasukkan data umum mengenai produk anda.
					<br>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Kode Produk</label>

					<div class="col-sm-9">
						<input type="hidden" name="id_produk" value="<?php echo $id;?>" required />
                                                <input type="hidden" name="seo_url" value="<?php echo $seo_url;?>"/>
						<input type="text" id="form-field-1-1" name="kode_produk" placeholder="Kode Produk" class="col-xs-10 col-sm-5" value="<?php echo $kode_produk;?>" required />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama Produk</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="nama_produk" value="<?php echo $nama_produk;?>" placeholder="Nama Produk" class="col-xs-10 col-sm-5" required />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Lama Pengerjaan</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="lama_pengerjaan" value="<?php echo $lama_pengerjaan;?>" placeholder="Lama Pengerjaan" class="col-xs-10 col-sm-5" required />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Keterangan Produk</label>

					<div class="col-sm-9">
						<textarea class="ckeditor" placeholder="Keterangan" name="keterangan"><?php echo $keterangan;?></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Ads Copy</label>

					<div class="col-sm-9">
						<textarea class="ckeditor" placeholder="Ads Copy" name="deskripsi"><?php echo $deskripsi;?></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" >Best Seller</label>
					<div class="col-sm-9">
						<div class="radio">
							<label>
								<input type="radio" class="ace" name="bestseller" value="T" <?php if($bestseller=='T') { echo "checked"; }?>>
								<span class="lbl"> Ya</span>
							</label>
							<label>
								<input type="radio" class="ace" name="bestseller" value="F" <?php if($bestseller=='F') { echo "checked"; }?>>
								<span class="lbl"> Tidak</span>
							</label>
						</div>
					</div>												
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Featured</label>
					<div class="col-sm-4">
						 <div class="radio">
							<label>
								<input type="radio" class="ace" name="featured" value="T" <?php if($featured=='T') { echo 'checked'; }?>>
								<span class="lbl"> Ya</span>
							</label>
							<label>
								<input type="radio" class="ace" name="featured" value="F" <?php if($featured=='F') { echo 'checked'; }?>>
								<span class="lbl"> Tidak</span>
							</label>
						</div>
					</div>												
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Gambar Produk </label>
					<div class="col-xs-3">
						<input type="text" id="form-field-1-1" name="gambar_produk" placeholder="Klik untuk upload gambar.." class="col-xs-10 col-sm-12" readonly="readonly" value="<?php echo $gambar_produk;?>" onclick="openKCFinder(this)" required />
					</div>
				</div>	
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Status</label>
					<div class="col-sm-4">
						 <div class="radio">
							<label>
								<input type="radio" class="ace" name="status" value="publish" <?php if($status=='publish') { echo 'checked'; }?>>
								<span class="lbl"> Publish</span>
							</label>
							<label>
								<input type="radio" class="ace" name="status" value="draft" <?php if($status=='draft') { echo 'checked'; }?>>
								<span class="lbl"> Draft</span>
							</label>
						</div>
					</div>												
				</div>
				<!--<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Label </label>

					<div class="col-sm-2">
						<select class="form-control" name="id_label" id="form-field-select-1" class="col-xs-10 col-sm-5">
							<option value="">-- Pilih Label --</option>
							<?php foreach ($dtlabel as $data) { ?>
								<option value="<?php echo $data->id_label;?>" <?php if($id_label==$data->id_label) { echo 'selected'; }?>><?php echo $data->nama_label;?></option>
							<?php }?>
						</select>
					</div>
				</div>-->
			</div>

			<div id="harga" class="tab-pane">
				<div class="alert alert-warning">
					<strong>Pengaturan harga & Stok.</strong>
					Kolom ini untuk memasukkan data harga dan stok produk.
					<br>
				</div>
				<table class="table table-striped table-bordered table-hover" id="table-data-edit">
					<thead>
						<th>Harga</th>
						<th>Diskon</th>
						<th>Ukuran</th>
						<th>Berat</th>
						<th>Qty</th>
						<th>Act</th>
					</thead>
					<tbody>
						<?php foreach($detprod as $detail) { ?>
						<tr class="tr_clone">
							<td>
							<input type="hidden" name="id_detail_produk[]" value="<?php echo $detail->id_detail_produk?>">
							<input type="text" id="form-field-1-1" name="harga[]" placeholder="Contoh : 20000 (Tanpa titik)" class="col-xs-10 col-sm-12" value="<?php echo $detail->harga?>"/>
							</td>
							<td><input type="text" id="form-field-1-1" name="diskon[]" placeholder="Satuan dalam %" class="col-xs-10 col-sm-12" value="<?php echo $detail->diskon?>"/></td>
							<td><input type="text" id="form-field-1-1" name="ukuran[]" placeholder="Contoh : S/M/L" class="col-xs-10 col-sm-12" value="<?php echo $detail->ukuran?>"/></td>
							<td><input type="text" id="form-field-1-1" name="berat[]" placeholder="Contoh : 200gr" class="col-xs-10 col-sm-12" value="<?php echo $detail->berat?>"/></td>
							<td><input type="text" id="form-field-1-1" name="qty[]" placeholder="Jumlah 
							stok" class="col-xs-10 col-sm-12" value="<?php echo $detail->qty?>"/></td>
							<td>
							<input type="button" name="add" value="Tambah" id="tr_clone_adds" class="btn btn-xs btn-info">&nbsp;
							<input type="button" name="delete" value="Hapus" id="tr_clone_dels" class="btn btn-xs btn-danger" alt="<?php echo $detail->id_detail_produk?>"></td
						</tr>
						<?php } ?>
					</tbody>
				</table>
				<!--<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Harga</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="harga" placeholder="Contoh : 20000 (Tanpa titik)" class="col-xs-10 col-sm-5" value="<?php echo $harga;?>"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Diskon</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="diskon" placeholder="Satuan dalam %" class="col-xs-10 col-sm-5" value="<?php echo $diskon;?>"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Ukuran</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="ukuran" placeholder="Contoh : S/M/L" class="col-xs-10 col-sm-5" value="<?php echo $ukuran;?>"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Berat</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="berat" placeholder="Contoh : 200gr" class="col-xs-10 col-sm-5" value="<?php echo $berat;?>"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Qty</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="qty" placeholder="Jumlah stok" class="col-xs-10 col-sm-5" value="<?php echo $qty;?>"/>
					</div>
				</div>-->
			</div>

			<div id="seo" class="tab-pane">
				<div class="alert alert-warning">
					<strong>Pengaturan SEO.</strong>
					Kolom ini digunakan untuk mempermudah optimasi website mesin pencarian.
					<br>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Meta Title</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="meta_title" placeholder="Judul Meta" class="col-xs-10 col-sm-5" value="<?php echo $meta_title;?>"/>
					</div>
				</div><div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Meta Keywords</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-1-1" name="meta_keywords" placeholder="Kata Kunci Meta" class="col-xs-10 col-sm-5" value="<?php echo $meta_keywords;?>"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Meta Desc</label>

					<div class="col-sm-9">
						<textarea name="meta_desc" placeholder="Deskripsi meta" class="col-xs-5" rows="4"><?php echo $meta_desc?></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="col-xs-12">
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('produk'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</form>