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
								<form class="form-horizontal" role="form" action="<?php echo base_url('user_grup/ubah_user_grup'); ?>" method="post" enctype="multipart/form-data">

									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Nama Grup </label>

										<div class="col-sm-9">
											<input type="hidden" value="<?php echo $id;?>" name="idusergrup"/>
											<input type="text" id="form-field-1-1" name="nama_grup" placeholder="Nama Grup" value="<?php echo $nama_grup;?>" class="col-xs-10 col-sm-5" required />
										</div>
									</div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Simpan
											</button>

											&nbsp; &nbsp; &nbsp;
											<a class="btn" href="<?php echo base_url('user_grup'); ?>">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Batal
											</a>
										</div>
									</div>
								</form>
							</div><!-- /.col -->
