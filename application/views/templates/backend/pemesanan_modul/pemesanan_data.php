<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>pemesanan/pemesanan_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
			<?php } ?>
		</h1>
	</div><!-- /.page-header -->
	<?php
        
    if (!empty($this->session->flashdata('error'))) {
        echo '<div class="alert alert-danger">';
        echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
        </button>';
        echo '<b>'.$this->session->flashdata('error').'</b>';
        echo '</div>';
    }
    
    ?>

    <?php
		
		if (!empty($this->session->flashdata('success'))) {
			echo '<div class="alert alert-block alert-success">';
			echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
			</button>';
			echo '<b>'.$this->session->flashdata('success').'</b>';
			echo '</div>';
		} elseif (!empty($this->session->flashdata('error'))) {
			echo '<div class="alert alert-danger">';
			echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
			</button>';
			echo '<b>'.->flashdata('error').'</b>';
			echo '</div>';
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
						<form class="form-search" method="post" action="<?php echo base_url()?>pemesanan">
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
								<th>#</th><th>id_tampung_pemesanan</th>
<th>id_session</th>
<th>id_produk</th>
<th>id_bahan</th>
<th>id_model</th>
<th>panjang</th>
<th>lebar</th>
<th>jasa_desain</th>
<th>judul</th>
<th>isi</th>
<th>gambar1</th>
<th>gambar2</th>
<th>gambar3</th>
<th>jumlah</th>
<th>jumlah_bayar</th>
<th>tgl_pesan</th>
<th>jam_pesan</th>
<th>file</th>
<th>keterangan</th>
<th>metode_bayar</th>
<th>status_bayar</th>
<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($pemesanan as $row) {
						?>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td><?php echo $a;?></td><td><?php echo $row->id_tampung_pemesanan?></td>
<td><?php echo $row->id_session?></td>
<td><?php echo $row->id_produk?></td>
<td><?php echo $row->id_bahan?></td>
<td><?php echo $row->id_model?></td>
<td><?php echo $row->panjang?></td>
<td><?php echo $row->lebar?></td>
<td><?php echo $row->jasa_desain?></td>
<td><?php echo $row->judul?></td>
<td><?php echo $row->isi?></td>
<td><?php echo $row->gambar1?></td>
<td><?php echo $row->gambar2?></td>
<td><?php echo $row->gambar3?></td>
<td><?php echo $row->jumlah?></td>
<td><?php echo $row->jumlah_bayar?></td>
<td><?php echo $row->tgl_pesan?></td>
<td><?php echo $row->jam_pesan?></td>
<td><?php echo $row->file?></td>
<td><?php echo $row->keterangan?></td>
<td><?php echo $row->metode_bayar?></td>
<td><?php echo $row->status_bayar?></td>
<td>
									<div class="hidden-sm hidden-xs btn-group">
										<?php if($edit=='true') { ?>
										<a class="btn btn-xs btn-info" href="<?php echo base_url();?>pemesanan/pemesanan_edit/<?php echo $row->id_tampung_pemesanan?>">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</a>
										<?php } ?>

										<?php if($hapus=='true') { ?>
										<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>pemesanan/pemesanan_delete/<?php echo $row->id_tampung_pemesanan?>" onclick="return confirm('Anda yakin akan menghapus user ini?')">
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