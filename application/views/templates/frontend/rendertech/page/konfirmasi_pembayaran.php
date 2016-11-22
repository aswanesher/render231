<div class="row">
        	
        	<div class="clearfix visible-sm"></div>
			<!-- Cart -->
        	<div class="col-lg-8 col-md-8 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">KONFIRMASI PEMBAYARAN PESANAN</span>
                     <div id="informasi" style="display:none;"></div>
            	</div>
                <form role="form" id="konfirmasiPembayaran" action="" method="post" enctype="multipart/form-data">
	            <div class="col-lg-12 col-sm-12 hero-feature">
					<p>Silahkan lengkapi form di bawah ini untuk melakukan konfirmasi pembayaran pada kami.</p>
                   
                    <table class="table table-bordered ">
                        <tbody>
                            <tr>
                                <td>Kode Pemesanan</td>
                                <td colspan="3">
                                    <input type="hidden" name="id_pemesanan" value="<?php echo $id_pemesanan;?>">
                                    <input type="text" name="no_pemesanan" value="<?php echo $kd_pemesanan;?>" class="form-control required" readonly required />
                                </td>
                            </tr>
                            <tr>
                                <td>Nama Pemilik Rekening</td>
                                <td colspan="3">
                                    <input type="text" name="nama_pemilik" value="" class="form-control required" required />
                                </td>
                            </tr>
                            <tr>
                                <td>Pembayaran Ke Bank</td>
                                <td colspan="3">
                                <select type="text" name="id_bank" value="" class="form-control required" required>
                                <option value="">Pilih Bank--</option>
                                <?php foreach ($bank as $img) { ?>
                                    <option value="<?php echo $img->nama;?>"><?php echo $img->nama;?> - <?php echo $img->keterangan;?></option>
                                <?php } ?>
                                </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Jumlah Dana</td>
                                <td colspan="3">
                                    <input type="text" name="jumlah_dana" value="" class="form-control required" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>Bukti Pembayaran</td>
                                <td colspan="3">
                                    <input type="file" name="bukti" value="" accept="image/jpeg,image/png,image/jpg" id="bukti" class="form-control required" required/>
                                </td>
                            </tr>
                            <tr>
                                <td>Tanggal Pembayaran</td>
                                <td><input type="text" name="tgl" data-provide="datepicker" class="form-control required" id="tanggal" required></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btn-group btns-cart">
                      <button type="submit" class="btn btn-success" id="sendConf">Kirim</button>
                  </div><span id="preload" style="text-align:center;"></span>
	            </div>
                </form>
        	</div>
        	<!-- End Cart -->
            <div class="col-lg-4 col-md-4 col-sm-12">

				<!-- WIDGET BANK -->
                <?php 
                if(!empty($bank_widget)) {
                    $this->load->view($temp.'widget/bank_widget');
                }   
                ?>
                <!-- END WIDGET BANK -->

        	</div>

        </div>