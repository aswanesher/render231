    <div class="pixfort_corporate_2" id="section_corporate_4">
		<div class="amazing_style pix_builder_bg" style="outline-offset: -3px;">
			<div class="container">
				<div class="sixteen columns">
					<div class="gstyle">
						<div class="t1_style">
							<span class="editContent" style=""><span class="pix_text"><?php echo $page_title;?></span></span>
						</div>
						<br>
					</div>
					<span>
						<?php //echo $page_content;?>
						<form action="daftar-agen" method="post">
						<input type="text" name="query1" value="<?php echo $qwords?>" id="name" placeholder="Cari agen berdasarkan kota lalu tekan enter" class="pix_text" style="width:99% !important;">
						</form>
						<table>
		                    <thead>
		                        <tr>
		                            <th>Kota</th>
		                            <th>Nama</th>
		                            <th>BBM</th>
		                            <th>Whatsapp</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                    	<?php 
		                    	foreach ($dftaragen as $rs) {
		                    	?>
		                        <tr>
		                            <td><?php echo $rs->address;?></td>
		                            <td><?php echo $rs->name;?></td>
		                            <td><?php echo $rs->bbm_pin;?></td>
		                            <td><?php echo $rs->whatsapp;?></td>
		                        </tr>
		                        <?php } ?>
		                    </tbody>
		                </table>
					</span>
					<br>
					<center><?php echo $this->pagination->create_links(); ?></center>
				</div>
			</div>
		</div>
	</div>
    <hr>
	