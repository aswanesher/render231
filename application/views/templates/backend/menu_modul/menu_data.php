

<div class="page-header">
    <h1>
        <?php echo $judul_panel; ?>
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
        <div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active">
                    <a data-toggle="tab" href="#home">
                        <i class="green ace-icon fa fa-dashboard bigger-120"></i>
                        Backend Menu
                    </a>
                </li>

                <li>
                    <a data-toggle="tab" href="#messages">
                        <i class="green ace-icon fa fa-home bigger-120"></i>
                        Frontend Menu
                    </a>
                </li>
            </ul>

            <div class="tab-content">
                <!-- START MENU BACKEND -->
                <div id="home" class="tab-pane fade in active">
                    <div class="row">
                        <?php if ($tambah == 'true') { ?>
                            <div class="col-sm-4">
                                <div id="accordion" class="accordion-style1 panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                    <i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
                                                    &nbsp;Modul
                                                </a>
                                            </h4>
                                        </div>
                                        <form class="form-horizontal" role="form" action="menu/simpan_menu" method="post" enctype="multipart/form-data">
                                            <div class="panel-collapse collapse in" id="collapseOne">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1"> Nama menu</label>
                                                        <div class="col-sm-8">
                                                            <input type="hidden" value="backend" name="position">
                                                            <input type="text" id="form-field-1" name="nama_menu" placeholder="Nama Menu" class="col-xs-12 col-sm-12" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1">Modul</label>
                                                        <div class="col-sm-8">
                                                            <select id="mod_name" name="mod_name" class="form-control" required>
                                                                <option value="">Please Select</option>
                                                                <?php
                                                                foreach ($modul as $m) {
                                                                    ?>
                                                                    <option value="<?php echo $m->module_id ?>"><?php echo ucfirst($m->module_title); ?></option>
                                                                <?php } ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-offset-4 col-md-12">
                                                        <button class="btn btn-info" type="submit">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            Submit
                                                        </button>

                                                        &nbsp;
                                                        <button class="btn" type="reset">
                                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                                            Reset
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                    <i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
                                                    &nbsp;Custom Menu
                                                </a>
                                            </h4>
                                        </div>
                                        <form class="form-horizontal" role="form" action="menu/simpan_menu_custom" method="post" enctype="multipart/form-data">
                                            <div class="panel-collapse collapse in" id="collapseTwo">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1"> Nama menu</label>
                                                        <div class="col-sm-8">
                                                            <input type="hidden" value="backend" name="position">
                                                            <input type="text" id="form-field-1" name="nama_menu_custom" placeholder="Nama Menu" class="col-xs-12 col-sm-12" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1"> URL</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" id="form-field-1" name="url_menu_custom" placeholder="URL Menu" class="col-xs-12 col-sm-12" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-offset-4 col-md-12">
                                                        <button class="btn btn-info" type="submit">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            Submit
                                                        </button>

                                                        &nbsp;
                                                        <button class="btn" type="reset">
                                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                                            Reset
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                        <form class="form-horizontal" role="form" action="menu/ubah_urutan_menu" method="post" enctype="multipart/form-data">
                            <div class="col-sm-8">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4 class="smaller">Struktur menu</h4>
                                    </div>
                                    <input id="nestable-output" type="hidden" name="arr2">
                                    <input  type="hidden" name="pst" value="bo">
                                    <div class="well">
                                        Silahkan drag & drop masing-masing menu kedalam urutan yang anda inginkan.
                                        <?php if ($edit == 'true') { ?>
                                            <input type="submit" class="btn-small btn-primary pull-right" value="Ubah urutan">
                                        <?php } ?>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div class="dd" id="nestable">
                                                <ol class="dd-list">
                                                    <?php foreach ($menu as $row) {
                                                        if ($row->position == 'backend') {
                                                            ?>
                                                            <li class="dd-item" data-id="<?php echo $row->id; ?>">
                                                                <div class="dd-handle">
                                                                        <?php echo $row->title; ?>
                                                                    <div class="pull-right action-buttons">
        <?php if ($edit == 'true') { ?>
                                                                            <a class="blue" href="<?php echo base_url(); ?>menu/editmenu/<?php echo $row->id; ?>">
                                                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                            </a>
                                                                        <?php } ?>

        <?php if ($hapus == 'true') { ?>
                                                                            <a class="red" href="<?php echo base_url(); ?>menu/delmenu/<?php echo $row->id; ?>" onclick="return confirm('Apakah Anda akan menghapus data ini ?')">
                                                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                            </a>
        <?php } ?>
                                                                    </div>
                                                                    <a data-rel="tooltip" data-placement="left" title="Change Date" href="#" class="pull-right">
                                                                        (Parent)&nbsp;&nbsp;&nbsp;
                                                                    </a>
                                                                </div>
                                                                    <?php if ($row->is_parent == '1') { ?>
                                                                    <ol class="dd-list">
                                                                        <?php
                                                                        $dt = $this->menu->submenu($row->id);
                                                                        foreach ($dt as $sub) {
                                                                            ?>
                                                                            <li class="dd-item" data-id="<?php echo $sub->id; ?>">
                                                                                <div class="dd-handle">
                                                                                        <?php echo $sub->title; ?>
                                                                                    <div class="pull-right action-buttons">
                <?php if ($edit == 'true') { ?>
                                                                                            <a class="blue" href="<?php echo base_url(); ?>menu/editmenu/<?php echo $sub->id; ?>">
                                                                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                                            </a>
                                                                                        <?php } ?>

                <?php if ($hapus == 'true') { ?>
                                                                                            <a class="red" href="<?php echo base_url(); ?>menu/delmenu/<?php echo $sub->id; ?>" onclick="return confirm('Apakah Anda akan menghapus data ini ?')">
                                                                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                                            </a>
                <?php } ?>
                                                                                    </div>
                                                                                    <a data-rel="tooltip" data-placement="left" title="Change Date" href="#" class="pull-right">
                                                                                        (Child)&nbsp;&nbsp;&nbsp;
                                                                                    </a>
                                                                                </div>
                                                                            </li>
                                                                    <?php }
                                                                    ?>
                                                                    </ol>
                                                            <?php } ?>
                                                            </li>
    <?php }
} ?>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- END MENU BACKEND -->

                <div id="messages" class="tab-pane fade">
                    <div class="row">
<?php if ($tambah == 'true') { ?>
                            <div class="col-sm-4">
                                <div id="accordion" class="accordion-style1 panel-group">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapsethree">
                                                    <i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
                                                    &nbsp;Halaman Post
                                                </a>
                                            </h4>
                                        </div>
                                        <form class="form-horizontal" role="form" action="menu/simpan_menu" method="post" enctype="multipart/form-data">
                                            <div class="panel-collapse collapse in" id="collapsethree">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1"> Nama Menu</label>
                                                        <div class="col-sm-8">
                                                            <input type="hidden" value="frontend" name="position">
                                                            <input type="hidden" value="post" name="link_type">
                                                            <input type="text" id="form-field-1" name="nama_menu" placeholder="Nama Menu" class="col-xs-12 col-sm-12" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1">Halaman</label>
                                                        <div class="col-sm-8">
                                                            <select id="mod_name" name="mod_name" class="form-control" required>
                                                                <option value="">Please Select</option>
                                                                <?php
                                                                foreach ($post as $m) {
                                                                    if ($m->post_type == 'post') {
                                                                        ?>
                                                                        <option value="<?php echo $m->id_post ?>"><?php echo ucfirst($m->post_title); ?></option>
        <?php }
    }
    ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-offset-4 col-md-12">
                                                        <button class="btn btn-info" type="submit">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            Submit
                                                        </button>

                                                        &nbsp;
                                                        <button class="btn" type="reset">
                                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                                            Reset
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <!--
                                    -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapsefour">
                                                    <i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
                                                    &nbsp;Halaman Page
                                                </a>
                                            </h4>
                                        </div>
                                        <form class="form-horizontal" role="form" action="menu/simpan_menu" method="post" enctype="multipart/form-data">
                                            <div class="panel-collapse collapse in" id="collapsefour">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1"> Nama Menu</label>
                                                        <div class="col-sm-8">
                                                            <input type="hidden" value="frontend" name="position">
                                                            <input type="hidden" value="page" name="link_type">
                                                            <input type="text" id="form-field-1" name="nama_menu" placeholder="Nama Menu" class="col-xs-12 col-sm-12" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1">Halaman</label>
                                                        <div class="col-sm-8">
                                                            <select id="mod_name" name="mod_name" class="form-control" required>
                                                                <option value="">Please Select</option>
                                                                <?php
                                                                foreach ($post as $m) {
                                                                    if ($m->post_type == 'page') {
                                                                        ?>
                                                                        <option value="<?php echo $m->id_post ?>"><?php echo ucfirst($m->post_title); ?></option>
        <?php }
    }
    ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-offset-4 col-md-12">
                                                        <button class="btn btn-info" type="submit">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            Submit
                                                        </button>

                                                        &nbsp;
                                                        <button class="btn" type="reset">
                                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                                            Reset
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapsefive">
                                                    <i class="ace-icon fa fa-angle-down bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
                                                    &nbsp;Custom Menu
                                                </a>
                                            </h4>
                                        </div>
                                        <form class="form-horizontal" role="form" action="menu/simpan_menu_custom" method="post" enctype="multipart/form-data">
                                            <div class="panel-collapse collapse in" id="collapsefive">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1"> Nama menu</label>
                                                        <div class="col-sm-8">
                                                            <input type="hidden" value="frontend" name="position">
                                                            <input type="text" id="form-field-1" name="nama_menu_custom" placeholder="Nama Menu" class="col-xs-12 col-sm-12" required>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4" for="form-field-1"> URL</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" id="form-field-1" name="url_menu_custom" placeholder="URL Menu" class="col-xs-12 col-sm-12" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-offset-4 col-md-12">
                                                        <button class="btn btn-info" type="submit">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            Submit
                                                        </button>

                                                        &nbsp;
                                                        <button class="btn" type="reset">
                                                            <i class="ace-icon fa fa-undo bigger-110"></i>
                                                            Reset
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
<?php } ?>
                        <form class="form-horizontal" role="form" action="menu/ubah_urutan_menu" method="post" enctype="multipart/form-data">
                            <div class="col-sm-8">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4 class="smaller">Struktur menu</h4>
                                    </div>
                                    <input id="nestable1-outputfo" type="hidden" name="arr1">
                                    <input  type="hidden" name="pst" value="fo">
                                    <div class="well">
                                        Silahkan drag & drop masing-masing menu kedalam urutan yang anda inginkan.
<?php if ($edit == 'true') { ?>
                                            <input type="submit" class="btn-small btn-primary pull-right" value="Ubah urutan">
<?php } ?>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div class="dd" id="nestable1">
                                                <ol class="dd-list">
                                                                <?php foreach ($menu as $row) {
                                                                    if ($row->position == 'frontend') {
                                                                        ?>
                                                            <li class="dd-item" data-id="<?php echo $row->id; ?>">
                                                                <div class="dd-handle">
                                                                        <?php echo $row->title; ?>
                                                                    <div class="pull-right action-buttons">
                                                                        <?php if ($edit == 'true') { ?>
                                                                            <a class="blue" href="<?php echo base_url(); ?>menu/editmenu/<?php echo $row->id; ?>">
                                                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                            </a>
                                                                        <?php } ?>

        <?php if ($hapus == 'true') { ?>
                                                                            <a class="red" href="<?php echo base_url(); ?>menu/delmenu/<?php echo $row->id; ?>" onclick="return confirm('Apakah Anda akan menghapus data ini ?')">
                                                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                            </a>
                                                                <?php } ?>
                                                                    </div>
                                                                    <a data-rel="tooltip" data-placement="left" title="Change Date" href="#" class="pull-right">
                                                                        (Parent)&nbsp;&nbsp;&nbsp;
                                                                    </a>
                                                                    
                                                                </div>
                                                                            <?php if ($row->is_parent == '1') { ?>
                                                                    <ol class="dd-list">
                                                                                    <?php
                                                                                    $dt = $this->menu->submenu($row->id);
                                                                                    
                                                                                    foreach ($dt as $sub) {
                                                                                        ?>
                                                                            <li class="dd-item" data-id="<?php echo $sub->id; ?>">
                                                                                <div class="dd-handle">
                                                                                        <?php echo $sub->title; ?>
                                                                                    <div class="pull-right action-buttons">
                <?php if ($edit == 'true') { ?>
                                                                                            <a class="blue" href="<?php echo base_url(); ?>menu/editmenu/<?php echo $sub->id; ?>">
                                                                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                                            </a>
                <?php } ?>

                <?php if ($hapus == 'true') { ?>
                                                                                            <a class="red" href="<?php echo base_url(); ?>menu/delmenu/<?php echo $sub->id; ?>" onclick="return confirm('Apakah Anda akan menghapus data ini ?')">
                                                                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                                            </a>
                                                                            <?php } ?>
                                                                                    </div>
                                                                                    <a data-rel="tooltip" data-placement="left" title="Change Date" href="#" class="pull-right">
                                                                                        (Child)&nbsp;&nbsp;&nbsp;
                                                                                    </a>
                                                                                </div>
                                                                            <?php if ($row->is_parent == '1') { ?>
                                                                    <ol class="dd-list">
                                                                                    <?php
                                                                                    $dt_ = $this->menu->submenu($sub->id);
                                                                                    foreach ($dt_ as $sub_) {
                                                                                        ?>
                                                                            <li class="dd-item" data-id="<?php echo $sub_->id; ?>">
                                                                                <div class="dd-handle">
                                                                                        <?php echo $sub_->title; ?>
                                                                                    <div class="pull-right action-buttons">
                <?php if ($edit == 'true') { ?>
                                                                                            <a class="blue" href="<?php echo base_url(); ?>menu/editmenu/<?php echo $sub_->id; ?>">
                                                                                                <i class="ace-icon fa fa-pencil bigger-130"></i>
                                                                                            </a>
                <?php } ?>

                <?php if ($hapus == 'true') { ?>
                                                                                            <a class="red" href="<?php echo base_url(); ?>menu/delmenu/<?php echo $sub_->id; ?>" onclick="return confirm('Apakah Anda akan menghapus data ini ?')">
                                                                                                <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                                                            </a>
                                                                            <?php } ?>
                                                                                    </div>
                                                                                    <a data-rel="tooltip" data-placement="left" title="Change Date" href="#" class="pull-right">
                                                                                        (Child)&nbsp;&nbsp;&nbsp;
                                                                                    </a>
                                                                                </div> 
                                                                                
                                                                            </li>
            <?php }
             ?>
                                                                    </ol>
                                                                
        <?php } ?> 
                                                                            </li>
            <?php }
            ?>
                                                                    </ol>
                                                                
        <?php } ?>
                                                                
                                                            </li>
    <?php } //disini 
}
?>
                                                </ol>
                                            </div>
                                        </div>
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




</div><!-- /.page-content -->
</div>