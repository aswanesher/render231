<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>pemesanan/pemesanan_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
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
						<form class="form-search" method="post" action="<?php echo base_url()?>pemesanan">
							<div class="row">
								<div class="col-xs-12 col-sm-12">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-user"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Cari nama.." value="<?php echo $query1;?>" name="query1">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-reorder"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Cari kode pemesanan.." value="<?php echo $query2;?>" name="query2">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-calendar"></i>
									</span>
									<input type="text" name="tgl_pesan" placeholder="Tanggal Pemesanan" class="form-control" data-date-format="yyyy-mm-dd" value="<?php echo $tgl_pesan?>" data-provide="datepicker"/>

									<span class="input-group-addon">
									<i class="ace-icon fa fa-info-circle"></i>
									</span>
									<select class="form-control" id="form-field-select-1" name="status">
										<option value="">-- Status Pengerjaan --</option>
										<option value="available" <?php echo $status=='available'?'selected':''; ?>>Belum dikerjakan</option>
										<option value="onprocess" <?php echo $status=='onprocess'?'selected':''; ?>>Sedang dikerjakan</option>
										<option value="finished" <?php echo $status=='finished'?'selected':''; ?>>Selesai</option>
										<option value="cancel" <?php echo $status=='cancel'?'selected':''; ?>>Dibatalkan</option>
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
								<th>#</th>
								<th>Kode order</th>
								<th>Pemesan</th>
								<th>Jasa Desain</th>
								<th>Tanggal order</th>
								<th>Status bayar</th>
								<th>Status pengerjaan</th>
								<th>Operator</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($pemesanan as $row) {
						?>
							<tr>
								<td><?php echo $a;?></td>
								<td><a href="pemesanan/detail/<?php echo $row->id_tampung_pemesanan?>"><?php echo $row->kd_pemesanan?></a></td>
								<td><?php echo ucfirst($row->name)?></td>
								<td>
									<?php if($row->jasa_desain=='Y') {?>
									<span class="btn btn-success btn-xs">Ya</span>
									<?php } else { ?>
									<span class="btn btn-danger btn-xs">Tidak</span>
									<?php } ?>
								</td>
								<td><?php echo date("j F, Y",strtotime($row->tgl_pesan))?></td>
								<td>
								<?php if($row->status_bayar == "unpaid"){;?>
		                            <span class="btn btn-danger btn-xs">Menunggu Pembayaran</span>
		                        <?php }elseif($row->status_bayar == "verifypayment"){ ?>
		                            <span class="btn btn-warning btn-xs">Menunggu verifikasi</span>    
		                        <?php }elseif($row->status_bayar == "paid"){ ?>
		                            <span class="btn btn-success btn-xs">Telah Bayar</span>
		                        <?php } ?>
								</td>
								<td>
								<?php if($row->status_pengerjaan == "available"){ ?>
                                    <span class="btn btn-danger btn-xs">Belum Dikerjakan</span>
                                <?php }elseif($row->status_pengerjaan == "onprocess"){ ?>
                                    <span class="btn btn-primary btn-xs">Proses Pengerjaan</span>
                                <?php }elseif($row->status_pengerjaan == "finished"){ ?>
                                    <span class="btn btn-success btn-xs">Selesai</span>
                                <?php } else { ?>
                                    <span class="btn btn-danger btn-xs">Dibatalkan</span><?php } ?>
								</td>
								<td><?php echo $row->opp;?></td>
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
			</div>