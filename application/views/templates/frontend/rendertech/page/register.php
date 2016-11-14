
<div class="col-lg-8 col-md-8 col-sm-8">
            <div class="white-container">
                <span class="title">REGISTRASI</span>
                <p>Lengkapi form dibawah ini untuk melakukan registrasi..</p>
				<div id="informasi" style="display:none;"></div>
                <!-- Form Register -->
                <form action="javascript:void(0);" id="registrasi" method="post" enctype="multipart/form-data">
                <input type="hidden" value="0" name="sts">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="nama_depan">Nama Depan (*)</label>
                         <span><input type="text" class="form-control required" id="nama_depan" name="nama_depan"></span><br clear="all"/>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="nama_belakang">Nama Belakang (*)</label>
                         <span><input type="text" class="form-control required" id="nama_belakang" name="nama_belakang"></span><br clear="all"/>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="email">Email (*)</label>
                         <span><input type="text" class="form-control required" id="email" name="email"></span><br clear="all"/>
                         
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="telp">Telp (*)</label>
                         <span><input type="text" class="form-control required" id="telp" name="telp"></span><br clear="all"/>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="password">Kata Sandi (*)</label>
                         <span><input type="password" class="form-control required" name="password" id="password"></span><br clear="all"/>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <label for="confirm_password">Konfirmasi Kata Sandi (*)</label>
                         <span><input type="password" class="form-control required" id="confirm_password" name="confirm_password"></span><br clear="all"/>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <label for="alamat">Alamat (*)</label>
                         <span><textarea  class="form-control required" id="alamat" name="alamat" role="5"></textarea></span><br clear="all"/>
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
                <form role="form" id="login" action="javascript:void(0);">
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