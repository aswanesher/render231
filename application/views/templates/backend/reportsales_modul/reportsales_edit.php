<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->
				<?php
					if(isset($pesan)){
						echo '<div class="alert alert-info">'.$pesan.'</div>';
					}

				?>
<div class="row">
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
	<form class="form-horizontal" role="form" action="<?php echo base_url('reportsales/reportsales_update'); ?>" method="post" enctype="multipart/form-data"><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id sales</label>
			<div class="col-sm-3">
			 <select id="id_sales" name="id_sales" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
                        
			foreach ($sales as $m) {
                            if($isi[0]->id_sales == $m->id) {
                               ?>  
                            
                         <option selected="true" value="<?php echo $m->id?>"><?php echo ucfirst($m->name);?></option>
                         <?php }
                         else {
			?>
			<option value="<?php echo $m->id?>"><?php echo ucfirst($m->display_name);?></option>
                        <?php } }?>
			</select>
			
			</div>
		</div>
                        <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">jumlah jual</label>

			<div class="col-sm-9">
                                                                
                            <input type="hidden" name="created" value="<?php echo $isi[0]->created;?>"/>
<input type="text" id="form-field-1-1" name="jumlah_jual" value="<?php echo $isi[0]->jumlah_jual;?>" placeholder="jumlah_jual" class="col-xs-10 col-sm-5" required />
     
                            
				
			</div>
		</div>
		<div class="form-group" id="date-picker">
			<label class="col-sm-3 control-label no-padding-right" for="date-picker">Tanggal Jual</label>

			<div class="col-sm-2">
				<input type="text" name="tgl_jual" placeholder="Tanggal Penjualan" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker" required value="<?php echo $isi[0]->month_date_time;?>" />
			</div>	
		</div>
            <?php /* 
             *             <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">month date</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="month_date_time" placeholder="Date" class="col-xs-10 col-sm-5" required />
			</div>
		</div>
             * <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">created</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="created" placeholder="created" class="col-xs-10 col-sm-5" required />
			</div>
		</div> */ ?>
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">id target</label>

			<div class="col-sm-3">
			 <select id="id_target" name="id_target" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($target as $m) {
                            if($isi[0]->id_target == $m->id_target) {
                                ?>
                         <option selected="true" value="<?php echo $m->id_target?>"><?php echo ucfirst($m->month_target);?></option>
                         <?php
                            }
                            else {
			?>
			<option value="<?php echo $m->id_target?>"><?php echo ucfirst($m->month_target);?></option>
                        <?php } }?>
			</select>
			
			</div>
		</div>
            <div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('reportsales'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>