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
	<form class="form-horizontal" role="form" action="<?php echo base_url('profile/profile_update'); ?>" method="post" enctype="multipart/form-data"><div class="form-group">

			<div class="col-sm-9">
                            <input type="hidden" value="<?php echo $profile->ID; ?>" id="form-field-1-1" name="ID" placeholder="ID" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->name; ?>" id="form-field-1-1" name="name" placeholder="name" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Alamat</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->address; ?>" id="form-field-1-1" name="address" placeholder="address" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Telepon</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->phone; ?>" id="form-field-1-1" name="phone" placeholder="phone" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Handphone</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->cellphone; ?>" id="form-field-1-1" name="cellphone" placeholder="cellphone" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Foto Profil</label>

			<div class="col-sm-9">
				<input type="text" readonly="readonly" onclick="openKCFinder(this)" value="<?php echo $profile->user_pic; ?>" id="form-field-1-1" name="user_pic" placeholder="user_pic" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">FB Url</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->fb_url; ?>" id="form-field-1-1" name="fb_url" placeholder="fb_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Twitter Url</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->twitter_url; ?>" id="form-field-1-1" name="twitter_url" placeholder="twitter_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Linkedin Url</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->linkedin_url; ?>" id="form-field-1-1" name="linkedin_url" placeholder="linkedin_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Instagram Url</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->instagram_url; ?>" id="form-field-1-1" name="instagram_url" placeholder="instagram_url" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pin BBM</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->bbm_pin; ?>" id="form-field-1-1" name="bbm_pin" placeholder="bbm_pin" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Whatsapp</label>

			<div class="col-sm-9">
				<input type="text" value="<?php echo $profile->whatsapp; ?>" id="form-field-1-1" name="whatsapp" placeholder="whatsapp" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
            
                    <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Kata Sandi</label>

			<div class="col-sm-9">
				<input type="password" id="form-field-1-1" name="password" placeholder="Kata Sandi" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
                                    <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Konfirmasi Kata Sandi</label>

			<div class="col-sm-9">
				<input type="password" id="form-field-1-1" name="cpassword" placeholder="Konfirmasi Kata Sandi" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
            <div class="clearfix form-actions">
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