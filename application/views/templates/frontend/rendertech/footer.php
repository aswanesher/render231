<footer>
    	<div class="container">
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Information</h4>
        			<ul>
        				<li><a href="<?php echo base_url();?>p/tentang-kami">Tentang Kami</a></li>
        				<li><a href="<?php echo base_url();?>p/kontak">Kontak Kami</a></li>
        				<li><a href="<?php echo base_url();?>p/metode-pembayaran">Metode Pembayaran</a></li>
        				<li><a href="<?php echo base_url();?>p/cara-pemesanan">Cara Pemesanan </a></li>
        			</ul>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Products</h4>
        			<ul>
        				<?php
						/*$sql_p = mysqli_query($link,"SELECT * FROM tbl_produk ORDER BY rand() ASC LIMIT 4");
						while($dta_p = mysqli_fetch_object($sql_p)){*/
						?>
						<li><a href="Detail-Data-Produk-<?php //$function->base64Encrypt($dta_p->id_produk);?>"><?php //$dta_p->jenis;?></a></li>
						<?php //} ?>
        			</ul>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Customer Service</h4>
        			<ul>
        				<li><a href="contact.html">Kontak Kami</a></li>
        				<li><a href="#">YM: cs_</a></li>
        				<li><a href="#">Phone: +6285340778770</a></li>
        				<li><a href="#">Email: cs.domain@domain.tld</a></li>
        			</ul>
        		</div>
        	</div>
        	<div class="col-lg-3 col-md-3 col-sm-6">
        		<div class="column">
        			<h4>Ikuti Kami</h4>
        			<ul class="social">
        				<li><a href="#">Google Plus</a></li>
        				<li><a href="#">Facebook</a></li>
        				<li><a href="#">Twitter</a></li>
        				<li><a href="#">RSS Feed</a></li>
        			</ul>
        		</div>
        	</div>
        </div>
        <div class="navbar-inverse text-center copyright">
        	Copyright &copy; <? //date('Y');?> Render Tech Production. All Right Reserved.
        </div>
    </footer>

    <a href="#top" class="back-top text-center" onclick="$('body,html').animate({scrollTop:0},500); return false">
    	<i class="fa fa-angle-double-up"></i>
    </a>

  <script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/jquery.js"></script>
	<!--<script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/chat.js"></script>-->
  <script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/bootstrap.js"></script>
  <script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/jquery.bxslider.min.js"></script>
  <script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/jquery.blImageCenter.js"></script>
	<script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/bootstrap.touchspin.js"></script>
  <script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/jquery.zoom.min.js"></script>
  <script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/mimity.js"></script>
	<script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/jquery.validate.js"></script>
  <!--<script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/ajaxupload.3.5.js"></script>-->
	<script src="<?php echo base_url();?>assets/frontend/rendertech/lib/js/script.js"></script>
	<script>
		function get(content){
			$('#confirmDelete').on('show.bs.modal', function(e) {
				$(this).find('#rD').attr('value', $(e.relatedTarget).data('href'));
				$('.debug-data').html('Hapus Produk: <strong>' + content + '</strong> ?');
			});
		}
	</script>
    <div class="modal fade" id="modalFormPesanan">
	<form method="post" id="formUpdatePesanan" action="javascript:void(0)"  enctype="multipart/form-data">
	<input type="hidden" name="hargaJasa" class="hargaJasa" id="hargaJasa" >
	
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Form Update Pesanan</h4>
        </div>
        <div class="modal-body">
		
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label for="jenis_produk" class="control-label">Jenis Produk</label>
					<input type="text" name="jenis_produk" class="form-control required" id="jenis_produk" readonly placeholder="Jenis Produk">
					<input type="hidden" name="id_tampung_pemesanan" class="form-control" id="id_tampung_pemesanan">
					<input type="hidden" name="harga" readonly class="form-control required" id="harga" />
				</div>
			</div>
		</div>
          <div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="panjang" class="control-label">Panjang</label>
					<input type="text" class="form-control required" name="panjang" onkeypress="return angka(event)" id="panjang" placeholder="Panjang">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="lebar" class="control-label">Lebar</label>
					<input type="text" class="form-control" name="lebar" onkeypress="return angka(event)" id="lebar" placeholder="Lebar">
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="id_bahan" class="control-label">Bahan</label>
					<select class="form-control required" name="id_bahan" id="id_bahan">
						<option value="">Pilih Bahan--</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="jumlah" class="control-label">Jumlah</label>
					<input type="text" class="input-qty text-center form-control required" min="1" id="jumlah" name="jumlah" placeholder="Jumlah">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group no-margin">
					<label for="keterangan" class="control-label">Keterangan</label>
					<textarea class="form-control autogrow required" id="keterangan" name="keterangan" placeholder="Keterangan" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 104px;"></textarea>
				</div>
			</div>
		</div>
        </div>
        <div class="modal-footer">
		<span id="preload" style="text-align:center;"></span>
		<input type="text" name="harga1" readonly class="form-control required pull-left" style="width:150px; text-align:center;" value="<? //$function->rupiah1(0);?>" id="harga1" />
			<button type="button" class="btn btn-default " data-dismiss="modal">Tutup</button>
			<button type="submit" class="btn btn-info" >Update</button>
		</div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
	</form>
  </div>
  
  <div class="modal fade" id="confirmDelete">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Konfirmasi Hapus</h4>
        </div>
        <div class="modal-body">
		<input type="hidden" value="" id="rD" >
          <p>Anda akan menghapus satu data dari keranjang belanja, prosedur ini tidak dapat dikembalikan.</p>
           <p>Anda yakin untuk menghapus?</p>
            <p class="debug-data"></p>
        </div>
        <div class="modal-footer">
         <a class="btn btn-default " data-dismiss="modal" >Batal</a>
          <a class="btn btn-danger btn-delete" data-dismiss="modal">Hapus</a>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <div class="modal fade" id="berhentiMember">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Konfirmasi Berhenti Member</h4>
        </div>
        <div class="modal-body">
		<div id="informasi" style="display:none;"></div>
		<span id="preload"></span>
          <p>Anda yakin akan berhenti jadi member ?</p>
            <p class="debug-data"></p>
        </div>
        <div class="modal-footer">
         <a class="btn btn-default " data-dismiss="modal" >Batal</a>
          <a class="btn btn-danger btn-stop" href="javascript:void(0);" >Submit</a>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  
   <div class="modal fade" id="updateDeposit">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Update Deposit</h4>
        </div>
        <div class="modal-body">
		<div id="informasiDeposit" style="display:none;"></div>
