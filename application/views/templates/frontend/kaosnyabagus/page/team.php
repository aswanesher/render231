<div class="pixfort_normal_1" id="section_normal_4_2">
        <div class="m6_style pix_builder_bg">
            <div class="container">
                <div class="sixteen columns">
                    <div class="sixteen columns  omega">
                        <div class="gtext_style">
                            <center><p class="t1_style editContent"><?php echo $page_title;?></p></center>
                            <?php echo $page_content;?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- WIDGET ARTIKEL -->
    <?php 
    if(!empty($team_widget)) {
        $this->load->view($temp.'widget/team_widget');
    }   
    ?>
    <!-- END WIDGET ARTIKEL -->
	<div class="section_pointer" pix-name="9_ebook"></div><div class="pixfort_corporate_2" id="section_corporate_9">
		<div class="contact_section pix_builder_bg">
			<div class="container">
				<div class="sixteen columns pix_inline_block">
					<div class="eight columns  alpha">
						<div class="headtext_style"><span class="editContent"><span class="pix_text">Kantor kami</span></span></div>
						<p class="subtext_style editContent">Jl. Terusan Sarijadi No. 123 Sukasari - Sarijadi, Bandung</p>
						<div class="plan">
							<!--<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d83998.91163207508!2d2.3470599!3d48.85885894999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis%2C+France!5e0!3m2!1sen!2s!4v1408382253934" style="border:0"></iframe>-->
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d832.7177652168317!2d107.57743362808026!3d-6.879153608060341!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68e683210a01f5%3A0xcc9bdbd66fcc0f9f!2sKaosnyabagus!5e0!3m2!1sid!2sid!4v1463797885043" style="border:0" allowfullscreen></iframe>
						</div>
					</div>
					<div class="eight columns omega">
						<div class="contact_zone">
							<div class="headtext_style"><span class="editContent"><span class="pix_text">Kirim Pesan</span></span></div>
							<p class="subtext_style editContent">Tim kami akan siap membantu anda.</p>
							<div class="contact_st">
								<form id="contact_form" class="kirim_pesans" pix-confirm="hidden_pix_2" action="sendemail" method="post">
									<div id="result"></div>
									<input type="text" name="name" id="name" placeholder="Nama anda" class="pix_text">
									<input type="text" name="company" id="company" placeholder="Perusahaan/Fanspage anda" class="pix_text">
									<input type="text" name="phone" id="phone" placeholder="Telpon/No.Handphone anda" class="pix_text">
									<textarea rows="5" name="message" class="text_area pix_text" placeholder="Ketik pesan anda disini"></textarea>
									<button type="submit" class="subscribe_btn submit_btn_landing pix_text" id="subscribe_btn_2">
										<span class="editContent">Kirim sekarang</span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div><!-- container -->
		</div>
	</div>
	<div id="hidden_pix_2" class="confirm_page confirm_page_2">
		<div class="pixfort_corporate_2 big_padding">
			<div class="confirm_header"><span class="editContent"><span class="pix_text">Terima Kasih</span></span></div>
			<div class="confirm_text">
				<span class="editContent"><span class="pix_text">Pesan anda telah terkirim. Kami akan membalas pesan anda secepatnya.</span></span>
			</div>
			<div class="center_text padding_bottom_60">
                <ul class="bottom-icons confirm_icons center_text big_title pix_inline_block">
                    <li><a class="pi pixicon-facebook6 white" href="#fakelink"></a></li>
                    <li><a class="pi pixicon-twitter6 white" href="#fakelink"></a></li>
                    <li><a class="pi pixicon-googleplus7 white" href="#fakelink"></a></li>
                </ul>
            </div>
		</div>
	</div>
	
