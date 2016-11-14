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
	<form class="form-horizontal" role="form" action="<?php echo base_url();?>widgets/widgets_update" method="post" enctype="multipart/form-data"><div class="form-group">
			<div class="form-group">
                <input type="hidden" name="id_widget" value="<?php echo $data->id_widget; ?>">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Widget</label>

			<div class="col-sm-4">
                <select class="form-control" name="nm_widget" id="nm_widget" disabled>
					<option value="">-- Widget --</option>
                                        <option value="post_w" <?php if($data->nm_widget=="post_w"){echo 'selected';} ?>>Widget Artikel</option>
					<option value="page_w" <?php if($data->nm_widget=="page_w"){echo 'selected';} ?>>Widget Halaman</option>
					<option value="slider_w" <?php if($data->nm_widget=="slider_w"){echo 'selected';} ?>>Widget Image Slider</option>
					<option value="pricing_w" <?php if($data->nm_widget=="pricing_w"){echo 'selected';} ?>>Widget Pricing</option>
					<option value="product_w" <?php if($data->nm_widget=="product_w"){echo 'selected';} ?>>Widget Produk</option>
					<option value="testimonial_w" <?php if($data->nm_widget=="testimonial_w"){echo 'selected';} ?>>Widget Testimonial</option>
					<option value="custom_w" <?php if($data->nm_widget=="custom_w"){echo 'selected';} ?>>Widget Teks Serbaguna</option>
					<option value="promo_w" <?php if($data->nm_widget=="promo_w"){echo 'selected';} ?>>Widget Promo</option>
					<option value="team_w" <?php if($data->nm_widget=="team_w"){echo 'selected';} ?>>Widget Tim</option>
					<option value="runningtext_w" <?php if($data->nm_widget=="runningtext_w"){echo 'selected';} ?>>Widget Running Text</option>
					<option value="blog_w" <?php if($data->nm_widget=="blog_w"){echo 'selected';} ?>>Widget Blog/Artikel</option>
				</select>
			</div>
		</div>
        <div class="form-group" id="pilihartikel" <?php if($data->nm_widget!="post_w") {
        echo 'style="display:none;"';} ?> >
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih artikel</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="post_w") { echo ''; } else { ?>
				<select class="form-control" id="post_w" name="post_w">
					<option value="">-- Artikel --</option>
					<?php foreach ($post as $art) { ?>
                                        <option value="<?php echo $art->id_post;?>" <?php if($data->konten_text_id == $art->id_post){echo 'selected';} ?>><?php echo $art->post_title;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihpage" <?php if($data->nm_widget!="page_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih halaman</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="page_w") {echo '';} else { ?>
				<select class="form-control" id="page_w" name="page_w">
					<option value="">-- Halaman --</option>
					<?php foreach ($halaman as $hal) { ?>
					<option value="<?php echo $hal->id_post;?>" <?php if($data->konten_text_id == $hal->id_post){echo 'selected';} ?>><?php echo $hal->post_title;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihmedia" <?php if($data->nm_widget!="slider_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori media</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="slider_w") {echo '';} else { ?>
				<select class="form-control" id="slider_w" name="slider_w">
					<option value="">-- Kategori Media --</option>
					<?php foreach ($kat_media as $kats) { ?>
					<option value="<?php echo $kats->id_media_cat;?>" <?php if($data->konten_text_id == $kats->id_media_cat){echo 'selected';} ?>><?php echo $kats->category;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihkatuser" <?php if($data->nm_widget!="team_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori user</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="team_w") {echo '';} else { ?>
				<select class="form-control" id="team_w" name="team_w">
					<option value="">-- Kategori User --</option>
					<?php foreach ($user_cat as $users) { ?>
					<option value="<?php echo $users->id;?>" <?php if($data->konten_text_id == $users->id){echo 'selected';} ?>><?php echo $users->type;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihblog" <?php if($data->nm_widget!="blog_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="blog_w") {echo '';} else { ?>
				<select class="form-control" id="blog_w" name="blog_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>" <?php if($data->konten_text_id == $katss->post_parent){echo 'selected';} ?>><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihrunningtext" <?php if($data->nm_widget!="runningtext_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori runningtext</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="runningtext_w") {echo '';} else { ?>
				<select class="form-control" id="runningtext_w" name="runningtext_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>" <?php if($data->konten_text_id == $katss->post_parent){echo 'selected';} ?>><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihpricing" <?php if($data->nm_widget!="pricing_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih artikel pricing</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="pricing_w") {echo '';} else { ?>
				<select class="form-control" id="pricing_w" name="pricing_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>" <?php if($data->konten_text_id == $katss->post_parent){echo 'selected';} ?>><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihmediabank" <?php if($data->nm_widget!="bank_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori media</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="bank_w") {echo '';} else { ?>
				<select class="form-control" id="bank_w" name="bank_w">
					<option value="">-- Kategori Media --</option>
					<?php foreach ($kat_media as $kats) { ?>
					<option value="<?php echo $kats->id_media_cat;?>" <?php if($data->konten_text_id == $kats->id_media_cat){echo 'selected';} ?>><?php echo $kats->category;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihmediadelivery" <?php if($data->nm_widget!="delivery_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih kategori media</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="delivery_w") {echo '';} else { ?>
				<select class="form-control" id="delivery_w" name="delivery_w">
					<option value="">-- Kategori Media --</option>
					<?php foreach ($kat_media as $kats) { ?>
					<option value="<?php echo $kats->id_media_cat;?>" <?php if($data->konten_text_id == $kats->id_media_cat){echo 'selected';} ?>><?php echo $kats->category;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihpageurl" <?php if($data->nm_widget!="product_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih halaman</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="product_w") {echo '';} else { ?>
				<select class="form-control" id="permalink" name="permalink">
					<option value="">-- Halaman --</option>
					<?php foreach ($halaman as $hal) { ?>
					<option value="<?php echo $hal->permalink;?>" <?php if($data->url == $hal->permalink){echo 'selected';} ?>><?php echo $hal->post_title;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="pilihpromo" <?php if($data->nm_widget!="promo_w") {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pilih artikel promo</label>

			<div class="col-sm-4">
				<?php if($data->nm_widget!="promo_w") {echo '';} else { ?>
				<select class="form-control" id="promo_w" name="promo_w">
					<option value="">-- Kategori --</option>
					<?php foreach ($post_cat as $katss) { ?>
					<option value="<?php echo $katss->post_parent;?>" <?php if($data->konten_text_id == $katss->post_parent){echo 'selected';} ?>><?php echo $katss->category;?></option>
					<?php } ?>
				</select>
				<?php } ?>
			</div>
		</div>
		<div class="form-group" id="adscopy" <?php if(($data->nm_widget!="pricing_w") && ($data->nm_widget!="testimonial_w") && 
                        ($data->nm_widget != "custom_w") && ($data->nm_widget != "promo_w") && ($data->nm_widget != "product_w") && ($data->nm_widget != "blog_w") && ($data->nm_widget != "bank_w") && ($data->nm_widget != "delivery_w")) {
        echo 'style="display:none;"';} ?>>
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Ads Copy/Keterangan</label>
			<div class="form-group">
				<div class="col-sm-8">
                                    <textarea class="ckeditor" name="konten_text_widget" id="konten_text_widget"><?php echo $data->konten_text_widget; ?></textarea>
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
				<a class="btn" href="<?php echo base_url();?>widgets">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>