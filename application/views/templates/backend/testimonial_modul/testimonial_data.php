<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>testimonial/testimonial_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
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
						<form class="form-search" method="post" action="<?php echo base_url()?>testimonial">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-user"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Cari.." value="<?php echo $query1;?>" name="query1">

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
								<th>Nama </th>
								<th>judul</th>
								<th class="hidden-sm hidden-xs">testimonial</th>
								<th class="hidden-sm hidden-xs">gambar</th>
								<th class="hidden-sm hidden-xs">tanggal</th>
								<th>Disetujui</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($testimonial as $row) {
						?>
							<tr>
								<td><?php echo $a;?></td>
								<td><?php echo $row->name?></td>
								<td><?php echo $row->judul_id?></td>
								<td class="hidden-sm hidden-xs"><?php echo $row->testimonial?></td>
                                                                <td class="hidden-sm hidden-xs"><img width="100" height="100" <?php if($row->gambar =='') {
                                                                echo 'src="assets/backend/avatars/avatar2.png"'; }
                                                                else {
                                                                    ?> src="<?php echo $row->gambar; ?>" <?php
                                                                }?>></td>
								<td class="hidden-sm hidden-xs"><?php echo $row->tanggal?></td>
								<td><?php if($row->approval=='false') { echo "Belum disetujui"; } else { echo "Disetujui"; }?></td>
								<td>
									<div class="hidden-sm hidden-xs btn-group">
										<?php if($edit=='true') { ?>
										<a class="btn btn-xs btn-info" href="<?php echo base_url();?>testimonial/testimonial_edit/<?php echo $row->id_testimonial?>">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</a>
										<?php } ?>

										<?php if($hapus=='true') { ?>
										<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>testimonial/testimonial_delete/<?php echo $row->id_testimonial?>" onclick="return confirm('Anda yakin akan menghapus user ini?')">
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
												<?php if($edit=='true') { ?>
												<li>
													<a href="<?php echo base_url();?>testimonial/testimonial_edit/<?php echo $row->id_testimonial?>" class="tooltip-success" data-rel="tooltip" title="Edit">
														<span class="green">
															<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
														</span>
													</a>
												</li>
												<?php } ?>
												<?php if($hapus=='true') { ?>
												<li>
													<a href="<?php echo base_url();?>testimonial/testimonial_delete/<?php echo $row->id_testimonial?>" onclick="return confirm('Anda yakin akan menghapus user ini?')" class="tooltip-error" data-rel="tooltip" title="Delete">
														<span class="red">
															<i class="ace-icon fa fa-trash-o bigger-120"></i>
														</span>
													</a>
												</li>
												<?php } ?>
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