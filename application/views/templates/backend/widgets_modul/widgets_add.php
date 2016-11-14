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
	<form class="form-horizontal" role="form" action="<?php echo base_url('widgets/widgets_save'); ?>" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Widget</label>

			<div class="col-sm-4">
                            <select class="form-control" name="nm_widget" id="nm_widget">
					<option value="">-- Widget --</option>
					<option value="post_w">Widget Artikel</option>
					<option value="page_w">Widget Halaman</option>
					<option value="slider_w">Widget Image Slider</option>
					<option value="pricing_w">Widget Pricing</option>
					<option value="product_w">Widget Produk</option>
					<option value="testimonial_w">Widget Testimonial</option>
					<option value="custom_w">Widget Teks Serbaguna</option>
					<option value="promo_w">Widget Promo</option>
					<option value="team_w">Widget Tim</option>
					<option value="runningtext_w">Widget Running Text</option>
					<option value="blog_w">Widget Blog/Artikel</option>
					<option value="bank_w">Widget Bank</option>
					<option value="delivery_w">Widget Delivery</option>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihartikel" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih artikel</label>

			<div class="col-sm-4">
				<select class="form-control" id="post_w" name="post_w">
					<option value="">-- Artikel --</option>
					<?php foreach ($post as $art) { ?>
					<option value="<?php echo $art->id_post;?>"><?php echo $art->post_title;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihpage" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih halaman</label>

			<div class="col-sm-4">
				<select class="form-control" id="page_w" name="page_w">
					<option value="">-- Halaman --</option>
					<?php foreach ($halaman as $hal) { ?>
					<option value="<?php echo $hal->id_post;?>"><?php echo $hal->post_title;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihmedia" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori media</label>

			<div class="col-sm-4">
				<select class="form-control" id="slider_w" name="slider_w">
					<option value="">-- Kategori Media --</option>
					<?php foreach ($kat_media as $kats) { ?>
					<option value="<?php echo $kats->id_media_cat;?>"><?php echo $kats->category;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihmediabank" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori media</label>

			<div class="col-sm-4">
				<select class="form-control" id="bank_w" name="bank_w">
					<option value="">-- Kategori Media --</option>
					<?php foreach ($kat_media as $kats) { ?>
					<option value="<?php echo $kats->id_media_cat;?>"><?php echo $kats->category;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihmediadelivery" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori media</label>

			<div class="col-sm-4">
				<select class="form-control" id="delivery_w" name="delivery_w">
					<option value="">-- Kategori Media --</option>
					<?php foreach ($kat_media as $kats) { ?>
					<option value="<?php echo $kats->id_media_cat;?>"><?php echo $kats->category;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihkatuser" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori user</label>

			<div class="col-sm-4">
				<select class="form-control" id="team_w" name="team_w">
					<option value="">-- Kategori User --</option>
					<?php foreach ($user_cat as $users) { ?>
					<option value="<?php echo $users->id;?>"><?php echo $users->type;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihpricing" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih artikel pricing</label>

			<div class="col-sm-4">
				<select class="form-control" id="pricing_w" name="pricing_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>"><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihrunningtext" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori runningtext</label>

			<div class="col-sm-4">
				<select class="form-control" id="runningtext_w" name="runningtext_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>"><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihblog" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori</label>

			<div class="col-sm-4">
				<select class="form-control" id="blog_w" name="blog_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>"><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihpageurl" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih halaman</label>

			<div class="col-sm-4">
				<select class="form-control" id="permalink" name="permalink">
					<option value="">-- Halaman --</option>
					<?php foreach ($halaman as $hal) { ?>
					<option value="<?php echo $hal->permalink;?>"><?php echo $hal->post_title;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="pilihpromo" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih artikel promo</label>

			<div class="col-sm-4">
				<select class="form-control" id="promo_w" name="promo_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>"><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="form-group" id="adscopy" style="display:none;">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Ads Copy/Keterangan</label>
			<div class="form-group">
				<div class="col-sm-8">
					<textarea class="ckeditor" name="konten_text_widget" id="konten_text_widget"></textarea>
				</div>
			</div>
		</div>
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url();?>widgets/">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>