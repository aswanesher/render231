<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>setting/setting_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
			<?php } ?>
		</h1>
	</div><!-- /.page-header -->

	<div class="row">
		<div class="col-xs-12">
			<div class="widget-box">
				<div class="widget-header widget-header-small">
					<h5 class="widget-title lighter">Pencarian</h5>
				</div>
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>setting">
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
								<th>#</th><th>id</th>
<th>website_title</th>
<th>website_desc</th>
<th>company_name</th>
<th>contact_address</th>
<th>contact_email</th>
<th>contact_phone</th>
<th>contact_fax</th>
<th>contact_cellphone</th>
<th>meta_title</th>
<th>meta_author</th>
<th>meta_desc</th>
<th>meta_keywords</th>
<th>logo</th>
<th>favicon</th>
<th>sosmed_fb</th>
<th>sosmed_twitter</th>
<th>sosmed_gplus</th>
<th>sosmed_linkedin</th>
<th>sosmed_instagram</th>
<th>bbm_pin</th>
<th>whatsapp_no</th>
<th>telegram_no</th>
<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($setting as $row) {
						?>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td><?php echo $a;?></td><td><?php echo $row->id?></td>
<td><?php echo $row->website_title?></td>
<td><?php echo $row->website_desc?></td>
<td><?php echo $row->company_name?></td>
<td><?php echo $row->contact_address?></td>
<td><?php echo $row->contact_email?></td>
<td><?php echo $row->contact_phone?></td>
<td><?php echo $row->contact_fax?></td>
<td><?php echo $row->contact_cellphone?></td>
<td><?php echo $row->meta_title?></td>
<td><?php echo $row->meta_author?></td>
<td><?php echo $row->meta_desc?></td>
<td><?php echo $row->meta_keywords?></td>
<td><?php echo $row->logo?></td>
<td><?php echo $row->favicon?></td>
<td><?php echo $row->sosmed_fb?></td>
<td><?php echo $row->sosmed_twitter?></td>
<td><?php echo $row->sosmed_gplus?></td>
<td><?php echo $row->sosmed_linkedin?></td>
<td><?php echo $row->sosmed_instagram?></td>
<td><?php echo $row->bbm_pin?></td>
<td><?php echo $row->whatsapp_no?></td>
<td><?php echo $row->telegram_no?></td>
<td>
									<div class="hidden-sm hidden-xs btn-group">
										<?php if($edit=='true') { ?>
										<a class="btn btn-xs btn-info" href="<?php echo base_url();?>setting/setting_edit/<?php echo $row->id?>">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</a>
										<?php } ?>

										<?php if($hapus=='true') { ?>
										<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>setting/setting_delete/<?php echo $row->id?>" onclick="return confirm('Anda yakin akan menghapus user ini?')">
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
</div>