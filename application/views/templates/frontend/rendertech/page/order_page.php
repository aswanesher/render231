<div class="row">
            
            <div class="clearfix visible-sm"></div>
            <!-- Cart -->
            <div class="col-lg-9 col-md-9 col-sm-12">
                <div class="col-lg-12 col-sm-12">
                    <span class="title">FORM PEMESANAN</span>
                     <div id="informasi"></div>
                </div>
                 <form role="form" id="formInsertPesanan" action="javascript:void(0)" method="post" enctype="multipart/form-data">
                <div class="col-lg-12 col-sm-12 hero-feature">
                    <p>Silahkan lengkapi form di bawah ini untuk melakukan konfirmasi pembayaran pada kami.</p>
                   <input type="hidden" value="" name="maxupload" id="maxupload" >
                    <input type="hidden" value="" name="hargaJ" id="hargaJ" >
                    <table class="table table-bordered ">
                        <tbody>
                            <tr>
                                <td>Jenis Produk</td>
                                <td colspan="3">
                                    <input type="hidden" name="id_produk" value="<? //$sql_dta->id_produk;?>" />
                                    <input type="hidden" name="kodeJasa" class="kodeJasa" value="N">
                                    <input type="hidden" name="hargaJasa" class="hargaJasa" id="hargaJasa" value="0">
                                    <input type="text" name="jenis" value="" readonly class="form-control required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Ukuran</td>
                                <td colspan="1">
                                <div class="input-group" style="width:100%;">
                                                <span class="input-group-addon"  >Panjang</span>
                                    <input type="text" name="panjang" id="panjang"  maxlength="4" onkeypress="return angka(event)" class="form-control required" placeholder="Panjang" />
                                            </div>
                                </td>
                                <td colspan="1" style="width:10px; text-align:center;" valign="middle">
                                <h5>X</h5>
                                </td>
                                <td colspan="1">
                                <div class="input-group" style="width:100%;">
                                                <span class="input-group-addon">Lebar &nbsp; &nbsp; &nbsp;</span>
                                <input type="text" name="lebar" id="lebar" maxlength="4" onkeypress="return angka(event)" class="form-control required" placeholder="Lebar"/>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Bahan</td>
                                <td colspan="3">
                                    <select type="text" name="id_bahan" id="id_bahan" class="form-control required" >
                                    <option value="">Pilih Bahan--</option>
                                    <?php 
                                    $sql = mysqli_query($link,"SELECT * FROM tbl_bahan"); 
                                    while($dta = mysqli_fetch_object($sql)){
                                    ?>
                                    <option value="<?=$dta->id_bahan;?>"><?=$dta->jenis_bahan;?> - <?=$function->rupiah($dta->harga);?> /m</option>
                                    <?php } ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Jumlah</td>
                                <td colspan="3">
                                <input type="text" name="jumlah" value="1" min="1" id="jumlah" style="width:100px;" class="input-qty form-control text-center" />
                                </td>
                            </tr>
                            <tr>
                                <td>Harga</td>
                                <td colspan="3">
                                    <input type="text" name="harga1" readonly class="form-control required" value="" id="harga1" />
                                    <input type="hidden" name="harga" readonly class="form-control required" id="harga" />
                                </td>
                            </tr>
                            <tr>
                                <td width="23.5%">Menggunakan jasa desain </td>
                                <td colspan="3">
                                     <button type="button" name="jasa" class="btn btn-xs btn-danger" id="jasa"><i class="fa fa-close"></i></button>
                                </td>
                            </tr>
                            </tbody>
                            </table>
                            <div id="fieldJasa" style="display:none;">
                           <table class="table table-bordered ">
                            <tr>
                                <td width="23.5%">Model</td>
                                <td colspan="3">
                                    <select name="id_model" class="form-control" id="id_model" >
                                    <option value="">Pilih Model--</option>
                                    <?php 
                                    $sql = mysqli_query($link,"SELECT * FROM tbl_model"); 
                                    while($dta = mysqli_fetch_object($sql)){
                                    ?>
                                    <option value="<?=$dta->id_model;?>"><?=$dta->nama;?></option>
                                    <?php } ?>
                                    </select>
                                    <div id="gambar"></div>
                                </td>
                            </tr>
                             <tr>
                                <td>Judul</td>
                                <td colspan="3">
                                 <input type="text" name="judul" class="form-control" id="judul" >
                               </td>
                            </tr>
                            <tr>
                                <td>Isi</td>
                                <td colspan="3">
                                 <textarea name="isi" class="form-control" id="isi" rows="5"></textarea>
                               </td>
                            </tr>
                            </table>
                            </div>
                            <table class="table table-bordered ">
                            <tr>
                                <td width="23.5%">File</td>
                                <td colspan="3">
                                <input type="file" name="file"  accept=".zip,.rar" id="file" class="form-control required" />
                               </td>
                            </tr>
                            <tr>
                                <td>Keterangan</td>
                                <td colspan="3">
                               
                               <textarea name="keterangan" class="form-control required" rows="5"></textarea>
                                
                               </td>
                            </tr>
                        
                    </table>
                    <div class='alert alert-info alert-block'>
                                    <h4><i class='fa fa-bell-alt'></i>Catatan!</h4>
                                    <p>Jika menggunakan jasa desain, foto yang di upload dalam bentuk file zip urutan foto harus sesuai. <br>Dan untuk keterangan mohon di isi dengan jelas. Terima Kasih..</p>
                                  </div>
                    <div class="btn-group btns-cart">
                      <button type="submit" class="btn btn-success" id="addCart"><i class="fa fa-shopping-cart"></i> Simpan Ke Keranjang</button>
                  </div><span id="preload" style="text-align:center;"></span>
                </div>
                </form>
            </div>
            <!-- End Cart -->
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