<?php
$string="<div class=\"page-header\">
<h1>
	<?php echo \$judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div class=\"row\">
<div class=\"col-xs-12\">
	<!-- PAGE CONTENT BEGINS -->
	<form class=\"form-horizontal\" role=\"form\" action=\"<?php echo base_url('".$controller."/".$controller."_update'); ?>\" method=\"post\" enctype=\"multipart/form-data\">";
		foreach ($allfield as $key => $value) {
		$string.="<div class=\"form-group\">
			<label class=\"col-sm-3 control-label no-padding-right\" for=\"form-field-1-1\">".$value['column_name']."</label>

			<div class=\"col-sm-9\">
				<input type=\"text\" id=\"form-field-1-1\" name=\"".$value['column_name']."\" placeholder=\"".$value['column_name']."\" class=\"col-xs-10 col-sm-5\" required />
			</div>
		</div>";
		}
		$string.="<div class=\"clearfix form-actions\">
			<div class=\"col-md-offset-3 col-md-9\">
				<button class=\"btn btn-info\" type=\"submit\">
					<i class=\"ace-icon fa fa-check bigger-110\"></i>
					Simpan
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class=\"btn\" href=\"<?php echo base_url('".$controller."'); ?>\">
					<i class=\"ace-icon fa fa-undo bigger-110\"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->";

$pathfolder = "application/views/templates/backend/".$controller."_modul/";

if(!is_dir($pathfolder)) mkdir($pathfolder, 0777, TRUE);

$target = $pathfolder.$v_edit_file;

if ( ! write_file($target, $string)) {
    echo 'Unable to write the edit file<br>';
} else {
    echo 'File edit written!<br>';
}

?>
