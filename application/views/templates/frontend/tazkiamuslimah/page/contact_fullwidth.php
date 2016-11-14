<!-- / Contact section -->
<section class="contact-section contact-section-3">
	<div class="container">
		<h2 class="title"><?php echo $page_title;?></h2>
		<?php echo $page_content;?>	
	</div>
	
	<div class="container contact-info">
		<div class="row">
			<div class="col-md-4">
				<div class="icon"><i class="fa fa-map-marker"></i></div>
				<h2 class="title small">Alamat</h2>
				<p class="title-sub"><?php 
                echo $address;
                ?></p>
			</div>
			<div class="col-md-4">
				<div class="icon"><i class="fa fa-phone"></i></div>
				<h2 class="title small">Telepon</h2>
				<p class="title-sub"><?php echo $phone;?><br><?php echo $cellphone;?></p>
			</div>

			<div class="col-md-4">
				<div class="icon"><i class="fa fa-envelope-o"></i></div>
				<h2 class="title small">Email</h2>
				<p class="title-sub"><a href="mailto:abc@xyz.com"><?php echo $contact_email;?></a></p>
			</div>
		</div>
	</div><!-- / container -->
	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2351.9555921926817!2d110.22590438504766!3d-7.520086999585959!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a8ed6d8074231%3A0xd730f96cf1614115!2sJl.+Mayjen+Bambang+Soegeng%2C+Sumberrejo%2C+Mertoyudan%2C+Magelang%2C+Jawa+Tengah!5e0!3m2!1sid!2sid!4v1465961935782" width="100%" height="500" frameborder="0" style="border:0" allowfullscreen=""></iframe>
	
	<div class="contact-form">
		<div class="container">
			<!-- Popup contact form - 1 -->
			<div id="contact-form" class="form-block">
				<h2 class="title">Kirim Pesan Anda</h2>

				<form action="<?php echo base_url()?>sendemail/kirim" class="form-widget" novalidate="novalidate">
					<input type="hidden" name="to" value="<?php echo $contact_email?>">
					<div class="row">
						<div class="col-md-6 l">
							<input class="form-control" data-label="Nama" required="" data-msg="Masukkan nama." type="text" name="name" placeholder="Masukkan nama" aria-required="true">		
							<input class="form-control" data-label="Email" required="" data-msg="Masukkan alamat email." type="email" name="email" placeholder="Masukkan alamat email" aria-required="true">
						</div>
						<div class="col-md-6 r">
							<textarea class="form-control" data-label="Message" required="" data-msg="Masukkan pesan." name="message" placeholder="Masukkan pesan" aria-required="true"></textarea>
						</div>
					</div>
					<button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> Kirim</button>
				</form><!-- / form -->
				<div class="msg-block"></div>
			</div><!-- /#popup-contact-form -->
		</div>	
	</div>		
</section><!-- /contact-section -->