<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>konfirmasi_bayar/konfirmasi_bayar_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
			<?php } ?>
		</h1>
	</div><!-- /.page-header -->

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
			echo '<b>'.$this->session->flashdata('error').'</b>';
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
						<form class="form-search" method="post" action="<?php echo base_url()?>konfirmasi_bayar">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-user"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Cari nama penyetor.." value="<?php echo $query1;?>" name="query1">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-info-circle"></i>
									</span>
									<select class="form-control" id="form-field-select-1" name="status">
										<option value="">-- Status --</option>
										<option value="pending" <?php echo $status=='pending'?'selected':''; ?>>Menunggu verifikasi</option>
										<option value="approved" <?php echo $status=='approved'?'selected':''; ?>>Disetujui</option>
									</select>

									<span class="input-group-addon">
									<i class="ace-icon fa fa-calendar"></i>
									</span>
									<input type="text" name="tgl" placeholder="Tanggal Pemesanan" class="form-control" data-date-format="yyyy-mm-dd" value="<?php echo $tgl?>" data-provide="datepicker"/>

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
								<th>#</th>
								<th>Kode Pemesanan</th>
								<th>Tujuan</th>
								<th>Penyetor</th>
								<th>Jumlah</th>
								<th>Bukti</th>
								<th>Tanggal</th>
								<th>Status</th>
								<th>Diverifikasi Oleh</th>
								<th>Tanggal verifikasi</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($konfirmasi_bayar as $row) {
						?>
							<tr>
								<td><?php echo $a;?></td>
								<td><a href="<?php echo base_url()?>pemesanan/detail/<?php echo $row->id_pemesanan;?>"><?php echo $row->kd_pemesanan?></a></td>
								<td><?php echo strtoupper($row->bank)?></td>
								<td><?php echo $row->nama_pemilik_rekening?></td>
								<td>Rp. <?php echo number_format($row->jumlah_dana,'0','.','.')?></td>
								<td align="center"><img src="<?php echo base_url().$row->bukti_pembayaran?>" width="128"><br><a href="<?php echo base_url().$row->bukti_pembayaran?>" target="_blank">Download Bukti</a></td>
								<td><?php echo $row->tgl_pembayaran?></td>
								<td>
									<?php if($row->status_approval == "pending"){;?>
			                            <span class="btn btn-danger btn-xs">Menunggu Verifikasi</span>
			                        <?php }elseif($row->status_approval == "approved"){ ?>
			                            <span class="btn btn-success btn-xs">Disetujui</span>
			                        <?php } ?>    
								</td>
								<td><?php echo $row->approve_by?></td>
								<td><?php echo $row->approve_date?></td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<?php if($edit=='true') { ?>
										<a class="btn btn-xs btn-info" href="<?php echo base_url();?>konfirmasi_bayar/konfirmasi_bayar_edit/<?php echo $row->id_pembayaran?>">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</a>
										<?php } ?>

										<?php if($hapus=='true') { ?>
										<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>konfirmasi_bayar/konfirmasi_bayar_delete/<?php echo $row->id_pembayaran?>" onclick="return confirm('Anda yakin akan menghapus user ini?')">
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
</div>
