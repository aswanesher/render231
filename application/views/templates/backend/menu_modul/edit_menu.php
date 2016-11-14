						<div class="page-header">
							<h1>
								<?php echo $judul_panel;?>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<form class="form-horizontal" role="form" action="../ubah_menu" method="post" enctype="multipart/form-data">

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Nama Menu </label>

										<div class="col-sm-9">
											<input type="hidden" value="<?php echo $id;?>" name="idmenu"/>
                                                                                        
											<input type="text" id="form-field-1-1" name="nama_menu" placeholder="Nama Menu" value="<?php echo $nama_menu;?>" class="col-xs-10 col-sm-5" required />
										</div>
									</div>
									<?php if($idmodul=='0') { ?>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> URL Menu </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1-1" name="url_menu" placeholder="URL Menu" value="<?php echo $url;?>" class="col-xs-10 col-sm-5" required />
										</div>
									</div>
									<?php } else { ?>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Modul </label>

										<div class="col-sm-2">
											<select class="form-control" name="modul" id="form-field-select-1" class="col-xs-10 col-sm-5">
												<option value="">-- Pilih Modul --</option>
												<?php foreach ($modul as $row) { ?>
													<option value="<?php echo $row->module_id;?>" <?php if($row->module_id==$idmodul) { echo "selected"; }?>><?php echo ucfirst($row->module_title);?></option>
												<?php }?>
											</select>
										</div>
									</div>
									<?php } ?>
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Simpan
											</button>

											&nbsp; &nbsp; &nbsp;
											<a class="btn" href="<?php echo base_url('menu'); ?>">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Batal
											</a>
										</div>
									</div>
								</form>
							</div><!-- /.col -->
