<div class="row">
        	<div class="col-lg-3 col-md-3 col-sm-12">

				<!-- OUR LOCATION -->
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="no-padding">
	            		<span class="title">LOKASI KAMI</span>
	            	</div>
                    <?php echo $gmap;?>
                 	</div>
				<!-- End OUR LOCATION -->

        	</div>

        	<div class="clearfix visible-sm"></div>
			<?php 
            //$data = mysqli_fetch_object(mysqli_query($link,"SELECT * FROM tbl_pelanggan WHERE id_pelanggan = '".$_SESSION['sesi_id_pelanggan_render_tech_production']."'")); ?>
			<!-- Cart -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">KONTAK KAMI</span>
                     <div id="informasi" style="display:none;"></div>
            	</div>
                 <form role="form" id="kontak">
	            <div class="col-lg-12 col-sm-12 hero-feature">
					<p>Silahkan lengkapi form di bawah ini untuk memberi masukan pada kami atau hal lainnya.</p>
                   
                    <table class="table table-bordered tbl-checkout">
                        <tbody>
                            <tr>
                                <td>Nama Depan</td>
                                <td>
                                    <input type="text" name="nama_depan" value="" class="form-control required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Nama Belakang</td>
                                <td>
                                    <input type="text" name="nama_belakang" value="" class="form-control required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>
                                    <input type="text" name="email" value="" class="form-control required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Telepon</td>
                                <td>
                                    <input type="text" name="telp" value="" class="form-control required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Pesan</td>
                                <td colspan="3">
                                    <textarea name="pesan" class="form-control required" rows="5"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-group btns-cart">
                        <button type="submit" class="btn btn-success">Kirim</button>
                    </div><span id="preload" style="text-align:center;"></span>
	            </div>
                </form>
        	</div>
        	<!-- End Cart -->


        </div>