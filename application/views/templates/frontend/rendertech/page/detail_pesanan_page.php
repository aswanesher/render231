<div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>Invoice <?php echo $datapesanan->kd_pemesanan?>
                <a href="javascript:void(0)" class="btn btn-danger pull-right"><i class="fa fa-print"></i> Cetak</a>  
                <a href="<?php echo base_url()?>confirm-payment/<?php echo $datapesanan->id_tampung_pemesanan;?>" class="btn btn-success pull-right"><i class="fa fa-money"></i> Konfirmasi Pembayaran</a>         
                </h2>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Penagihan Kepada:</strong><br>
    					<?php echo $datapesanan->name;?><br>
    					<?php echo $datapesanan->address;?><br>
    					<?php echo $datapesanan->phone;?><br>
    					<?php echo $datapesanan->cellphone;?>
    				</address>
    			</div>
    			<div class="col-xs-6 text-right">
                    <address>
                        <strong>Metode Bayar:</strong><br>
                        <?php if($datapesanan->metode_bayar=='bank') { echo 'Perbankan'; } else if($datapesanan->metode_bayar=='cod') { echo 'Cash On Delivery'; } else { echo 'Bayar diempat'; }?><br>
                    </address>
                </div>
                <div class="col-xs-6 text-right">
                    <address>
                        <strong>Status Pembayaran:</strong><br>
                        <?php if($datapesanan->status_bayar == "unpaid"){;?>
                            <span class="btn btn-danger btn-xs">Menunggu Pembayaran</span>
                        <?php }elseif($datapesanan->status_bayar == "verifypayment"){ ?>
                            <span class="btn btn-warning btn-xs">Menunggu verifikasi</span>    
                        <?php }elseif($datapesanan->status_bayar == "paid"){ ?>
                            <span class="btn btn-success btn-xs">Telah Bayar</span>
                        <?php } ?>
                    </address>
                </div>
    		</div>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    					<strong>Tanggal Pemesanan:</strong><br>
    					<?php echo date("j F, Y",strtotime($datapesanan->tgl_pesan))?><br><br>
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading">
    				<h3 class="panel-title"><strong>Rekap Pesanan</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="table-responsive">
    					<table class="table table-condensed">
    						<thead>
                                <tr>
        							<td><strong>Produk</strong></td>
        							<td class="text-center"><strong>Jumlah</strong></td>
        							<td class="text-center"><strong>Ukuran</strong></td>
        							<td class="text-right"><strong>Harga</strong></td>
                                    <td class="text-right"><strong>Jasa Desain</strong></td>
                                    <td class="text-right"><strong>Sub Harga</strong></td>
                                </tr>
    						</thead>
    						<tbody>
    							<!-- foreach ($order->lineItems as $line) or some such thing here -->
    							<tr>
    								<td><?php echo $datapesanan->jenis;?></td>
    								<td class="text-center"><?php echo $datapesanan->jumlah;?></td>
    								<td class="text-center"><?php echo $datapesanan->panjang;?> x <?php echo $datapesanan->lebar;?></td>
    								<td class="text-right">Rp. <?php echo number_format($datapesanan->harga,'0','.','.');?></td>
                                    <td class="text-right"><?php if($datapesanan->jasa_desain=='N') {echo'Tidak'; } else { echo 'Ya';}?></td>
                                    <td class="text-right">Rp. <?php echo number_format($datapesanan->jumlah_bayar,'0','.','.');?></td>
    							</tr>
    							<tr>
    								<td class="no-line"></td>
    								<td class="no-line"></td>
                                    <td class="thick-line"></td>
                                    <td class="thick-line"></td>
    								<td class="no-line text-right"><strong>Total</strong></td>
    								<td class="no-line text-right">Rp. <?php echo number_format($datapesanan->jumlah_bayar,'0','.','.');?></td>
    							</tr>
    						</tbody>
    					</table>
                        <a href="<?php echo base_url()?>order-list" class="btn btn-primary pull-right">Kembali</a>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>