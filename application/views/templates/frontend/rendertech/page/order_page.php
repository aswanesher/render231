<style type="text/css">
    .stepwizard-step p {
    margin-top: 0px;
    color:#666;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}
.stepwizard-step button[disabled] {
    /*opacity: 1 !important;
    filter: alpha(opacity=100) !important;*/
}
.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
    opacity:1 !important;
    color:#bbb;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content:" ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-index: 0;
}
.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}
</style>
<script type="text/javascript">
    $(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
        allWells = $('.setup-content'),
        allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-success').addClass('btn-default');
            $item.addClass('btn-success');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function () {
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url'],input[type='radio'],input[type='file'],textarea"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for (var i = 0; i < curInputs.length; i++) {
            if (!curInputs[i].validity.valid) {
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-success').trigger('click');
});
</script>
<div class="row">
            
            <div class="clearfix visible-sm"></div>
            <!-- Cart -->
            <div class="col-lg-9 col-md-9 col-sm-12">
                <div class="col-lg-12 col-sm-12">
                    <span class="title">FORM PEMESANAN</span>
                     <div id="informasi"></div>
                        <div style="display: none" id="notif">
                        </div>

                <div class="stepwizard">
                    <div class="stepwizard-row setup-panel">
                        <div class="stepwizard-step col-xs-4"> 
                            <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
                            <p><small>Data Pemesanan</small></p>
                        </div>
                        <div class="stepwizard-step col-xs-4"> 
                            <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                            <p><small>Metode Pembayaran</small></p>
                        </div>
                        <div class="stepwizard-step col-xs-4"> 
                            <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                            <p><small>Konfirmasi Pesanan</small></p>
                        </div>
                    </div>
                </div>
                
                <form role="form" id="formInsertPesanan" action="javascript:void(0)" method="post" enctype="multipart/form-data">
                    <div class="panel panel-primary setup-content" id="step-1">
                        <div class="panel-heading">
                             <h3 class="panel-title">Data Pemesanan</h3>
                             <p>Silahkan lengkapi form di bawah ini untuk melakukan pemesanan produk kami.</p>
                        </div>
                        <div class="alert alert-danger fade in alert-dismissable" style="display: none;" id="infonya">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
                            <strong>Maaf,</strong> Stok bahan tidak mencukupi.
                        </div>
                        <div class="panel-body">
                            <table class="table table-bordered ">
                                <tbody>
                                    <tr>
                                        <td colspan="4"><b>(*) Wajib diisi</b></td>
                                    </tr>
                                    <tr>
                                        <td width="23.5%">Menggunakan jasa desain ?</td>
                                        <td colspan="3">
                                             <button type="button" name="jasa" class="btn btn-xs btn-danger" id="jasa"><i class="fa fa-close"></i> Tidak</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Jenis Produk</td>
                                        <td colspan="3">
                                            <input type="hidden" name="id_produk" value="<?php echo $idp;?>" />
                                            <input type="hidden" name="kodeJasa" class="kodeJasa" value="N">
                                            <input type="hidden" name="hargaJasa" class="hargaJasa" id="hargaJasa" value="0">
                                            <input type="text" name="jenis" value="<?php echo $nama_produk;?>" readonly class="form-control" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ukuran (*)</td>
                                        <td colspan="1">
                                        <div class="input-group" style="width:100%;">
                                            <span class="input-group-addon"  >Panjang</span>
                                            <input type="text" name="panjang" id="panjang"  maxlength="4" onkeypress="return angka(event)" class="form-control" placeholder="Panjang" required />
                                                    </div>
                                        </td>
                                        <td colspan="1" style="width:10px; text-align:center;" valign="middle">
                                        <h5>X</h5>
                                        </td>
                                        <td colspan="1">
                                        <div class="input-group" style="width:100%;">
                                                        <span class="input-group-addon">Lebar &nbsp; &nbsp; &nbsp;</span>
                                        <input type="text" name="lebar" id="lebar" maxlength="4" onkeypress="return angka(event)" class="form-control" placeholder="Lebar" required/>
                                        </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Bahan (*)</td>
                                        <td colspan="3">
                                            <select type="text" name="id_bahan" id="id_bahan" class="form-control" required>
                                            <option value="">Pilih Bahan--</option>
                                            <?php 
                                            foreach ($bahan as $bhn) {
                                                if($bhn->qty<1||$bhn=="") {
                                                    echo "";
                                                } else {
                                            ?> 
                                            <option value="<?php echo $bhn->id_bahan;?>"><?php echo $bhn->jenis_bahan;?> - <?php echo "Rp. ".number_format($bhn->harga,"0",".",".");?> /m</option>
                                            <?php } } ?>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Jumlah (*)</td>
                                        <td colspan="3">
                                        <input type="text" name="jumlah" value="1" min="1" id="jumlah" style="width:100px;" class="input-qty form-control text-center" required/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Harga</td>
                                        <td colspan="3">
                                            <input type="text" name="harga1" readonly class="form-control" value="" id="harga1" />
                                            <input type="hidden" name="harga" readonly class="form-control" id="harga" />
                                        </td>
                                    </tr>
                                    </tbody>
                                    </table>
                                    <div id="fieldJasa" style="display:none;">
                                    <table class="table table-bordered ">
                                    <tr>
                                        <td width="23.5%">Model (*)</td>
                                        <td colspan="3">
                                            <!--<select name="id_model" class="form-control" id="id_model" >
                                            <option value="">Pilih Model--</option>
                                            <?php 
                                            $sql = mysqli_query($link,"SELECT * FROM tbl_model"); 
                                            while($dta = mysqli_fetch_object($sql)){
                                            ?>
                                            <option value="<?=$dta->id_model;?>"><?=$dta->nama;?></option>
                                            <?php } ?>
                                            </select>
                                            <div id="gambar"></div>-->
                                            <?php foreach($model as $mdl) {?>
                                                <img src="<?php echo $mdl->gambar;?>" width="280px">
                                                <label class="radio-inline"><input type="radio" name="id_model" id="id_model" value="<?php echo $mdl->id_model?>"> <?php echo $mdl->nama;?></label>
                                            <?php } ?>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="23.5%">Gambar 1 (*)</td>
                                        <td colspan="3">
                                        <input type="file" name="gbr1" id="gbr1" accept=".jpg,.png" class="form-control"/>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td width="23.5%">Gambar 2 (*)</td>
                                        <td colspan="3">
                                        <input type="file" name="gbr2" id="gbr2" accept=".jpg,.png" class="form-control"/>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td width="23.5%">Gambar 3 (*)</td>
                                        <td colspan="3">
                                        <input type="file" name="gbr3" id="gbr3" accept=".jpg,.png" class="form-control"/>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td>Judul (*)</td>
                                        <td colspan="3">
                                         <input type="text" name="judul" class="form-control" id="judul">
                                       </td>
                                    </tr>
                                    <tr>
                                        <td>Isi (*)</td>
                                        <td colspan="3">
                                         <textarea name="isi" class="form-control" id="isi" rows="5"></textarea>
                                       </td>
                                    </tr>
                                    </table>
                                    </div>
                                    <div id="tanpajasadesign">
                                    <table class="table table-bordered ">
                                    <tr>
                                        <td width="23.5%">File (*)</td>
                                        <td colspan="3">
                                        <input type="file" name="file" id="filenya" accept=".jpg,.png" class="form-control" required="required"/>
                                       </td>
                                    </tr>
                                    <tr>
                                        <td>Keterangan (*)</td>
                                        <td colspan="3">
                                       
                                       <textarea name="keterangan" class="form-control" rows="5" id="keterangannya" required="required"></textarea>
                                        
                                       </td>
                                    </tr>
                                
                                    </table>
                                    </div>
                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                        </div>
                    </div>
                    
                    <div class="panel panel-primary setup-content" id="step-2">
                        <div class="panel-heading">
                             <h3 class="panel-title">Pilih Metode Pembayaran</h3>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="control-label">Metode Pembayaran</label><br>
                                <input type="radio" name="cara_bayar" id="cara_bayar" value="bank" required> Antar Bank<br>
                                <input type="radio" name="cara_bayar" id="cara_bayar" value="onsite" required> Bayar Di Tempat<br>
                                <input type="radio" name="cara_bayar" id="cara_bayar" value="cod" required> Cash On Delivery<br>
                            </div>
                            <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
                        </div>
                    </div>
                    
                    <div class="panel panel-primary setup-content" id="step-3">
                        <div class="panel-heading">
                             <h3 class="panel-title">Konfirmasi Pesanan</h3>
                        </div>
                        <div class="panel-body">
                            <div class='alert alert-danger alert-block'>
                                <h4><i class='fa fa-bell-alt'></i>Catatan!</h4>
                                <p>Pesanan Anda akan segera kami proses, mohon untuk segera melaksanakan pelunasan tagihan melalui No. Rekening berikut :</p>
                            </div>
                            <!-- WIDGET BANK -->
                            <?php 
                            if(!empty($bank_widget)) {
                                $this->load->view($temp.'widget/bank_widget');
                            }   
                            ?>
                            <!-- END WIDGET BANK -->
                            <button class="btn btn-success pull-right" type="submit" id="tblpesan"><span id="preload" style="text-align:center;"></span> Konfirmasi Pesanan</button>
                            
                        </div>
                    </div>
                    <div class='alert alert-info alert-block'>
                    <h4><i class='fa fa-bell-alt'></i>Catatan!</h4>
                    <p>Jika menggunakan jasa desain, foto yang di upload dalam bentuk file .jpg atau .png. <br>Dan untuk keterangan mohon di isi dengan jelas. Terima Kasih..</p>
                    </div>
                
                </form>     
                </div>
                 <!--<form role="form" id="formInsertPesanan" action="javascript:void(0)" method="post" enctype="multipart/form-data">
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
                                    <input type="text" name="jenis" value="" readonly class="form-control" />
                                </td>
                            </tr>
                            <tr>
                                <td>Ukuran</td>
                                <td colspan="1">
                                <div class="input-group" style="width:100%;">
                                                <span class="input-group-addon"  >Panjang</span>
                                    <input type="text" name="panjang" id="panjang"  maxlength="4" onkeypress="return angka(event)" class="form-control" placeholder="Panjang" />
                                            </div>
                                </td>
                                <td colspan="1" style="width:10px; text-align:center;" valign="middle">
                                <h5>X</h5>
                                </td>
                                <td colspan="1">
                                <div class="input-group" style="width:100%;">
                                                <span class="input-group-addon">Lebar &nbsp; &nbsp; &nbsp;</span>
                                <input type="text" name="lebar" id="lebar" maxlength="4" onkeypress="return angka(event)" class="form-control" placeholder="Lebar"/>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Bahan</td>
                                <td colspan="3">
                                    <select type="text" name="id_bahan" id="id_bahan" class="form-control" >
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
                                    <input type="text" name="harga1" readonly class="form-control" value="" id="harga1" />
                                    <input type="hidden" name="harga" readonly class="form-control" id="harga" />
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
                                <input type="file" name="file"  accept=".zip,.rar" id="file" class="form-control" />
                               </td>
                            </tr>
                            <tr>
                                <td>Keterangan</td>
                                <td colspan="3">
                               
                               <textarea name="keterangan" class="form-control" rows="5"></textarea>
                                
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
                </form>-->
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
        </div>