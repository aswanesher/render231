<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo BASE_URL()?>permission/permission_update" method="post" enctype="multipart/form-data">
	<?php
	if (isset($error_message)) {
		echo "<div class='alert alert-danger'>";
			echo $error_message;
		echo "</div>";
	} else if (isset($success_message)) {
		echo "<div class='alert alert-success'>";
			echo $success_message;
		echo "</div>";
	}
	?>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Modul</label>

			<div class="col-sm-4">
				<input type="hidden" id="form-field-1-1" name="id" value="<?php echo $id;?>" required />
				<select class="form-control" id="form-field-select-1" name="id_module">
					<option value="">-- Modul --</option>
					<?php foreach ($modul as $m) { ?>
					<option value="<?php echo $m->module_id?>" <?php if($module_id==$m->module_id) { echo "selected"; }?>><?php echo ucfirst($m->module_title);?></option>
					<?php } ?>
				</select>
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Group User</label>

			<div class="col-sm-4">
				<select class="form-control" id="form-field-select-1" name="id_user_group">
					<option value="">-- Grup --</option>
					<?php foreach ($grup as $s) { ?>
					<option value="<?php echo $s->id?>" <?php if($user_grup==$s->id) { echo "selected"; }?>><?php echo ucfirst($s->type);?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Rekap</label>

			<div class="col-sm-4">
				<select class="form-control" id="form-field-select-1" name="is_view">
					<option value="">-- Rekap --</option>
					<option value="true" <?php if($isview=="true") { echo "selected"; }?>>True</option>
					<option value="false" <?php if($isview=="false") { echo "selected"; }?>>False</option>
				</select>
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Tambah data</label>

			<div class="col-sm-4">
				<select class="form-control" id="form-field-select-1" name="is_add">
					<option value="">-- Tambah --</option>
					<option value="true" <?php if($isadd=="true") { echo "selected"; }?>>True</option>
					<option value="false" <?php if($isadd=="false") { echo "selected"; }?>>False</option>
				</select>
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Ubah data</label>

			<div class="col-sm-4">
				<select class="form-control" id="form-field-select-1" name="is_edit">
					<option value="">-- Ubah --</option>
					<option value="true" <?php if($isedit=="true") { echo "selected"; }?>>True</option>
					<option value="false" <?php if($isedit=="false") { echo "selected"; }?>>False</option>
				</select>
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Hapus data</label>

			<div class="col-sm-4">
				<select class="form-control" id="form-field-select-1" name="is_delete">
					<option value="">-- Hapus --</option>
					<option value="true" <?php if($isdelete=="true") { echo "selected"; }?>>True</option>
					<option value="false" <?php if($isdelete=="false") { echo "selected"; }?>>False</option>
				</select>
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('permission'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->