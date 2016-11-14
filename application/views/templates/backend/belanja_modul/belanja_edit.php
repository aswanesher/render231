<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('belanja/belanja_update'); ?>" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_produk</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_produk" placeholder="id_produk" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">author</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="author" placeholder="author" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">kode_produk</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="kode_produk" placeholder="kode_produk" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">nama_produk</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nama_produk" placeholder="nama_produk" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">kategori</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="kategori" placeholder="kategori" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">subkategori</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="subkategori" placeholder="subkategori" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">keterangan</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="keterangan" placeholder="keterangan" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">deskripsi</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="deskripsi" placeholder="deskripsi" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">bestseller</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="bestseller" placeholder="bestseller" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">featured</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="featured" placeholder="featured" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">meta_title</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="meta_title" placeholder="meta_title" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">meta_keywords</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="meta_keywords" placeholder="meta_keywords" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">meta_desc</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="meta_desc" placeholder="meta_desc" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">seo_url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="seo_url" placeholder="seo_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">gambar_produk</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="gambar_produk" placeholder="gambar_produk" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">thumb</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="thumb" placeholder="thumb" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">status</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="status" placeholder="status" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id_label</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="id_label" placeholder="id_label" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">created_at</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="created_at" placeholder="created_at" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">modified_at</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="modified_at" placeholder="modified_at" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('belanja'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>