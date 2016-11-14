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
	<form class="form-horizontal" role="form" action="<?php echo base_url('produkkategori/produkkategori_update'); ?>" method="post" enctype="multipart/form-data"><div class="form-group">
			

			<div class="col-sm-9">
                            <input type="hidden" name="id_prod_category" value="<?php echo $data->id_prod_category; ?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Kategori</label>

			<div class="col-sm-9">
                            <input type="text" value="<?php echo $data->category; ?>" id="form-field-1-1" name="category" placeholder="category" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">parent</label>

			<div class="col-sm-3">
			 <select id="parent_id" name="parent_id" class="form-control" required>
			 <option value="">Please Select</option>
                         <option value="0">Tidak Ada Parent</option>
                         <?php foreach ($parent as $value) {
                           ?> <option <?php if($data->parent_id == $value->id) {echo 'selected';} ?> value="<?php echo $value->id; ?>"><?php echo $value->category; ?></option> <?php 
                         } ?>
			</select>
			
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Kategori Utama</label>

			<div class="col-sm-3">
			 <select id="is_parent" name="is_parent" class="form-control" required>
			 <option value="">Please Select</option>
                         <option value="0" <?php if($data->is_parent=="0"){ echo 'selected';} ?>>0</option>
                         <option value="1" <?php if($data->is_parent=="1"){ echo 'selected';} ?>>1</option>
			</select>
			
			</div>
		</div>
                <div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('produkkategori'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->