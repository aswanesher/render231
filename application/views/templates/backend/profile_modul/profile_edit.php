<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="http://localhost/kaosnyabagus/profile/profile_update" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">ID</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="ID" placeholder="ID" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">name</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="name" placeholder="name" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">address</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="address" placeholder="address" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">phone</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="phone" placeholder="phone" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">cellphone</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="cellphone" placeholder="cellphone" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">user_pic</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="user_pic" placeholder="user_pic" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">fb_url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="fb_url" placeholder="fb_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">twitter_url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="twitter_url" placeholder="twitter_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">linkedin_url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="linkedin_url" placeholder="linkedin_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">instagram_url</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="instagram_url" placeholder="instagram_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">bbm_pin</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="bbm_pin" placeholder="bbm_pin" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">whatsapp</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="whatsapp" placeholder="whatsapp" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('profile'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>