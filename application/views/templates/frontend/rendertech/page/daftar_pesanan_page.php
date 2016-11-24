<div class="row">
        	
			<!-- Cart -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
                    <span class="title">DATA PESANAN</span>
                    <div id="informasi" style="display:none;"></div>
            	</div>
	            <div class="col-lg-12 col-sm-12 hero-feature">
	            						
					<div class="table-responsive" align="center">
                    <?php 
					if(empty($produk)){
					?>
                       <div class='alert alert-warning text-center nm null_del'>
                                    <h4 class='mt0 mb10'>Perhatian!</h4>
                                    <p class='text-muted mb15'> <font color="#000">Data pesanan anda kosong, silahkan anda melakukan pemesanan terlebih dahulu. <br>Terima Kasih..</font></p>
                                   
                                </div>
                    <?php }else{ ?>
                        <table class="table table-bordered tbl-cart">
                           
                            <thead>
                                <tr>
                                    <td>Kode Pesanan</td>
                                    <td style="text-align:center;">Waktu Pemesanan</td>
                                    <td style="text-align:center;">Status Bayar</td>
                                    <td style="text-align:center;">Status Pengerjaan</td>
                                </tr>
                            </thead>
                            <tbody>
                           <?php 
						   foreach ($produk as $data) {
                           ?>
                            <tr>
                                <td><a href="<?php base_url()?>order-list/invoice/<?php echo $data->id_tampung_pemesanan;?>"><?=$data->kd_pemesanan;?></a></td>
                                <td align="center" width="25%"><?php echo date("j F, Y",strtotime($data->tgl_pesan))?></td>
                                <td class="" width="20%" style="text-align:center;">
                                <?php if($data->status_bayar == "unpaid"){;?>
                                    <span class="btn btn-danger btn-xs">Menunggu Pembayaran</span>
                                <?php }elseif($data->status_bayar == "verifypayment"){ ?>
                                    <span class="btn btn-warning btn-xs">Menunggu verifikasi</span>
                                <?php }elseif($data->status_bayar == "paid"){ ?>
                                    <span class="btn btn-success btn-xs">Telah Bayar</span><?php } ?>
                                </td>
                                <td style="text-align:center;">
                                <?php if($data->status_pengerjaan == "available"){ ?>
                                    <span class="btn btn-danger btn-xs">Belum Dikerjakan</span>
                                <?php }elseif($data->status_pengerjaan == "onprocess"){ ?>
                                    <span class="btn btn-primary btn-xs">Proses Pengerjaan</span>
                                <?php }elseif($data->status_pengerjaan == "finished"){ ?>
                                    <span class="btn btn-success btn-xs">Selesai</span>
                                <?php } else { ?>
                                    <span class="btn btn-danger btn-xs">Dibatalkan</span><?php } ?></td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                        <?php } ?>
                        <?php echo $this->pagination->create_links(); ?>
                        
                    </div>
                   
                </div>
        	</div>
        	<!-- End Cart -->
            
        	<div class="clearfix visible-sm"></div>

            <div class="col-lg-3 col-md-3 col-sm-12">

				<!-- RECENT PRODUCT -->
                <?php 
                if(!empty($produk_widget)) {
                    $this->load->view($temp.'widget/produk_widget');
                }   
                ?>
                <!-- End RECENT PRODUCT -->

        	</div>

        </div>
        </div>
