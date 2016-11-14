<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url()?>website/website_update" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama Website</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="website_title" placeholder="Nama Website" class="col-xs-10 col-sm-5" value="<?php echo $website_title;?>" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Deskripsi Website</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="website_desc" placeholder="website_desc" class="col-xs-10 col-sm-5" value="<?php echo $website_desc;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama Perusahaan</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="company_name" placeholder="company_name" class="col-xs-10 col-sm-5" value="<?php echo $company_name;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Alamat</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="contact_address" placeholder="contact_address" class="col-xs-10 col-sm-5" value="<?php echo $contact_address;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Email</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="contact_email" placeholder="contact_email" class="col-xs-10 col-sm-5" value="<?php echo $contact_email;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No Telp</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="contact_phone" placeholder="contact_phone" class="col-xs-10 col-sm-5" value="<?php echo $contact_phone;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No Fax</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="contact_fax" placeholder="contact_fax" class="col-xs-10 col-sm-5" value="<?php echo $contact_fax;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No HP</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="contact_cellphone" placeholder="contact_cellphone" class="col-xs-10 col-sm-5" value="<?php echo $contact_cellphone;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Meta Title</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="meta_title" placeholder="meta_title" class="col-xs-10 col-sm-5" value="<?php echo $meta_title;?>" required />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Meta Desc</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="meta_desc" placeholder="meta_desc" class="col-xs-10 col-sm-5" value="<?php echo $meta_desc;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Meta Keywords</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="meta_keywords" placeholder="meta_keywords" class="col-xs-10 col-sm-5" value="<?php echo $meta_keywords;?>" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Favicon</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="favicon" placeholder="favicon" class="col-xs-10 col-sm-5" value="<?php echo $favicon;?>" required />
			</div>
		</div>
		<input type="hidden" name="id"   value="<?php echo $id;?>"   />
 		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="../website">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>