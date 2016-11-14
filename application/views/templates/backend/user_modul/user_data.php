<?php 
if(isset($error)) {
    print_r($error);
}
?>

						<div class="page-header">
							<h1>
								<?php echo $judul_panel;?>
								<?php if($tambah=='true') { ?>
								<a href="<?php echo base_url();?>user/add_user" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
								<?php } ?>
							</h1>
						</div><!-- /.page-header -->
        <?php
        					if(isset($pesan)){
						echo '<div class="alert alert-danger">'.$pesan.'</div>';
					} ?>
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
							<div class="col-xs-12">
								<div class="widget-box">
									<div class="widget-header widget-header-small">
										<h5 class="widget-title lighter">Pencarian</h5>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<form class="form-search" method="post" action="<?php echo base_url()?>user">
												<div class="row">
													<div class="col-xs-12 col-sm-8">
														<div class="input-group">

														<span class="input-group-addon">
														<i class="ace-icon fa fa-user"></i>
														</span>
														<input type="text" class="form-control search-query" placeholder="Cari nama.." value="<?php echo $query1;?>" name="query1">
                                                                                                                
														<span class="input-group-addon">
														<i class="ace-icon fa fa-info-circle"></i>
														</span>
														<select class="form-control" id="form-field-select-1" name="status">
															<option value="">-- Status --</option>
															<option value="0" <?php if($status=='0') { echo "selected"; }?>>Aktif</option>
															<option value="1" <?php if($status=='1') { echo "selected"; }?>>Non-Aktif</option>
														</select>

														<span class="input-group-addon">
														<i class="ace-icon fa fa-users"></i>
														</span>
														<select class="form-control" id="form-field-select-1" name="grup">
															<option value="">-- Grup --</option>
															<?php foreach ($user_type as $data) { ?>
																<option value="<?php echo $data->id;?>" <?php if($grup==$data->id) { echo "selected"; }?>><?php echo $data->type; ?></option>
															<?php }?>
														</select>

														<span class="input-group-btn">
														<button type="submit" class="btn btn-purple btn-sm">
														<span class="ace-icon fa fa-search icon-on-right bigger-110"></span> Cari
														</button>
														</span>
                                                                                                                <a href="<?php echo base_url();?>user/export" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-save bigger-200"></i> Export data</a>
														</div>
													</div>
												</div>
											</form>
                                                                                    
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row">
									<div class="col-xs-12">
										<table id="simple-table" class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">
														<label class="pos-rel">
															<input type="checkbox" class="ace" />
															<span class="lbl"></span>
														</label>
													</th>
													<th>#</th>
													<th>Nama</th>
													<th>Email</th>
													<th width="200px">Alamat</th>
													<th>Telphone/No.HP</th>
													<th>Grup</th>
                                                                                                        <th>Status</th>
													<th></th>
												</tr>
											</thead>

											<tbody>
											<?php
											$a=1;
											foreach ($user as $row) {
											?>
												<tr>
													<td class="center">
														<label class="pos-rel">
															<input type="checkbox" class="ace" />
															<span class="lbl"></span>
														</label>
													</td>

													<td><?php echo $a;?></td>
													<td><?php echo $row->name;?></td>
													<td><?php echo $row->user_email;?></td>
													<td><?php echo $row->address;?></td>
													<td><?php echo $row->phone;?>/<?php echo $row->cellphone;?></td>
                                                                                                        <td><?php echo $row->grup;?></td>
													<td>
													<?php
													if($row->user_status=='0') {
														echo '<span class="label label-sm label-success"> Aktif';
													} else {
														echo '<span class="label label-sm label-danger"> Non-aktif';
													}
													?></span>
													</td>

													<td>
														<div class="hidden-sm hidden-xs btn-group">
															<?php if($edit=='true') { ?>
															<a class="btn btn-xs btn-info" href="<?php echo base_url();?>user/edituser/<?php echo $row->ID;?>">
																<i class="ace-icon fa fa-pencil bigger-120"></i>
															</a>
															<?php } ?>

															<?php if($hapus=='true') { ?>
															<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>user/deluser/<?php echo $row->ID;?>" onclick="return confirm('Anda yakin akan menghapus user ini?')">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</a>
															<?php } ?>


														</div>

														<div class="hidden-md hidden-lg">
															<div class="inline pos-rel">
																<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
																	<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																</button>

																<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li>
																		<a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																			<span class="blue">
																				<i class="ace-icon fa fa-search-plus bigger-120"></i>
																			</span>
																		</a>
																	</li>

																	<li>
																		<a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																			<span class="green">
																				<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																			</span>
																		</a>
																	</li>

																	<li>
																		<a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																			<span class="red">
																				<i class="ace-icon fa fa-trash-o bigger-120"></i>
																			</span>
																		</a>
																	</li>
																</ul>
															</div>
														</div>
													</td>
												</tr>
											<?php
											$a++;
											 } ?>
											</tbody>
										</table>
										<center><?php echo $this->pagination->create_links(); ?></center>
									</div><!-- /.span -->
								</div><!-- /.row -->




					</div><!-- /.page-content -->