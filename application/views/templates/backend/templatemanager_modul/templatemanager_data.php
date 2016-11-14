<div class="page-header">
	<h1>
		Pengelola Template
	</h1>
</div><!-- /.page-header -->

<div class="row">
	<div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<div class="alert alert-block alert-info">
			<button type="button" class="close" data-dismiss="alert">
				<i class="ace-icon fa fa-times"></i>
			</button>
			Silahkan pilih dan aktifkan template berikut untuk merubah tampilan.
		</div>
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
		<div id="infoMessage"><?php echo $this->session->flashdata('message');?></div>
		<div class="space-12"></div>
		<form role="form" action="<?php echo base_url('templatemanager/template_save'); ?>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="<?php echo $id;?>" required />
		<div class="row">
			
			<?php 
			foreach ($map as $key => $value) {
			?>
			<div class="col-md-4">
				<a href="#" class="thumbnail">
					<img class="img-responsive" src="<?php echo base_url().$dir.$key."/".$value[0]?>" alt="Email Template" style="height:259px;"/>
					<h4><?php echo ucfirst($key);?></h4>
					<label>
						<input name="nm_template" class="ace ace-switch" type="radio" value="<?php echo $key;?>" <?php if($key==$template) { echo "checked"; }?>>
						<span class="lbl">&nbsp;Aktifkan</span>
					</label>
				</a>
			</div>
			<?php } ?>
		</div>
		<div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Simpan perubahan
				</button>

				&nbsp; &nbsp; &nbsp;
				<button class="btn" type="reset">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</button>
			</div>
		</div>
		</form>
		<!-- PAGE CONTENT ENDS -->
	</div><!-- /.col -->
