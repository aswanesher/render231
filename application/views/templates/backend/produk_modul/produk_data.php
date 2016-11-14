<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<a href="<?php echo base_url();?>produk/produk_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
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
						<form class="form-search" method="post" action="<?php echo base_url()?>produk">
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
										<option value="publish" <?php if($status=='publish') { echo "selected"; }?>>Publish</option>
										<option value="draft" <?php if($status=='draft') { echo "selected"; }?>>Draft</option>
									</select>

									<span class="input-group-addon">
									<i class="ace-icon fa fa-users"></i>
									</span>
									<select class="form-control" id="form-field-select-1" name="kategori">
										<option value="">-- Kategori --</option>
										<?php foreach ($kategorinya as $data) { ?>
											<option value="<?php echo $data->id_prod_category;?>" <?php if($kategori==$data->id_prod_category) { echo "selected"; }?>><?php echo $data->category; ?></option>
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
								<th>#</th>
								<th>Nama Produk</th>
								<th>Gambar Produk</th>
								<th>Status</th>
								<th>Aksi</th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($produk as $row) {
						?>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>
								<td><?php echo $a;?></td>
								<td><?php echo $row->nama_produk?></td>								
								<td><?php if($row->gambar_produk == '') { ?>
									<img src="<?php echo base_url()?>/uploads/.thumbs/images/no_images.jpg" width="64">
								<?php } else { ?>
									<img src="<?php echo $row->thumb?>" width="64">
								<?php } ?></td>
								<td><?php echo $row->status?></td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<a class="btn btn-xs btn-info" href="<?php echo base_url();?>produk/produk_edit/<?php echo $row->id_produk?>">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</a>

										<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>produk/produk_delete/<?php echo $row->id_produk?>" onclick="return confirm('Anda yakin akan menghapus produk ini?')">
											<i class="ace-icon fa fa-trash-o bigger-120"></i>
										</a>


									</div>

									<div class="hidden-md hidden-lg">
										<div class="inline pos-rel">
											<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
												<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">

												<li>
													<a href="<?php echo base_url();?>produk/produk_edit/<?php echo $row->id_produk?>" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="<?php echo base_url();?>produk/produk_delete/<?php echo $row->id_produk?>" onclick="return confirm('Anda yakin akan menghapus produk ini?')" class="tooltip-error" data-rel="tooltip" title="Delete">
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