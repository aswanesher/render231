<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>permission/permission_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
			<?php } ?>
		</h1>
	</div><!-- /.page-header -->
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
						<form class="form-search" method="post" action="<?php echo base_url()?>permission">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">
									<span class="input-group-addon">
									<i class="ace-icon fa fa-info-circle"></i>
									</span>
									<select class="form-control" id="form-field-select-1" name="modul">
										<option value="">-- Modul --</option>
										<?php foreach ($modul as $m) { ?>
										<option value="<?php echo $m->module_id?>" <?php if($m->module_id==$modulnya) { echo "selected"; }?>><?php echo ucfirst($m->module_title);?></option>
										<?php } ?>
									</select>

									<span class="input-group-addon">
									<i class="ace-icon fa fa-users"></i>
									</span>
									<select class="form-control" id="form-field-select-1" name="grup">
										<option value="">-- Grup --</option>
										<?php foreach ($grup as $s) { ?>
										<option value="<?php echo $s->id?>" <?php if($s->id==$grupnya) { echo "selected"; }?>><?php echo ucfirst($s->type);?></option>
										<?php } ?>
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
								<th>#</th><th>Modul</th>
								<th>Grup</th>
								<th>Rekap</th>
								<th>Tambah</th>
								<th>Edit</th>
								<th>Hapus</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($permission as $row) {
						?>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td><?php echo $a;?></td><td><?php echo ucfirst($row->module_title)?></td>
								<td><?php echo $row->type;?></td>
								<td align="center"><?php if($row->is_view=='true') { ?> <i class="fa fa-check-square fa-2x"></i> <?php } else { ?><i class="fa fa-times fa-2x"></i><?php } ?></td>
								<td align="center"><?php if($row->is_add=='true') { ?> <i class="fa fa-check-square fa-2x"></i> <?php } else { ?><i class="fa fa-times fa-2x"></i><?php } ?></td>
								<td align="center"><?php if($row->is_edit=='true') { ?> <i class="fa fa-check-square fa-2x"></i> <?php } else { ?><i class="fa fa-times fa-2x"></i><?php } ?></td>
								<td align="center"><?php if($row->is_delete=='true') { ?> <i class="fa fa-check-square fa-2x"></i> <?php } else { ?><i class="fa fa-times fa-2x"></i><?php } ?></td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<?php if($edit=='true') { ?>
										<a class="btn btn-xs btn-info" href="<?php echo base_url();?>permission/permission_edit/<?php echo $row->idnya?>">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</a>
										<?php } ?>

										<?php if($hapus=='true') { ?>
										<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>permission/permission_delete/<?php echo $row->idnya?>" onclick="return confirm('Anda yakin akan menghapus user ini?')">
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
