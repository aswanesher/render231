<?php

$string="<div class=\"page-header\">
		<h1>
			<?php echo \$judul_panel;?>
			<?php if(\$tambah=='true') { ?>
			<a href=\"<?php echo base_url();?>".$controller."/".$v_form."\" class=\"btn-sm btn-success pull-right\"><i class=\"ace-icon fa fa-pencil-square-o bigger-230\"></i> Tambah data</a>
			<?php } ?>
		</h1>
	</div><!-- /.page-header -->
	<?php
        
    if (!empty(\$this->session->flashdata('error'))) {
        echo '<div class=\"alert alert-danger\">';
        echo '<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"ace-icon fa fa-times\"></i>
        </button>';
        echo '<b>'.\$this->session->flashdata('error').'</b>';
        echo '</div>';
    }
    
    ?>

    <?php
		
		if (!empty(\$this->session->flashdata('success'))) {
			echo '<div class=\"alert alert-block alert-success\">';
			echo '<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"ace-icon fa fa-times\"></i>
			</button>';
			echo '<b>'.\$this->session->flashdata('success').'</b>';
			echo '</div>';
		} elseif (!empty(\$this->session->flashdata('error'))) {
			echo '<div class=\"alert alert-danger\">';
			echo '<button type=\"button\" class=\"close\" data-dismiss=\"alert\"><i class=\"ace-icon fa fa-times\"></i>
			</button>';
			echo '<b>'.$this->session->flashdata('error').'</b>';
			echo '</div>';
		}
		
	?>
	<div class=\"row\">
		<div class=\"col-xs-12\">
			<div class=\"widget-box\">
				<div class=\"widget-header widget-header-small\">
					<h5 class=\"widget-title lighter\">Pencarian</h5>
				</div>
				<div class=\"widget-body\">
					<div class=\"widget-main\">
						<form class=\"form-search\" method=\"post\" action=\"<?php echo base_url()?>".$controller."\">
							<div class=\"row\">
								<div class=\"col-xs-12 col-sm-8\">
									<div class=\"input-group\">

									<span class=\"input-group-addon\">
									<i class=\"ace-icon fa fa-user\"></i>
									</span>
									<input type=\"text\" class=\"form-control search-query\" placeholder=\"Cari nama..\" value=\"<?php echo \$query1;?>\" name=\"query1\">

									<span class=\"input-group-addon\">
									<i class=\"ace-icon fa fa-info-circle\"></i>
									</span>
									<select class=\"form-control\" id=\"form-field-select-1\" name=\"status\">
										<option value=\"\">-- Status --</option>
										<option value=\"0\" <?php if(\$status=='0') { echo \"selected\"; }?>>Aktif</option>
										<option value=\"1\" <?php if(\$status=='1') { echo \"selected\"; }?>>Non-Aktif</option>
									</select>

									<span class=\"input-group-addon\">
									<i class=\"ace-icon fa fa-users\"></i>
									</span>
									<select class=\"form-control\" id=\"form-field-select-1\" name=\"grup\">
										<option value=\"\">-- Grup --</option>
										<?php foreach (\$user_type as \$data) { ?>
											<option value=\"<?php echo \$data->id;?>\" <?php if(\$grup==\$data->id) { echo \"selected\"; }?>><?php echo \$data->type; ?></option>
										<?php }?>
									</select>

									<span class=\"input-group-btn\">
									<button type=\"submit\" class=\"btn btn-purple btn-sm\">
									<span class=\"ace-icon fa fa-search icon-on-right bigger-110\"></span> Cari
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

	<div class=\"row\">
		<div class=\"col-xs-12\">
			<!-- PAGE CONTENT BEGINS -->
			<div class=\"row\">
				<div class=\"col-xs-12\">
					<table id=\"simple-table\" class=\"table table-striped table-bordered table-hover\">
						<thead>
							<tr>
								<th class=\"center\">
									<label class=\"pos-rel\">
										<input type=\"checkbox\" class=\"ace\" />
										<span class=\"lbl\"></span>
									</label>
								</th>
								<th>#</th>";
								foreach($allfield as $r=>$a) {
								$string.="<th>".$a['column_name']."</th>\n";
								}
								$string.="<th></th>
							</tr>
						</thead>

						<tbody>
						<?php
						\$a=1;
						foreach (\$".$controller." as \$row) {
						?>
							<tr>
								<td class=\"center\">
									<label class=\"pos-rel\">
										<input type=\"checkbox\" class=\"ace\" />
										<span class=\"lbl\"></span>
									</label>
								</td>

								<td><?php echo \$a;?></td>";
								foreach ($allfield as $r=>$a) {
									$string.="<td><?php echo \$row->".$a['column_name']."?></td>\n";
								}
								$string.="<td>
									<div class=\"hidden-sm hidden-xs btn-group\">
										<?php if(\$edit=='true') { ?>
										<a class=\"btn btn-xs btn-info\" href=\"<?php echo base_url();?>".$controller."/".$v_edit."/<?php echo \$row->$primary_f?>\">
											<i class=\"ace-icon fa fa-pencil bigger-120\"></i>
										</a>
										<?php } ?>

										<?php if(\$hapus=='true') { ?>
										<a class=\"btn btn-xs btn-danger\" href=\"<?php echo base_url();?>".$controller."/".$v_del."/<?php echo \$row->$primary_f?>\" onclick=\"return confirm('Anda yakin akan menghapus user ini?')\">
											<i class=\"ace-icon fa fa-trash-o bigger-120\"></i>
										</a>
										<?php } ?>


									</div>

									<div class=\"hidden-md hidden-lg\">
										<div class=\"inline pos-rel\">
											<button class=\"btn btn-minier btn-primary dropdown-toggle\" data-toggle=\"dropdown\" data-position=\"auto\">
												<i class=\"ace-icon fa fa-cog icon-only bigger-110\"></i>
											</button>

											<ul class=\"dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close\">
												<li>
													<a href=\"#\" class=\"tooltip-info\" data-rel=\"tooltip\" title=\"View\">
														<span class=\"blue\">
															<i class=\"ace-icon fa fa-search-plus bigger-120\"></i>
														</span>
													</a>
												</li>

												<li>
													<a href=\"#\" class=\"tooltip-success\" data-rel=\"tooltip\" title=\"Edit\">
														<span class=\"green\">
															<i class=\"ace-icon fa fa-pencil-square-o bigger-120\"></i>
														</span>
													</a>
												</li>

												<li>
													<a href=\"#\" class=\"tooltip-error\" data-rel=\"tooltip\" title=\"Delete\">
														<span class=\"red\">
															<i class=\"ace-icon fa fa-trash-o bigger-120\"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
						<?php
						\$a++;
						 } ?>
						</tbody>
					</table>
					<center><?php echo \$this->pagination->create_links(); ?></center>
				</div><!-- /.span -->
			</div><!-- /.row -->




</div><!-- /.page-content -->";

$pathfolder = "application/views/templates/backend/".$controller."_modul/";

if(!is_dir($pathfolder)) mkdir($pathfolder, 0777, TRUE);

$target = $pathfolder.$v_list_file;

if ( ! write_file($target, $string)) {
    echo 'Unable to write the view file<br>';
} else {
    echo 'File view written!<br>';
}

?>