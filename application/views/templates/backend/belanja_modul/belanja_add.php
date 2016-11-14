<div class="page-header">
<h1>
	<?php echo $judul_panel;?>
</h1>
</div><!-- /.page-header -->

<div id="cart" >
            
                <div id="text"> 
            <?php  $cart_check = $this->cart->contents();
            
            // If cart is empty, this will show below message.
             if(empty($cart_check)) {
             }  ?> </div>
            
                <table id="table" border="0" cellpadding="5px" cellspacing="1px" class="table table-striped table-bordered table-hover">
                  <?php
                  // All values of cart store in "$cart". 
                  if ($cart = $this->cart->contents()): ?>
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama</th>
                        <th>Harga</th>
                        <th>Jumlah</th>
                        <?php if($idres != ''){ ?>
                        <th>Diskon (%)</th>
                        <?php } ?>
                        <th>Total Harga</th>
                    </tr>
                    </thead>
                    <?php
                     // Create form and send all values in "shopping/update_cart" function.
                    echo form_open(base_url('belanja/save'));
                    $grand_total = 0;
                    $i = 1;
                    echo form_hidden('reseller', $idres);
                    foreach ($cart as $item):
                        //   echo form_hidden('cart[' . $item['id'] . '][id]', $item['id']);
                        //  Will produce the following output.
                        // <input type="hidden" name="cart[1][id]" value="1" />
                        
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
                            <?php echo $item['qty']; ?>
                            </td> <?php if($idres != ''){ ?>
                            <td><?php $diskon = $this->diskon_reseller_model->get_diskon_($item['id'],$idres,$item['qty']);
                                    if(is_object($diskon)) {
                                  //      if($item['qty'] >= $diskon->min_beli) {
                                        $dis = $diskon->diskon;
                                        echo $dis;
                                 //       }
                                 //       else {
                                 //      $dis = 0; 
                                   //    echo $dis;   
                                   //     }
                                    }
                                    else {
                                       $dis = 0; 
                                       echo $dis;
                                    }
                            ?></td> 
                        <?php $grand_total = $grand_total + ($item['subtotal']-($item['subtotal']*$dis)/100); ?>
                            <td>
                                Rp. <?php echo number_format(($item['subtotal']-($item['subtotal']*$dis)/100), 2) ?>
                            </td><?php }
                            else {
                                $grand_total = $grand_total +($item['subtotal']); ?>
                            <td>
                                Rp. <?php echo number_format($item['subtotal'], 2) ?>
                            </td>
                            <?php }?>
                     <?php endforeach; ?>
                    </tr>
                    <tr>
                        <td><b>Total Pesanan: Rp. <?php 
                        
                        //Grand Total.
                        echo number_format($grand_total, 2); ?></b></td>
                        <?php if($idres != ''){ ?>
                        <td colspan="5" align="right">
                            <input type="hidden" name="total" value="<?=$grand_total;?>"/>
                        <input type="submit" class ='btn btn-purple btn-sm' value="Selesai"></td> <?php } ?>
                            <?php echo form_close(); ?>
                    </tr>
<?php endif; ?>
            </table>
        </div>

<div class="row">
    
<div class="col-xs-12">
	<!-- PAGE CONTENT BEGINS -->
         
        
	<form class="form-horizontal" role="form" action="<?php echo base_url('belanja/view');?>" method="post" enctype="multipart/form-data">

            <div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1">Reseller</label>

			<div class="col-sm-3">
			 <select id="id_reseller" name="id_reseller" class="form-control" required>
			 <option value="">Please Select</option>
			<?php
			foreach ($reseller as $m) {
			?>
                        <option value="<?php echo $m->id?>" <?php  if($idres == $m->id) {echo "selected";} ?>><?php echo ucfirst($m->name);?></option>
			 <?php } ?>
			</select>
			
			</div>
		</div>
            <div class="clearfix form-actions">
			<div class="col-md-offset-3 col-md-9">
				<button class="btn btn-info" type="submit">
					<i class="ace-icon fa fa-check bigger-110"></i>
					Proses
				</button>

				&nbsp; &nbsp; &nbsp;
				<a class="btn" href="<?php echo base_url('belanja'); ?>">
					<i class="ace-icon fa fa-undo bigger-110"></i>
					Batal
				</a>
			</div>
		</div>
	</form>
</div><!-- /.col -->
</div>