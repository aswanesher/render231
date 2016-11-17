<div class="center-block login-form">
<div id="informasi" style="display:none;"></div>
  <div align="center"><span id="preload" style="text-align:center;"></span></div>
            <div class="panel panel-default">
                <div class="panel-heading">Lupa Kata Sandi</div>
                <div class="panel-body">
                    <?php
                    if (!empty($this->session->flashdata('success'))) {
                        echo "<div class='alert alert-success'>";
                        echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
                        </button>';
                        echo "<b>".$this->session->flashdata('success')."</b>";
                        echo "</div>";
                    }

                    if (!empty($this->session->flashdata('error'))) {
                        echo "<div class='alert alert-danger'>";
                        echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
                        </button>';
                        echo "<b>".$this->session->flashdata('error')."</b>";
                        echo "</div>";
                    }
                    ?>
                    <form role="form" action="<?php echo base_url('forgot-password/process');?>" method="post">
                        <div class="form-group">
                         <p>Silahkan masukkan email anda.</p>
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-envelope-o"  style="width:14px;"></i></span>
                                <span><input type="email" class="form-control required" name="email" placeholder="Email" required></span>
                            </div>
                            <br>
                            <div class="checkbox">
                                <button type="submit" class="btn btn-sm btn-success pull-right login"><i class="fa fa-check"></i> Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div> <br> <br> <br> <br>  