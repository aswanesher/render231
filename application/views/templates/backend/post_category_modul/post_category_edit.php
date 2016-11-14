<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->
<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('post_category/post_category_update'); ?>" method="post" enctype="multipart/form-data">
		<input type="hidden" id="form-field-1-1" name="post_parent" value="<?php echo $id;?>" placeholder="post_parent" class="col-xs-10 col-sm-5" required />
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Kategori</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="category" placeholder="category" value="<?php echo $category;?>" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('post_category'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->