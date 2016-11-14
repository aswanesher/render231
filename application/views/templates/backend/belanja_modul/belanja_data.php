<link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/landings_layouts.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/skeleton.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/frontend/kaosnyabagus/stylesheets/landings.css">
        <script type="text/javascript">
            // To conform clear all data in cart.
            function clear_cart() {
                var result = confirm('Hapus Semua Data List Pesanan?');

                if (result) {
                    window.location = "<?php echo base_url('belanja/remove/all'); ?>";
                } else {
                    return false; // cancel button
                }
            }
        </script>
<div class="page-header">
		<h1>
			<?php echo $judul_panel;?>
			<?php if($tambah=='true') { ?>
			<a href="<?php echo base_url();?>belanja/belanja_add" class="btn-sm btn-success pull-right"><i class="ace-icon fa fa-pencil-square-o bigger-230"></i> Tambah data</a>
			<?php } ?>
		</h1>
	</div><!-- /.page-header -->
        <div id="cart" >
            
                <div id="text"> 
            <?php  $cart_check = $this->cart->contents();
            
            
             if(empty($cart_check)) {
             }  ?> </div>
            
                <table id="table" border="0" cellpadding="5px" cellspacing="1px" class="table table-striped table-bordered table-hover">
                  <?php
                   
                  if ($cart = $this->cart->contents()): ?>
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Harga</th>
                        <th>Jumlah</th>
                        <th>Total Harga</th>
                        <th>Batal</th>
                    </tr>
                    </thead>
                    <?php
                     
                    echo form_open(base_url('belanja/updatecart'));
                    $grand_total = 0;
                    $i = 1;

                    foreach ($cart as $item):
                        
                        echo form_hidden('cart[' . $item['id'] . '][id]', $item['id']);
                        echo form_hidden('cart[' . $item['id'] . '][rowid]', $item['rowid']);
                        echo form_hidden('cart[' . $item['id'] . '][name]', $item['name']);
                        echo form_hidden('cart[' . $item['id'] . '][price]', $item['price']);
                        echo form_hidden('cart[' . $item['id'] . '][qty]', $item['qty']);
                        ?>
                        <tr>
                            <td>
                       <?php echo $i++; ?>
                            </td>
                            <td>
                      <?php echo $item['name']; ?>
                            </td>
                            <td>
                                Rp. <?php echo number_format($item['price'], 2); ?>
                            </td>
                            <td>
                            <?php echo form_input('cart[' . $item['id'] . '][qty]', $item['qty'], 'maxlength="3" size="1" style="text-align: right"'); ?>
                            </td>
                        <?php $grand_total = $grand_total + $item['subtotal']; ?>
                            <td>
                                Rp. <?php echo number_format($item['subtotal'], 2) ?>
                            </td>
                            <td>
                              
                            <?php 
                            
                            $path = "<img src='".base_url()."/uploads/cart_cross.jpg' width='25px' height='20px'>";
                            echo anchor(base_url('belanja/remove/').'/' . $item['rowid'], $path); ?>
                            </td>
                     <?php endforeach; ?>
                    </tr>
                    <tr>
                        <td><b>Total Pesanan: Rp. <?php 
                        
                        
                        echo number_format($grand_total, 2); ?></b></td>
                        
                        
                        <td colspan="5" align="right">
                            <input type="button" class ='btn btn-empty btn-sm' value="Clear Cart" onclick="clear_cart()">
                            
                            <?php  ?>
                            <input type="submit" class ='btn btn-purple btn-sm' value="Update Cart">
                            <?php echo form_close(); ?>
                            
                            
                            <input type="button" class ='btn btn-success btn-sm' value="Proses Pesanan" onclick="window.location ='<?php echo base_url('belanja/view'); ?>'"></td>
                    </tr>
<?php endif; ?>
            </table>
        </div>

	<div class="row">
		<div class="col-xs-12">
			<div class="widget-box">
				<div class="widget-header widget-header-small">
					<h5 class="widget-title lighter">Pencarian</h5>
				</div>
                                    <div class="widget-body">
					<div class="widget-main">
						<form class="form-search" method="post" action="<?php echo base_url()?>belanja">
							<div class="row">
								<div class="col-xs-12 col-sm-8">
									<div class="input-group">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-user"></i>
									</span>
									<input type="text" class="form-control search-query" placeholder="Cari nama.." value="<?php echo $query1;?>" name="query1">

									<span class="input-group-addon">
									<i class="ace-icon fa fa-info-circle"></i>
									</span>
									<select class="form-control" id="form-field-select-1" name="status">
										<option value="">-- Status --</option>
										<option value="publish" <?php if($status=='publish') { echo "selected"; }?>>Publish</option>
										<option value="draft" <?php if($status=='draft') { echo "selected"; }?>>Draft</option>
									</select>

									<span class="input-group-addon">
									<i class="ace-icon fa fa-users"></i>
									</span>
									<select class="form-control" id="form-field-select-1" name="kategori">
										<option value="">-- Kategori --</option>
										<?php foreach ($kategorinya as $data) { ?>
											<option value="<?php echo $data->id_prod_category;?>" <?php if($kategori==$data->id_prod_category) { echo "selected"; }?>><?php echo $data->category; ?></option>
										<?php }?>
									</select>

									<span class="input-group-btn">
									<button type="submit" class="btn btn-purple btn-sm">
									<span class="ace-icon fa fa-search icon-on-right bigger-110"></span> Cari
									</button>
									</span>
									</div>
								</div>
							</div>
						</form>
					</div>
                                </div>
			</div>
		</div>
	</div>
        
        <div class="pixfort_real_estate_4" id="section_real_estate_4_2">
            <h2 id="head" align="center">Products</h2>
            <div class="container">
            <div class="sixteen columns">
            <?php             foreach ($belanja as $value) {
                ?>
                <div id='product_div' class="eight columns  alpha">
                    <div class="bloc_home">
                                    <div id='image_div'>
                                        <?php if($value->gambar_produk != '') { ?>
                        <img src="<?php echo base_url() . $value->gambar_produk ?>" class="Home_photo" alt=""/>
                                        <?php }  else {?>
                        <img src="<?php echo base_url()?>/uploads/.thumbs/images/no_images.jpg" class="Home_photo" alt=""/>
                                        <?php } ?>
                    </div>
                                    <div id='info_product'>
                        <div id='name' class="tit_info editContent"><?php echo $value->nama_produk; ?></div>
                        <div id='desc' class="txt_info editContent">  <?php echo $value->deskripsi; ?></div>
                        <div id='rs'><b>Harga</b>:<big style="color:green">
                            Rp.<?php echo number_format($value->harga, 0, ',', '.');?></big></div>
                        <?php
                        
                        // Create form and send values in 'shopping/add' function.
                        echo form_open(base_url('belanja/add'));
                        echo form_hidden('id', $value->id_produk);
                        echo form_hidden('name', $value->nama_produk);
                        echo form_hidden('price', $value->harga);
                        ?> </div> 
                                    <div id='add_button'>
                        <?php
                        $btn = array(
                            'class' => 'btn btn-green btn-sm',
                            'value' => 'Add to Cart',
                            'name' => 'action'
                        );
                        
                        // Submit Button.
                        echo form_submit($btn);
                        echo form_close();
                        ?>
                    </div>
                        </div>
            </div>
            <?php }?>
                <center><?php echo $this->pagination->create_links(); ?></center>
                </div>
        </div>
            </div>
        