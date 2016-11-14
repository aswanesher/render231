						<div class="page-header">
							<h1>
								<?php echo $judul_panel;?>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<form class="form-horizontal" role="form" action="simpan_menu_grup" method="post" enctype="multipart/form-data">

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Nama Grup Menu </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1-1" name="nama_grup" placeholder="Nama Grup" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Simpan
											</button>

											&nbsp; &nbsp; &nbsp;
											<a class="btn" href="<?php echo base_url('menu_grup'); ?>">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Batal
											</a>
										</div>
									</div>
								</form>
							</div><!-- /.col -->
							</div>
