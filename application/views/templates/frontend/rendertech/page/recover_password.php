<div class="center-block login-form">
<div id="informasi" style="display:none;"></div>
  <div align="center"><span id="preload" style="text-align:center;"></span></div>
            <div class="panel panel-default">
                <div class="panel-heading">Kata Sandi Baru</div>
                <div class="panel-body">
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
                    <form role="form" action="<?php echo base_url('new-password-process');?>" enctype="multipart/form-data" method="post">
                    	<input type="hidden" value="" name="idp">
                        <div class="form-group">
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-key"  style="width:14px;"></i></span>
                                <span>
                                <input type="hidden" value="<?php echo $recover_code;?>" name="recover_code">
                                <input type="password" class="form-control required" name="password" id="password" placeholder="Kata Sandi Baru"></span>
                            </div>
                            <br>
                             <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-key"  style="width:14px;"></i></span>
                                <span><input type="password" class="form-control required" name="password1" id="password1" placeholder="Ulangi Kata Sandi Baru"></span>
                            </div>
                            <div class="checkbox">
                      
                                <button type="submit" class="btn btn-sm btn-success pull-right login"><i class="fa fa-pencil-square-o"></i> Simpan Kata Sandi</button>
                              
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>