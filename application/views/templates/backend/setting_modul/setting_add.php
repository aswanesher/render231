<div class="page-header">
    <h1>
            <?php echo $judul_panel;?>
    </h1>
    </div><!-- /.page-header -->
    <?php 
    foreach ($setting as $val) {?>
    <?php 
    if(!empty($val->id)) {
            $pros="setting/setting_update";
    } else {
            $pros="setting/setting_save";
    }
    ?>

    <?php
        
    if (!empty($this->session->flashdata('error'))) {
        echo "<div class='alert alert-danger'>";
        echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
        </button>';
        echo "<b>".$this->session->flashdata('error')."</b>";
        echo "</div>";
    }

    if (!empty($this->session->flashdata('success'))) {
        echo "<div class='alert alert-success'>";
        echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
        </button>';
        echo "<b>".$this->session->flashdata('success')."</b>";
        echo "</div>";
    }
    ?>
    
    <div class="row">
    <form class="form-horizontal" role="form" action="<?php echo $pros;?>" method="post" enctype="multipart/form-data">
            <div class="col-sm-12">
                    <div class="widget-box">
                            <div class="widget-header">
                                    <h4 class="smaller">Umum</h4>
                            </div>

                            <div class="widget-body">
                                    <div class="widget-main">
                                            <input type="hidden" name="id" value="<?php echo $val->id;?>" required />
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Judul</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" value="<?php echo $val->website_title;;?>" name="website_title" placeholder="Judul" class="col-xs-10 col-sm-5" required />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Deskripsi website</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="website_desc" value="<?php echo $val->website_desc;?>" placeholder="deskripsi website" class="col-xs-10 col-sm-5" required />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">logo</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" readonly="readonly" onclick="openKCFinder(this)" name="logo" placeholder="logo" value="<?php echo $val->logo;?>" class="col-xs-10 col-sm-5"/>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">favicon</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" readonly="readonly" onclick="openKCFinder(this)" name="favicon" placeholder="favicon" value="<?php echo $val->favicon;?>" class="col-xs-10 col-sm-5"/>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>
            <div class="col-sm-12">
                    <div class="widget-box">
                            <div class="widget-header">
                                    <h4 class="smaller">Kontak Perusahaan</h4>
                            </div>

                            <div class="widget-body">
                                    <div class="widget-main">
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Nama perusahaan</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="company_name" value="<?php echo $val->company_name;?>" placeholder="Nama perusahaan" class="col-xs-10 col-sm-5"/>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Alamat</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="contact_address" placeholder="Alamat" value="<?php echo $val->contact_address;?>" class="col-xs-10 col-sm-5"/>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Email</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="contact_email" value="<?php echo $val->contact_email;?>" placeholder="Email" class="col-xs-10 col-sm-5" required />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Telepon</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="contact_phone" value="<?php echo $val->contact_phone;?>" placeholder="Telepon" class="col-xs-10 col-sm-5" required />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Fax</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="contact_fax" value="<?php echo $val->contact_fax;?>" placeholder="Fax" class="col-xs-10 col-sm-5"/>
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">No. HP</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="contact_cellphone" placeholder="No. HP" class="col-xs-10 col-sm-5" value="<?php echo $val->contact_cellphone;?>"/>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>	
            <div class="col-sm-12">
                    <div class="widget-box">
                            <div class="widget-header">
                                    <h4 class="smaller">SEO</h4>
                            </div>

                            <div class="widget-body">
                                    <div class="widget-main">
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Judul meta</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="meta_title" placeholder="Judul meta" class="col-xs-10 col-sm-5" value="<?php echo $val->meta_title;?>" required />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Pembuat meta</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="meta_author" value="<?php echo $val->meta_author;?>" placeholder="Pembuat meta" class="col-xs-10 col-sm-5" required />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Deskripsi meta</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="meta_desc" value="<?php echo $val->meta_desc;?>" placeholder="Deskripsi meta" class="col-xs-10 col-sm-5" required />
                                                    </div>
                                            </div>
                                            <div class="form-group">
                                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Kata kunci</label>

                                                    <div class="col-sm-9">
                                                            <input type="text" id="form-field-1-1" name="meta_keywords" value="<?php echo $val->meta_keywords;?>" placeholder="Kata kunci" class="col-xs-10 col-sm-5" required />
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>	
            <div class="col-sm-12">
                    <div class="widget-box">
                            <div class="widget-header">
                                    <h4 class="smaller">Social Media</h4>
                            </div>

                            <div class="widget-body">
                                    <div class="widget-main">
                                            <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Facebook</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" value="<?php echo $val->sosmed_fb;?>" name="sosmed_fb" placeholder="example : https://www.facebook.com/username/" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                            <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Token Facebook</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" value="<?php echo $val->token_fb;?>" name="token_fb" placeholder="Token Facebook" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Twitter</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="sosmed_twitter" value="<?php echo $val->sosmed_twitter;?>" placeholder="example : https://www.twitter.com/username/" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Token Twitter</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="token_twitter" value="<?php echo $val->token_twitter;?>" placeholder="Token Twitter" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Google plus</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="sosmed_gplus" value="<?php echo $val->sosmed_gplus;?>" placeholder="Google plus" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Linkedin</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" value="<?php echo $val->sosmed_linkedin;?>" name="sosmed_linkedin" placeholder="Linkedin" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Instagram</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="sosmed_instagram" value="<?php echo $val->sosmed_instagram;?>" placeholder="example : https://www.instagram.com/username/" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Token Instagram</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="token_instagram" value="<?php echo $val->token_instagram;?>" placeholder="Token Instagram" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">BBM</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="bbm_pin" value="<?php echo $val->bbm_pin;?>" placeholder="bbm" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Whatspp</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="whatsapp_no" value="<?php echo $val->whatsapp_no;?>" placeholder="Whatsapp" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Telegram</label>

                                            <div class="col-sm-9">
                                                    <input type="text" id="form-field-1-1" name="telegram_no" value="<?php echo $val->telegram_no;?>" placeholder="Telegram" class="col-xs-10 col-sm-5"/>
                                            </div>
                                    </div>
                                    </div>
                            </div>
                    </div>
            </div>
            <div class="col-sm-12">
                    <div class="widget-box">
                            <div class="widget-header">
                                    <h4 class="smaller">Iframe</h4>
                            </div>
                            <div class="widget-body">
                                    <div class="widget-main">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Google Analytic </label>

										<div class="col-sm-9">
                                                                                    <textarea id="form-field-2" placeholder="Google Analytic" class="col-xs-10 col-sm-5" name="g_analytic"><?php echo $val->google_analytics; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Facebook pixel </label>

										<div class="col-sm-9">
											<textarea id="form-field-2" placeholder="Facebook Pixel" class="col-xs-10 col-sm-5" name="f_analytic"><?php echo $val->facebook_pixel; ?></textarea>
										</div>
									</div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Google Map Iframe </label>

                                        <div class="col-sm-9">
                                            <textarea id="form-field-2" placeholder="Google Map Iframe" class="col-xs-10 col-sm-5" name="map_iframe"><?php echo $val->gmap_iframe; ?></textarea>
                                        </div>
                                    </div>
                                    </div>
                            </div>
                    </div>
            </div>
    <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
                    <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="submit">
                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                            Simpan
                                    </button>

                                    &nbsp; &nbsp; &nbsp;
                                    <a class="btn" href="<?php echo base_url('setting'); ?>">
                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                            Batal
                                    </a>
                            </div>
                    </div>
            </form>
    </div><!-- /.col -->
    <?php } ?>
