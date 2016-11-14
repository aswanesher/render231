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
								<form class="form-horizontal" role="form" action="<?php echo base_url('user/ubah_user'); ?>" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Grup Akun </label>

										<div class="col-sm-2">
											<select class="form-control" name="grup" id="form-field-select-1" class="col-xs-10 col-sm-5" required>
												<option value="">-- Pilih grup --</option>
												<?php foreach ($user_type as $data) { ?>
													<option value="<?php echo $data->id;?>" <?php if($data->id==$grup) { echo "selected"; }?>><?php echo $data->type;?></option>
												<?php }?>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Posisi/Jabatan </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1-1" name="posisi" placeholder="Posisi/Jabatan" value="<?php echo $posisi;?>" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Nama Lengkap </label>

										<div class="col-sm-9">
											<input type="hidden" value="<?php echo $id;?>" name="iduser"/>
											<input type="text" id="form-field-1-1" name="nama_lengkap" placeholder="Nama Lengkap" value="<?php echo $nama_lengkap;?>" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Username </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="username" value="<?php echo $username;?>" readonly placeholder="Username" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Email </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="email" value="<?php echo $email;?>" readonly placeholder="Email" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Alamat </label>

										<div class="col-sm-9">
											<textarea id="form-field-2" placeholder="Alamat" class="col-xs-10 col-sm-5" name="alamat"><?php echo $alamat;?></textarea>
										</div>
									</div>

									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Telepon </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="telepon" class="col-xs-10 col-sm-5" name="telepon" value="<?php echo $phone;?>"/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Handphone </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="Handphone" class="col-xs-10 col-sm-5" name="hp" value="<?php echo $cellphone;?>"/>
										</div>
									</div>


									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Facebook </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://fb.com/namaanda" class="col-xs-10 col-sm-5" name="facebook" value="<?php echo $fb;?>" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Twitter </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://twitter.com/namaanda" class="col-xs-10 col-sm-5" name="twitter" value="<?php echo $twitter;?>" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> LinkedIn </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://linkedin.com/namaanda" class="col-xs-10 col-sm-5" name="linkedin" value="<?php echo $linkedin;?>" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Instagram </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://instagram.com/namaanda" class="col-xs-10 col-sm-5" name="instagram" value="<?php echo $instagram;?>"/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> PIN BBM </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="Pin BBM" class="col-xs-10 col-sm-5" name="bbm" value="<?php echo $bbm;?>"/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> No. Whatsapp </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="No. Whatsapp" class="col-xs-10 col-sm-5" name="whatsapp" value="<?php echo $whatsapp;?>"/>
										</div>
									</div>

									<!--<input type="file" id="id-input-file-2" name="foto">-->
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> </label>
										<div class="col-xs-4">
										<?php if($gambar=='') { ?>
											<img src="<?php echo base_url()?>/uploads/no_images.jpg">
										<?php } else { ?>
                                                                                        <img width="350" height="230" src="<?php echo $gambar;?>">
										<?php } ?>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Foto profil </label>
										<div class="col-xs-9">
                                                                                    <input type="text" class="col-xs-10 col-sm-5" value="<?php echo $gambar;?>" id="foto" name="foto" readonly="readonly" onclick="openKCFinder(this)" placeholder="foto">
										</div>
									</div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Simpan
											</button>

											&nbsp; &nbsp; &nbsp;
											<a class="btn" href="<?php echo base_url('user'); ?>">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Batal
											</a>
										</div>
									</div>
								</form>
							</div><!-- /.col -->
