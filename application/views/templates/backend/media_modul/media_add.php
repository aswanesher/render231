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
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('media/media_save'); ?>" method="post" enctype="multipart/form-data">
                <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">nama</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="nama" placeholder="nama" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">jenis</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="jenis" placeholder="jenis" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">keterangan</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="keterangan" placeholder="keterangan" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">gambar</label>

			<div class="col-sm-9">
                            <input type="text" id="form-field-1-1" name="gambar" readonly="readonly" onclick="openKCFinder(this)" placeholder="gambar" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">kategori</label>

			<div class="col-sm-3">
			 <select id="kategori" name="kategori" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($media_kat as $m) {
			?>
			<option value="<?php echo $m->id_media_cat?>"><?php echo ucfirst($m->category);?></option>
			 <?php } ?>
			</select>
			
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="url" placeholder="url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('media'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>