<div id="preload1" align="center"></div>
<div id="wait" style="display:none;"></div>
<?php
//$sql_10 = mysqli_fetch_object(mysqli_query($link,"SELECT * FROM tbl_deposit WHERE id_pelanggan = '".$_SESSION['sesi_id_pelanggan_render_tech_production']."'"));
?>
           <form role="form" id="formUpdateDeposit" method="post" action="javascript:void(0);">
			  <input type="hidden" class="form-control"  name="id_pelanggan" value="<? //=$_SESSION['sesi_id_pelanggan_render_tech_production'];?>"required>
			  <input type="hidden" name="id_deposit" value="<? //$sql_10->id_deposit;?>" required>
			   
				   <div class="form-group">
					<div class="input-group login-input">
						<span class="input-group-addon">Rp</span>
						<span><input type="text" class="form-control" data-parsley-min="50000" data-parsley-type="number" name="deposit" placeholder="Jumlah Update Deposit" required>
						</span>
					</div>
				</div>
        </div>
        <div class="modal-footer">
         <a class="btn btn-default " data-dismiss="modal" >Batal</a>
         <button type="submit" class="btn btn-success pull-right"><span class="semibold">Submit</span></button>
        </div>
		</form>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  
</body>

<!-- Mirrored from demo.18maret.com/demo/mimity/v1.4/index.html by HTTrack Website Copier/3.x [XR&CO'2013], Wed, 09 Mar 2016 12:22:01 GMT -->
</html>