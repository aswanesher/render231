		<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>biaya_resi/biaya_resi_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
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
			echo "<div class='alert alert-block alert-success'>";
			echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
			</button>';
			echo "<b>".$this->session->flashdata('success')."</b>";
			echo "</div>";
		} elseif (!empty($this->session->flashdata('error'))) {
			echo "<div class='alert alert-danger'>";
			echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
			</button>';
			echo "<b>".$this->session->flashdata('error')."</b>";
			echo "</div>";
		}
		
	?>
	<!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Pilih Berdasarkan Tanggal</h4>
	        </div>
	        <div class="modal-body">
	          <div class="widget-box">
				<div class="widget-body">
					<div class="widget-main">
						<form class="form-horizontal" role="form" action="<?php echo base_url();?>biaya_resi/export" method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-xs-4 col-sm-4">
								<div class="input-group">
									<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" name="tgl1" placeholder="Tanggal Awal">
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</div>  
							<div class="col-xs-1 col-sm-1">s/d</div>
							<div class="col-xs-4 col-sm-4">
								<div class="input-group">
									<input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" name="tgl2" placeholder="Tanggal Akhir">
									<span class="input-group-addon">
										<i class="fa fa-calendar bigger-110"></i>
									</span>
								</div>
							</div>
							<button class="btn btn-info" type="submit">
								<i class="ace-icon fa fa-save"></i>
								Eksport Data
							</button>
						</div>
						</form>
					</div>
				</div>
			</div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<button type="button" class="btn btn-danger btn-sm pull-right" data-toggle="modal" data-target="#myModal"><i class="ace-icon fa fa-save bigger-220"></i> Export Data</button>
			<div class="modal-header no-padding">
				<div class="table-header">
					<?php echo $judul_panel;?>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
				<table id="tablebiaya" class="table table-striped table-bordered table-responsive" cellspacing="0" width="100%">
	            <thead>
	                <tr>
	                	<th width="50">#</th>
	                    <th width="100">Nama</th>
	                    <th width="100">Produk</th>
	                    <th width="100">Ukuran</th>
	                    <th width="40">No. Resi</th>
	                    <th width="100">Ekspedisi</th>
	                    <th width="100">Ongkir</th>
	                    <th width="100">Ditransfer</th>
	                    <th width="100">Sisa/Selisih</th>
	                    <th width="40">Tanggal</th>
	                    <th style="width:125px;">Action</th>
	                </tr>
	            </thead>
	            <tbody>
	            </tbody>
	            
	        </table>
				</div><!-- /.span -->
			</div><!-- /.row -->
	




</div><!-- /.page-content -->