<?php 
$dt=$this->session->userdata('logged_in');
//var_dump($usr);
$getdt = $this->db->query("select a.*, b.* from kb_user_detail as a, kb_users as b where a.ID=b.ID and a.ID='".$dt['id']."'");
$r = $getdt->row();
?>
<div class="row">
<div class="col-lg-3 col-md-3 col-sm-12">
<div class="col-lg-12">
            		<span class="title">FOTO PROFIL </span>
                      <span id="status" ></span>
            	</div>
                <div class="col-lg-12 col-sm-12 hero-feature">
                <div id="files">
                        <img src="<?php echo $r->user_pic?>" class="img-thumbnail" height="100" width="100%"/>
                        </div>
                          <div id="upload" class="btn btn-success btn-sm" style="margin-top:10px; width:100%;" title="Pilih"><i class="fa fa-camera"></i> Ubah Foto  </div> 
				
                        </div>

        	</div>
        	
        	<div class="clearfix visible-sm"></div>
			<!-- Cart -->
        	<div class="col-lg-9 col-md-9 col-sm-12">
        		<div class="col-lg-12 col-sm-12">
            		<span class="title">PROFIL PELANGGAN <small class="pull-right"> E-Mail : <?php echo $r->user_email;?></small></span>
                     <div id="informasi" style="display:none;"></div>
            	</div>
                
                 <form role="form" id="profil_pelanggan" action="javscript:void(0);" method="post" enctype="multipart/form-data">
                 <input type="hidden" name="id_pelanggan" value="<?php echo $r->ID; ?>" class="form-control required" />
                  
	            <div class="col-lg-12 col-sm-12 hero-feature">
              	<p>Silahkan klik tombol update jika data profil anda sudah sesuai.</p>
                   
                    <table class="table table-bordered tbl-checkout">
                        <tbody>
                            <tr>
                                <td>Nama Lengkap</td>
                                <td>
                                    <input type="text" name="nama_lengkap" value="<?php echo $r->name; ?>" class="form-control required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Telepon</td>
                                <td>
                                    <input type="text" name="telp" value="<?php echo $r->phone; ?>" class="form-control required" />
                                </td>
                            </tr>
                            <tr>
                                <td>Alamat</td>
                                <td colspan="3">
                                    <textarea name="alamat" class="form-control required" rows="5"><?php echo $r->address;?></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="btn-group btns-cart">
                      <button type="submit" class="btn btn-success " id="sendProfil">Update</button>
                  </div><span id="preload" style="text-align:center;"></span>
	            </div>
                </form>
        	</div>
        	<!-- End Cart -->


        </div>