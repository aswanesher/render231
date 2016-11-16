<div class="center-block login-form">
            <div class="panel panel-default">
                <div class="panel-heading">Login User</div>
                <div class="panel-body">
                    <?php //echo form_open('page/loginproses'); ?>
                    <?php
                    if (!empty($this->session->flashdata('error'))) {
                        echo "<div class='alert alert-danger'>";
                        echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
                        </button>';
                        echo "<b>".$this->session->flashdata('error')."</b>";
                        echo "</div>";
                    }
                    ?>
                    <form role="form" action="<?php echo base_url();?>loginproses" method="post">
                        <div class="form-group">
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-user"  style="width:14px;"></i></span>
                                <input type="text" class="form-control required" name="email" placeholder="Email" required>
                            </div>
                            <br>
                            <div class="input-group login-input">
                                <span class="input-group-addon"><i class="fa fa-lock"  style="width:14px;"></i></span>
                                <input type="password" class="form-control required" name="password" placeholder="Kata Sandi" required>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Ingatkan Saya
                                </label>
                                <button type="submit" class="btn btn-sm btn-primary pull-right login"><i class="fa fa-sign-in"></i> Masuk</button>
                            </div>
                            
                            <hr>
                            <a href="<?php echo base_url()?>p/register" class="btn btn-success btn-sm pull-right">Registrasi</a>
                            <a href="<?php echo base_url()?>forgot-password" class="btn btn-warning btn-sm">Lupa Kata Sandi</a>
                        </div>
                    <?php //echo form_close(); ?>
                    </form>
                </div>
            </div>
        </div>