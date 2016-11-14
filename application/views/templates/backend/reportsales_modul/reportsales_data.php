<style>
                    .box{
        display: none;
    }
    .date{ background: none; }
    .all{ background: none; }
</style>
<script src="<?php echo base_url(); ?>assets/backend/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
            $(".box").not(".all").hide();
            $(".all").show();
        $('input[type="checkbox"]').click(function(){
        if($(this).is(":checked")){
            $(".box").not(".date").hide();
            $(".date").show();
        }
        else {
            $(".box").not(".all").hide();
            $(".all").show();
        }
       });
    });
</script>
<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>reportsales/reportsales_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
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
					<h5 class="widget-title lighter"> Pencarian </h5>
				</div>
                &nbsp;&nbsp;&nbsp;<label class="widget-title lighter"><input type="checkbox" name="mpenjulanRadio" value="date">  Detail </label>
				<a href="<?php echo base_url();?>reportsales/export" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-save bigger-200"></i> Export data</a>
                                        <div class="date box">
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>reportsales">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-calendar-o"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Tanggal Awal" data-date-format="yyyy-mm-dd" data-provide="datepicker" value="<?php echo $query1;?>" name="tglawal">
									<span class="input-group-addon">
									<i class="ace-icon fa fa-calendar-o"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Tanggal Akhir" data-date-format="yyyy-mm-dd" data-provide="datepicker" value="<?php echo $query1;?>" name="tglakhir">
                                                                   <span class="input-group-addon">
									<i class="ace-icon fa fa-users"></i>
									</span> 
                                                                            <select class="form-control" id="form-field-select-1" name="carisales">
										<option value="">-- Sales --</option>
			<?php
			foreach ($sales as $m) {
			?>
			<option value="<?php echo $m->id?>"><?php echo ucfirst($m->name);?></option>
			 <?php } ?>
									</select>
                                                                        <input type="hidden" name="stt" value="2">
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
                                        <div class="all box">
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>reportsales">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-user"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Cari.." value="<?php echo $query1;?>" name="query1">
									<input type="hidden" name="stt" value="1">
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
								<th>#</th><th>sales</th>
<th>Bulan</th>
<th>jumlah jual</th>
<th>created</th>
<th>target</th>
<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						$a=1;
						foreach ($reportsales as $row) {
						?>
							<tr>
								<td class="center">
									<label class="pos-rel">
										<input type="checkbox" class="ace" />
										<span class="lbl"></span>
									</label>
								</td>

								<td><?php echo $a;?></td><td><?php echo $row->name?></td>
<td><?php echo $row->month_date_time?></td>
<td><?php echo $row->jumlah_jual?></td>
<td><?php echo $row->created?></td>
<td><?php echo $row->month_target?></td>
<td>
									<div class="hidden-sm hidden-xs btn-group">
										<?php if($edit=='true') { ?>
                                                                            <a class="btn btn-xs btn-info" href="<?php echo base_url();?>reportsales/reportsales_edit/<?php echo strtotime($row->created)?>">
											<i class="ace-icon fa fa-pencil bigger-120"></i>
										</a>
										<?php } ?>

										<?php if($hapus=='true') { ?>
										<a class="btn btn-xs btn-danger" href="<?php echo base_url();?>reportsales/reportsales_delete/<?php echo strtotime($row->created)?>" onclick="return confirm('Anda yakin akan menghapus user ini?')">
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