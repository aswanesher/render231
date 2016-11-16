
<div class="col-lg-8 col-md-8 col-sm-8">
            <div class="white-container">
                <span class="title">REGISTRASI</span>
                <p>Lengkapi form dibawah ini untuk melakukan registrasi..</p>
				<div id="informasi" style="display:none;"></div>
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
                <!-- Form Register -->
                <form action="<?php echo base_url('register-process');?>" method="post" enctype="multipart/form-data">
                <input type="hidden" value="0" name="sts">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="nama_depan">Nama Lengkap (*)</label>
                         <span><input type="text" class="form-control required" id="nama_lengkap" name="nama_lengkap" required></span><br clear="all"/>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="email">Email (*)</label>
                         <span><input type="text" class="form-control required" id="email" name="email" required></span><br clear="all"/>
                         
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="email">No.Hp (*)</label>
                         <span><input type="text" class="form-control required" id="nope" name="nope" required></span><br clear="all"/>
                         
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="telp">Telp (*)</label>
                         <span><input type="text" class="form-control required" id="telp" name="telp" required></span><br clear="all"/>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="password">Kata Sandi (*)</label>
                         <span><input type="password" class="form-control required" name="password" id="password" required></span><br clear="all"/>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="confirm_password">Konfirmasi Kata Sandi (*)</label>
                         <span><input type="password" class="form-control required" id="confirm_password" name="confirm_password" required></span><br clear="all"/>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="alamat">Alamat (*)</label>
                         <span><textarea  class="form-control required" id="alamat" name="alamat" role="5" required></textarea></span><br clear="all"/>
                    </div>
                    <div class="clearfix"></div>
                    <input type="submit" value="Registrasi" class="btn btn-success registrasi"/> <span id="preload" style="text-align:center;"></span>
                    
                </form>
                <!-- End Form Register -->
            </div>

        </div>

        <div class="col-lg-4 col-md-4 col-sm-4">

            <!-- Login Form -->
            <div class="white-container">
                <span class="title">SUDAH TERDAFTAR ?</span>
                <form role="form" action="<?php echo base_url();?>loginproses" method="post">
                    <div class="form-group">
                        <div class="input-group login-input">
                            <span class="input-group-addon" ><i class="fa fa-user" style="width:14px;"></i></span>
                            <input type="text" class="form-control required" name="email" placeholder="Email">
                        </div>
                        <br>
                        <div class="input-group login-input">
                            <span class="input-group-addon"><i class="fa fa-lock" style="width:14px;"></i> </span>
                            <input type="password" class="form-control required" name="password" placeholder="Kata Sandi">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">Ingatkan Saya
                            </label>
                        </div>
                        <button type="submit" class="btn btn-sm btn-success pull-right login"><i class="fa fa-sign-in"></i> Masuk</button>
                    </div>
                </form>
            </div>
            <!-- End Login Form -->

        </div>