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
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<a href="<?php echo base_url();?>biaya_resi/export" class="btn-sm btn-danger pull-right"><i class="ace-icon fa fa-save bigger-240"></i> Export data</a>
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