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
	<form class="form-horizontal" role="form" action="<?php echo base_url()?>reseller_diskon/reseller_diskon_update" method="post" enctype="multipart/form-data">
            <div class="form-group">
			

			<div class="col-sm-9">
                            <input type="hidden" name="id_diskon" value="<?php echo $data_diskon->id_diskon; ?>"/>

			</div>
		</div>
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Label</label>

			<div class="col-sm-3">
			 <select id="id_label" name="id_label" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($data_label as $m) {
                            if($data_diskon->id_label == $m->id_label){
			?>
                         <option selected="true" value="<?php echo $m->id_label?>"><?php echo ucfirst($m->nama_label);?> </option>
			 <?php        
                            }
                            else {
			?>
			<option value="<?php echo $m->id_label?>"><?php echo ucfirst($m->nama_label);?></option>
			 <?php 
                         
                            } 
                        }?>
			</select>
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Diskon (%)</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="diskon" value="<?php echo $data_diskon->diskon; ?>" placeholder="diskon" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Tipe reseller</label>

			<div class="col-sm-3">
			 <select id="type_reseller" name="type_reseller" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($data_type_reseller as $m) {
                            if($data_diskon->type_reseller == $m->id_typereseller) {
			?>
                         <option selected="true" value="<?php echo $m->id_typereseller?>"><?php echo ucfirst($m->nama_type);?></option>
			 <?php   
                            }
                            else {
			?>
			<option value="<?php echo $m->id_typereseller?>"><?php echo ucfirst($m->nama_type);?></option>
			 <?php } 
                        }?>
			</select>
			</div>
		</div>
            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Minimal Pembelian</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="min_beli" value="<?php echo $data_diskon->min_beli; ?>" placeholder="min_beli" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Maksimal Pembelian</label>

			<div class="col-sm-9">
				<input type="text" id="form-field-1-1" name="max_beli" value="<?php echo $data_diskon->max_beli ?>" placeholder="max_beli" class="col-xs-10 col-sm-5" required />
			</div>
		</div><div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('reseller_diskon'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>