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
								<form class="form-horizontal" role="form" action="<?php echo base_url('user/simpan_user'); ?>" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Grup Akun </label>

										<div class="col-sm-2">
											<select class="form-control" name="grup" id="form-field-select-1" class="col-xs-10 col-sm-5" required>
												<option value="">-- Pilih grup --</option>
												<?php foreach ($user_type as $data) {
													echo '<option value="'.$data->id.'">'.$data->type.'</option>';
												}?>
											</select>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Posisi/Jabatan </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1-1" name="posisi" placeholder="Posisi/Jabatan" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Nama Lengkap </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1-1" name="nama_lengkap" placeholder="Nama Lengkap" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Username </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="username" placeholder="Username" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Email </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="email" placeholder="Email" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Password </label>

										<div class="col-sm-9">
											<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" name="password" required />
										</div>
									</div>

									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Alamat </label>

										<div class="col-sm-9">
											<textarea id="form-field-2" placeholder="Alamat" class="col-xs-10 col-sm-5" name="alamat"></textarea>
										</div>
									</div>

									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Telepon </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="telepon" class="col-xs-10 col-sm-5" name="telepon"/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Handphone </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="Handphone" class="col-xs-10 col-sm-5" name="hp"/>
										</div>
									</div>


									<div class="space-4"></div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Facebook </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://fb.com/namaanda" class="col-xs-10 col-sm-5" name="facebook" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Twitter </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://twitter.com/namaanda" class="col-xs-10 col-sm-5" name="twitter" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> LinkedIn </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://linkedin.com/namaanda" class="col-xs-10 col-sm-5" name="linkedin" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Instagram </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="http://instagram.com/namaanda" class="col-xs-10 col-sm-5" name="instagram" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> PIN BBM </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="Pin BBM" class="col-xs-10 col-sm-5" name="bbm" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> No. Whatsapp </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-2" placeholder="No. Whatsapp" class="col-xs-10 col-sm-5" name="whatsapp" />
										</div>
									</div>

									<!--<input type="file" id="id-input-file-2" name="foto">-->
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> Foto profil </label>
										<div class="col-xs-9">
                                                                                    <input type="text" class="col-xs-10 col-sm-5" id="foto" name="foto" readonly="readonly" onclick="openKCFinder(this)" placeholder="foto">
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
