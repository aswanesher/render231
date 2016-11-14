// JavaScript Document
$(document).ready(function(e){
	//----------------------------------------------Proses Form Pesanan-------------------------------------------//
	$("#panjang").keyup(function(){ 
		hitungPesanan();
	});
	$("#lebar").keyup(function(){ 
		hitungPesanan();
	});
	$("#id_bahan").change(function(){ 
		hitungPesanan();
	});
	$("#jumlah").change(function(){ 
		hitungPesanan();
	});
	//--Change Model Jasa--//
	$("#id_model").change(function(){ 
    	var id_model = $("#id_model").val(); 
		$.ajax({
			type		: "GET",
			url			: "con_/loadModel.php",    
			data		: "id_model=" + id_model,
			dataType	: "json",
			success		: function(json){ 
				var status  = json.status;
				var data    = json.data;
				if(status == "not_null"){
					$("#gambar").html('<img src="lib_/images/model/'+data+'" width="100%" height="320">');
				}else{
					$("#gambar").html('');
				}
			}
		});
	});
	//--Button If Use Jasa--//
	$("#jasa").click(function(){ 
		var kodeJasa = $(".kodeJasa").val(); 
		var hargaJ = $("#hargaJ").val(); 
		var btn = $("#jasa"); 
		if(kodeJasa == "N"){
			$("#fieldJasa").show();
			$(".kodeJasa").val('Y'); 
			$(".hargaJasa").val(hargaJ); 
			btn.removeClass('btn btn-xs btn-danger');
			btn.addClass('btn btn-xs btn-success');
			btn.html('<i class="fa fa-check"></i>');
			$("#id_model").removeClass('form-control');
			$("#id_model").addClass('form-control required');
			$("#judul").removeClass('form-control');
			$("#judul").addClass('form-control required');
			$("#isi").removeClass('form-control');
			$("#isi").addClass('form-control required');
			hitungPesanan();
		}else{
			$("#id_model").val($("#id_model option:contains('Pilih Model--')").val());
			$("#gambar").html('');
			$("#fieldJasa").hide();
			$(".kodeJasa").val('N');
			$(".hargaJasa").val('0'); 
			btn.removeClass('btn btn-xs btn-success');
			btn.addClass('btn btn-xs btn-danger');
			btn.html('<i class="fa fa-close"></i>'); 
			$("#id_model").removeClass('form-control required');
			$("#id_model").addClass('form-control');
			$("#judul").removeClass('form-control required');
			$("#judul").addClass('form-control');
			$("#isi").removeClass('form-control required');
			$("#isi").addClass('form-control');
			hitungPesanan();
		}
	});
	//--Tipe File Validation--//
	$("#file").change(function() {
		var msize =  $('#maxupload').val();
		var ftype = $('#file')[0].files[0].type; // get file type
		var fsize = $('#file')[0].files[0].size; //get file size
		if(!(ftype=="")) {
			$('body,html').animate({
				scrollTop: 0
			});
			$("#informasi").fadeIn(1000);
			$("#informasi").html("<div class='alert alert-danger alert-block'> <h4><i class='fa fa-bell-alt'></i>Perhatian..</h4><p>Mohon pilih file zip atau rar. Hanya tipe ekstensi file .zip .rar </p></div>");
			$("#addCart").attr('disabled','disabled');
			return false;
		}else if(fsize>msize){
			$('body,html').animate({
				scrollTop: 0
			});
			$("#informasi").fadeIn(1000);
			$("#informasi").html("<div class='alert alert-danger alert-block'> <h4><i class='fa fa-bell-alt'></i>Perhatian..</h4><p>Ukuran file yang anda pilih terlalu besar <b>"+bytesToSize(fsize) +"</b> batas ukuran file zip maksimum <b>"+bytesToSize(msize) +"</b></p></div>");	
			$("#addCart").attr('disabled','disabled');
			return false
		}else{
			$("#informasi").html('');
			$("#addCart").removeAttr('disabled','disabled');
		}
	});
	//--Bukti Pembayaran--/
	$("#bukti").change(function() {
		var file = this.files[0];
		var imagefile = file.type;		
		var match= ["image/jpeg","image/png","image/jpg"];	
		if(!((imagefile==match[0]) || (imagefile==match[1]) || (imagefile==match[2]))) {
			$("#informasi").fadeIn(1000);
			$("#informasi").html("<div class='alert alert-danger alert-block'> <h4><i class='fa fa-bell-alt'></i>Maaf..</h4><p>Mohon pilih file gambar. Hanya tipe ekstensi file jpeg, jpg dan png </p></div>");
			$("#sendConf").attr('disabled','disabled');
			return false;
		}else{
			$("#informasi").html('');
			$("#sendConf").removeAttr('disabled','disabled');
		}
	});
	//------------------------------------------------Proses Member-------------------------------------------------//
	$('#formUpdateDeposit').validate({
        rules: {
			deposit:{
				required: true,
				number:true
			},
        },
		messages: {
			deposit:{
				required: "Mohon diisi",
				number: "Hanya Angka",
			},
		},
       errorPlacement: function(error, element) {
			   error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
			var dataForm = new FormData(document.getElementById("formUpdateDeposit"));
				$.ajax({
					type		: "POST",
					url			: "Proses-Member-U",
					data		: dataForm,
					dataType	: "json",
					cache		: false,
					contentType : false,
					processData : false, // Don't process the files
					beforeSend	: function(){
					  	$("#preload1").html('<img src="lib_/images/loader.gif">');
					},
					success: function(json){
						var status   = json.status;
						var pesan    = json.pesan;
						if(status == 'success'){
							$("#formUpdateDeposit")[0].reset();
							setTimeout(function() {
								$("#preload1").html('');
							}, 1500);							 
							 setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasiDeposit").fadeIn(1000);
								$("#informasiDeposit").html(pesan);
								setTimeout(function() {
									$("#informasiDeposit").fadeOut(100);
								}, 2000);
								$("#wait").fadeIn(1000);
								$("#wait").html('<div align="center">Mohon Tunggu.. <br><img src="lib_/images/255.gif"></div>');
							 }, 2000);
							 setTimeout( "window.location.href='Transaksi-Update-Deposit'", 3000);
						}else if(status == 'kurang'){
							$("#formUpdateDeposit")[0].reset();
							setTimeout(function() {
								$("#preload1").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasiDeposit").fadeIn(1000);
								$("#informasiDeposit").html(pesan);
								setTimeout(function() {
									$("#informasiDeposit").fadeOut(500);
								}, 3000);
							 }, 2000);
						}else{
							$("#formUpdateDeposit")[0].reset();
							setTimeout(function() {
								$("#preload1").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasiDeposit").fadeIn(1000);
								$("#informasiDeposit").html(pesan);
								setTimeout(function() {
									$("#informasiDeposit").fadeOut(500);
								}, 3000);
							 }, 2000);
						}
					}
				});
			return false;
		}
    });
	//--Form Deposit--//
	$('#formDeposit').validate({
        rules: {
			deposit:{
				required: true,
				number:true
			},
        },
		messages: {
			deposit:{
				required: "Mohon diisi",
				number: "Hanya Angka",
			},
		},
       errorPlacement: function(error, element) {
			   error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
			var dataForm = new FormData(document.getElementById("formDeposit"));
				$.ajax({
					type		: "POST",
					url			: "Proses-Member-D",
					data		: dataForm,
					dataType	: "json",
					cache		: false,
					contentType : false,
					processData : false, // Don't process the files
					beforeSend	: function(){
					  	$("#preload").html('<img src="lib_/images/loader.gif">');
					},
					success: function(json){
						var status   = json.status;
						var pesan    = json.pesan;
						if(status == 'success'){
							$("#formDeposit")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);							 
							 setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(100);
								}, 2000);
								$("#wait").fadeIn(1000);
								$("#wait").html('<div align="center">Mohon Tunggu.. <br><img src="lib_/images/255.gif"></div>');
							 }, 2000);
							 setTimeout( "window.location.href='Transaksi-Member'", 3000);
						}else{
							$("#formDeposit")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}
					}
				});
			return false;
		}
    });
	
	
	
	
	//-------------------------------------------Proses Keranjang Belanja-------------------------------------------//
	//--Form Insert to Cart--//
	$('#formInsertPesanan').validate({
		rules: {
			jenis:{
				required: true,
			},
			panjang:{
				required: true,
			},
			lebar:{
				required: true,
			},
			id_bahan:{
				required: true,
			},
			jumlah: {
				required: true,
				number: true,
			},
			harga:{
				required: true,
			},
			id_model:{
				required: true,
			},
			judul:{
				required: true,
			},
			isi:{
				required: true,
			},
			file:{
				required: true,
			},
			keterangan:{
				required: true,
			},
		},
		messages: {
			jenis:{
				required: "Mohon diisi",
			},
			panjang:{
				required: "Mohon diisi",
			},
			lebar:{
				required: "Mohon diisi",
			},
			id_bahan:{
				required: "Mohon dipilih",
			},
			jumlah: {
				required: "Mohon dipilih",
				number: "Hanya Angka",
			},
			harga:{
				required: "Mohon diisi",
			},
			id_model:{
				required: "Mohon dipilih",
			},
			judul:{
				required: "Mohon diisi",
			},
			isi:{
				required: "Mohon diisi",
			},
			file:{
				required: "Mohon dipilih",
			},
			keterangan:{
				required:"Mohon diisi",
			},
		},
	   errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
			var dataForm = new FormData(document.getElementById("formInsertPesanan"));
				$.ajax({
					type		: "POST",
					url			: "Proses-Belanja-I",
					data		: dataForm,
					dataType	: "json",
					cache		: false,
					contentType : false,
					processData : false, // Don't process the files
					beforeSend	: function(){
					  $("#preload").html('<img src="lib_/images/255.gif">');
					},
					timeout:3000,
					success: function(json){
						var status = json.status;
						var pesan  = json.pesan;
						var jumlah = json.jumlah;
						if(status == 'success'){
							$("#qtyShop").html(json.jumlah);
							$("#formInsertPesanan")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
									loadCart();
									if(jumlah == 0) {
										$(".btns-cart").hide();
										$(".checkout").hide();
									}else{
										$(".btns-cart").show();
										$(".checkout").show();
									}
								}, 3000);
							 }, 2000);
							 $("#id_model").val($("#id_model option:contains('Pilih Model--')").val());
							 $("#gambar").html('');
							 $("#fieldJasa").hide();
							 $(".kodeJasa").val('N');
							 $("#jasa").removeClass('btn btn-xs btn-success');
							 $("#jasa").addClass('btn btn-xs btn-danger');
							 $("#jasa").html('<i class="fa fa-close"></i>');
						
						}else{
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
									loadCart();
								}, 3000);
							 }, 2000);
							 
						}
					}
				});
			return false;
		}
    });
	//--Form Update to Cart--//
	$('#formUpdatePesanan').validate({
		rules: {
			jenis_produk:{
				required: true,
			},
			panjang:{
				required: true,
				number: true,
			},
			lebar:{
				required: true,
				number: true,
			},
			id_bahan:{
				required: true,
			},
			jumlah: {
				required: true,
				number: true,
			},
			keterangan:{
				required: true,
			},
		},
		messages: {
			jenis:{
				required: "Mohon diisi",
			},
			panjang:{
				required: "Mohon diisi",
				number: "Hanya Angka",
			},
			lebar:{
				required: true,
				number: "Hanya Angka",
			},
			id_bahan:{
				required:  "Mohon dipilih",
			},
			jumlah: {
				required: "Mohon dipilih",
				number: "Hanya Angka",
			},
			harga:{
				required: "Mohon diisi",
			},
			keterangan:{
				required:"Mohon diisi",
			},
		},
	   errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
			var dataForm = new FormData(document.getElementById("formUpdatePesanan"));
				$.ajax({
					type		: "POST",
					url			: "Proses-Belanja-U",
					data		: dataForm,
					dataType	: "json",
					cache		: false,
					contentType : false,
					processData : false, // Don't process the files
					beforeSend	: function(){
					  $("#preload").html('<img src="lib_/images/255.gif">');
					},
					timeout:3000,
					success: function(json){
						var status = json.status;
						var pesan  = json.pesan;
						var jumlah = json.jumlah;
						if(status == 'success'){
							$("#qtyShop").html(json.jumlah);
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$('#modalFormPesanan').modal('hide');
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
									loadCart();
									loadCartCheckout();
									if(jumlah == 0) {
										$(".btns-cart").hide();
										$(".checkout").hide();
									}else{
										$(".btns-cart").show();
										$(".checkout").show();
									}
								}, 3000);
							 }, 2000);
							 
						}else{
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
									loadCart();
									loadCartCheckout();
								}, 3000);
							 }, 2000);
							 
						}
					}
				});
			return false;
		}
    });
	//--Delete Cart--//
	$(".btn-delete").click(function(){
		var id_tampung = document.getElementById("rD").value
		$.ajax({
			type 	  : "POST",
			url  	  : "Proses-Belanja-D",
			data 	  : "id_tampung=" + id_tampung,
			dataType  : "json",
			success   : function(json){
					var status = json.status;
					var pesan  = json.pesan;
					var jumlah = json.jumlah;
					if(status == "success"){
						$("#qtyShop").html(jumlah);
						$('body,html').animate({
							scrollTop: 0
						});
						$("#informasi").fadeIn(300);
						$("#informasi").html(pesan);
						setTimeout(function() {
							$("#informasi").fadeOut(100);
							$("#informasi").html('');
							loadCart();
							loadCartCheckout();
							if(jumlah == 0) {
								$(".btns-cart").hide();
								$(".checkout").hide();
							}else{
								$(".btns-cart").show();
								$(".checkout").show();
							}
						}, 3000);
						
					}else{
						$("#qtyShop").html(jumlah);
						$('body,html').animate({
							scrollTop: 0
						});
						$("#informasi").fadeIn(300);
						$("#informasi").html(pesan);
						setTimeout(function() {
							$("#informasi").fadeOut(100);
							$("#informasi").html('');
						}, 3000);
					}
			}
		});
	});
	//--Checkout/Selesai Belanja--//
	$('#checkout').validate({
        rules: {
			nama_depan:{
				required: true,
			},
			nama_belakang:{
				required: true,
			},
			email:{
				email: true,
			},
			telp: {
				required: true,
                number: true,
                minlength: 12,
                maxlength: 12,
            },
			alamat:{
				required: true,
			},			
        },
		messages: {
			nama_depan:{
				required: "Mohon diisi.",
			},
			nama_belakang:{
				required: "Mohon diisi.",
			},
			email:{
				email: "Harus alamat email.",
			},
			telp:{
				number: "Hanya angka.",
				minlength: "Minimal 12 digit.",
				maxlength: "Maksimal 12 digit.",
			},
			alamat:{
				required: "Mohon diisi.",
			},
		},
       errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
				var dataForm = $("#checkout").serialize();
				var path     = window.location.pathname;
				$.ajax({
					type		: "POST",
					url			: "Proses-Belanja-C",
					data		: dataForm,
					dataType	: "json",
					beforeSend	: function(){
					  	$("#preload").html('<img src="lib_/images/255.gif">');
					},
					success: function(json){
						var status = json.status;
						var pesan  = json.pesan;
						if(status == 'success'){
							$("#checkout")[0].reset();
							clearFormCheck();
							setTimeout(function() {
								$("#preload").html('');
								$(".checkoutFinish").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(100);
								}, 2000);
								$("#wait").fadeIn(1000);
								$("#wait").html('<div align="center">Mohon Tunggu.. <br><img src="lib_/images/255.gif"></div>');
							 }, 2000);
							 setTimeout( "window.location.href='Transaksi-Selesai'", 3000);
						}else if(status == 'kurang_deposit'){
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								
							 }, 2000);
						}else{
							$("#checkout")[0].reset();
							clearFormCheck();
							setTimeout(function() {
								$("#preload").html('');
								$(".checkoutFinish").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(100);
								}, 2000);
								$("#wait").fadeIn(1000);
								$("#wait").html('<div align="center">Mohon Tunggu.. <br><img src="lib_/images/255.gif"></div>');
							 }, 2000);
							setTimeout( "window.location.href='Beranda'", 3000);
						}
					}
				});
			return false;
		}
    });
	//--Konfirmasi Pembayaran--//
	$('#konfirmasiPembayaran').validate({
        rules: {
			no_pemesanan:{
				required: true,
			},
			nama_pemilik:{
				required: true,
			},
			id_bank:{
				required: true,
			},
			email:{
				email: true,
			},
			jumlah_dana: {
				required: true,
                number: true,
            },
			bukti:{
				required: true,
			},
			tgl:{
				required: true,
			},
			bln:{
				required: true,
			},
			thn:{
				required: true,
			},
        },
		messages: {
			no_pemesanan:{
				required: "Mohon diisi.",
			},
			nama_pemilik:{
				required: "Mohon diisi.",
			},
			id_bank:{
				required: "Mohon dipilih.",
			},
			email:{
				email: "Harus alamat email.",
			},
			jumlah_dana:{
				required: "Mohon diisi.",
				number: "Hanya angka.",
			},
			bukti:{
				required: "Mohon diisi.",
			},
			tgl:{
				required: "Mohon diisi.",
			},
			bln:{
				required: "Mohon diisi.",
			},
			thn:{
				required: "Mohon diisi.",
			},
		},
       errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
			$("#informasi").html("<div class='alert alert-danger alert-block'> <button type='button' class='close' data-dismiss='alert'>×</button><h4><i class='fa fa-bell-alt'></i>Maaf..</h4><p>Mohon lengkapi semua field yang pada form konfirmasi pembayaran.</p></div>");
			setTimeout(function() {
				$("#informasi").html('');
			}, 2000);
		},
		submitHandler: function(form) {
			var dataForm = new FormData(document.getElementById("konfirmasiPembayaran"));
				$.ajax({
					type		: "POST",
					url			: "Proses-Konfirmasi-Bayar",
					data		: dataForm,
					dataType	: "json",
					cache		: false,
					contentType : false,
					processData : false, // Don't process the files
					beforeSend	: function(){
					  $("#preload").html('<img src="lib_/images/255.gif">');
					},
					timeout:3000,
					success: function(json){
						var status = json.status;
						var pesan  = json.pesan;
						if(status == 'success'){
							$("#konfirmasiPembayaran")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}else if(status == 'denied'){
							$("#konfirmasiPembayaran")[0].reset();
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 3000);
								 }, 2000);
						}else if(status == 'error'){
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 10000);
								 }, 2000);
						}else if(status == 'invalid'){
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 10000);
								 }, 2000);
						}else{
							$("#konfirmasiPembayaran")[0].reset();
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 10000);
								 }, 2000);
						}
					}
				});
			return false;
		}
    });
	
	$('#konfirmasiPembayaranDeposit').validate({
        rules: {
			member_id:{
				required: true,
			},
			nama_pemilik:{
				required: true,
			},
			id_bank:{
				required: true,
			},
			email:{
				email: true,
			},
			jumlah_dana: {
				required: true,
                number: true,
            },
			bukti:{
				required: true,
			},
			tgl:{
				required: true,
			},
			bln:{
				required: true,
			},
			thn:{
				required: true,
			},
        },
		messages: {
			member_id:{
				required: "Mohon diisi.",
			},
			nama_pemilik:{
				required: "Mohon diisi.",
			},
			id_bank:{
				required: "Mohon dipilih.",
			},
			email:{
				email: "Harus alamat email.",
			},
			jumlah_dana:{
				required: "Mohon diisi.",
				number: "Hanya angka.",
			},
			bukti:{
				required: "Mohon diisi.",
			},
			tgl:{
				required: "Mohon diisi.",
			},
			bln:{
				required: "Mohon diisi.",
			},
			thn:{
				required: "Mohon diisi.",
			},
		},
       errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
			$("#informasi").html("<div class='alert alert-danger alert-block'> <button type='button' class='close' data-dismiss='alert'>×</button><h4><i class='fa fa-bell-alt'></i>Maaf..</h4><p>Mohon lengkapi semua field yang pada form konfirmasi pembayaran.</p></div>");
			setTimeout(function() {
				$("#informasi").html('');
			}, 2000);
		},
		submitHandler: function(form) {
			var dataForm = new FormData(document.getElementById("konfirmasiPembayaranDeposit"));
				$.ajax({
					type		: "POST",
					url			: "Proses-Konfirmasi-Bayar-Deposit",
					data		: dataForm,
					dataType	: "json",
					cache		: false,
					contentType : false,
					processData : false, // Don't process the files
					beforeSend	: function(){
					  $("#preload").html('<img src="lib_/images/255.gif">');
					},
					timeout:3000,
					success: function(json){
						var status = json.status;
						var pesan  = json.pesan;
						if(status == 'success'){
							$("#konfirmasiPembayaranDeposit")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}else if(status == 'denied'){
							$("#konfirmasiPembayaranDeposit")[0].reset();
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 3000);
								 }, 2000);
						}else if(status == 'error'){
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 10000);
								 }, 2000);
						}else if(status == 'invalid'){
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 10000);
								 }, 2000);
						}else{
							$("#konfirmasiPembayaranDeposit")[0].reset();
								setTimeout(function() {
								    $("#preload").html('');
							    }, 1500);
								setTimeout(function() {
									$('body,html').animate({
										scrollTop: 0
									});
									$("#informasi").fadeIn(1000);
									$("#informasi").html(pesan);
									setTimeout(function() {
										$("#informasi").fadeOut(500);
									}, 10000);
								 }, 2000);
						}
					}
				});
			return false;
		}
    });
	
	
	//-------------------------------------------Proses Registrasi Pelanggan-----------------------------------------//
	//--Registrasi Pelanggan--//
	$('#registrasi').validate({
        rules: {
			nama_depan:{
				required: true,
			},
			nama_belakang:{
				required: true,
			},
			email:{
				email: true,
			},
			telp: {
				required: true,
                number: true,
                minlength: 11,
                maxlength: 12,
            },
			password: {
					required: true,
					minlength: 8
			},
			confirm_password: {
				required: true,
				minlength: 8,
				equalTo: "#password"
			},
			alamat:{
				required: true,
			},
			
        },
		messages: {
			nama_depan:{
				required: "Mohon diisi.",
			},
			nama_belakang:{
				required: "Mohon diisi.",
			},
			email:{
				email: "Harus alamat email.",
			},
			
			telp:{
				number: "Hanya angka.",
				minlength: "Minimal 11 digit.",
				maxlength: "Maksimal 12 digit.",
			},
			password: {
				minlength: "Minimal 8 karakter."
			},
			confirm_password: {
				minlength: "Minimal 8 karakter.",
				equalTo: "Password tidak cocok."
			},
			alamat:{
				required: "Mohon diisi.",
			},
			
		},
       errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
			$("#informasi").html("<div class='alert alert-danger alert-block'> <button type='button' class='close' data-dismiss='alert'>×</button><h4><i class='fa fa-bell-alt'></i>Maaf..</h4><p>Mohon lengkapi semua field yang pada form registrasi.</p></div>");
			setTimeout(function() {
				$("#informasi").html('');
			}, 2000);
		},
		submitHandler: function(form) {
				var dataForm = $("#registrasi").serialize();
				$.ajax({
					type		: "POST",
					url			: "Proses-Akun-R",
					data		: dataForm,
					dataType	: "json",
					beforeSend	: function(){
					  	$("#preload").html('<img src="lib_/images/255.gif">');
					},
					success: function(json){
						var status   = json.status;
						var pesan    = json.pesan;
						if(status == 'success'){
							$("#registrasi")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
								send_email(dataForm,json.kode);
							 }, 2000);
						}else{
							$("#registrasi")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}
					}
				});
			return false;
		}
    });
	//--Login Pelanggan--//
	$('#login').validate({
        rules: {
			email:{
				email: true,
			},
			password: {
					required: true,
			},
        },
		messages: {
			email:{
				email: "Harus alamat email.",
			},
			password: {
				required: "Harus diisi."
			},
		},
       errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
				var dataForm 	= $("#login").serialize();
				$.ajax({
					type		: "POST",
					url			: "Proses-Akun-L",
					data		: dataForm,
					dataType	: "json",
					success		: function(json){
						var status  = json.status;
						var row     = json.jumlah;
						if(status == 'success'){
							$("#login")[0].reset();
							var btn = $(".login");
							btn.removeClass('btn btn-primary');
							btn.addClass('btn btn-default');
							btn.html('Checking.. <img src="lib_/images/loader.gif" height=15 width=15>');
							btn.attr('disabled', 'disabled');
							setTimeout(function() {
								btn.removeClass('btn btn-default');
								btn.addClass('btn btn-success');
								btn.html("Login Sukses.. <i class='fa fa-check'></i>");
							}, 5000);
							setTimeout(function() {
								btn.removeClass('btn btn-success');
								btn.addClass('btn btn-primary');
								btn.html("Mohon Tunggu..");
							}, 6000);
							if(row > 0){
								setTimeout( "window.location.href='Selesai-Belanja'", 8000 );
							}else{
								setTimeout( "window.location.href='Beranda'", 8000 );
							}
						}else if(status = 'online'){
							$("#login")[0].reset();
							var btn = $(".login");
							btn.removeClass('btn btn-primary');
							btn.addClass('btn btn-default');
							btn.html('Checking.. <img src="lib_/images/loader.gif" height=15 width=15>');
							btn.attr('disabled', 'disabled');
							setTimeout(function() {
								btn.removeClass('btn btn-default');
								btn.addClass('btn btn-danger');
								btn.html('Saat ini anda sedang online..');
							}, 5000);
							setTimeout(function() {
							btn.removeAttr('disabled', 'disabled');
								btn.removeClass('btn btn-danger');
								btn.addClass('btn btn-primary');
								btn.html('<i class="fa fa-sign-in"></i> Masuk');
							}, 8000);
						}else{
							$("#login")[0].reset();
							var btn = $(".login");
							btn.removeClass('btn btn-primary');
							btn.addClass('btn btn-default');
							btn.html('Checking.. <img src="lib_/images/loader.gif" height=15 width=15>');
							btn.attr('disabled', 'disabled');
							setTimeout(function() {
								btn.removeClass('btn btn-default');
								btn.addClass('btn btn-danger');
								btn.html('Login Gagal.. <i class="fa fa-times"></i>');
							}, 5000);
							setTimeout( "window.location.href='Beranda'", 8000 );
						}
					}
				});
			return false;
		}
    });
	//--Forgot Password Pelanggan--//
	$('#forgotPassword').validate({
        rules: {
			email:{
				email: true,
			},
        },
		messages: {
			email:{
				email: "Harus alamat email.",
			},	
		},
       errorPlacement: function(error, element) {
			   error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
				var dataForm = $("#forgotPassword").serialize();
				$.ajax({
					type		: "POST",
					url			: "Proses-Akun-F",
					data		: dataForm,
					dataType	: "json",
					beforeSend	: function(){
					  	$("#preload").html('<img src="lib_/images/loader.gif">');
					},
					success: function(json){
						var status   = json.status;
						var pesan    = json.pesan;
						if(status == 'success'){
							$("#forgotPassword")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
							 send_forgotPassword(dataForm,json.data,json.nd,json.nb);
						}else{
							$("#forgotPassword")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}
					}
				});
			return false;
		}
    });
	//--Change Password Pelanggan--//
	$('#changePassword').validate({
        rules: {
			old_password: {
				required: true,
            },
			password: {
					required: true,
					minlength: 8
			},
			password1: {
				required: true,
				minlength: 8,
				equalTo: "#password"
			},
			
        },
		messages: {
			old_password:{
				required: "Kata Sandi lama diisi.",
			},
			password: {
				required: "Kata Sandi baru diisi.",
				minlength: "Minimal 8 karakter."
			},
			password1: {
				required: "Ulangi Kata Sandi baru diisi.",
				minlength: "Minimal 8 karakter.",
				equalTo: "Password tidak cocok."
			},			
		},
       errorPlacement: function(error, element) {
			   error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
				var dataForm = $("#changePassword").serialize();
				$.ajax({
					type		: "POST",
					url			: "Proses-Akun-C",
					data		: dataForm,
					dataType	: "json",
					beforeSend	: function(){
					  	$("#preload").html('<img src="lib_/images/loader.gif">');
					},
					success: function(json){
						var status   = json.status;
						var pesan    = json.pesan;
						if(status == 'success'){
							$("#changePassword")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
							 setTimeout( "window.location.href='Log-In-User'", 4000 );
						}else if(status == 'denied'){
							$("#changePassword")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}else{
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}
					}
				});
			return false;
		}
    });
	$("#email").keyup(function(){ 
    	var email  	= $("#email").val(); 
		$.ajax({
			type	: "POST",
			url		: "Auth-Email",    
			data	: "email=" + email,
			dataType: "json",
			success	: function(json){ 
				var status  = json.status;
				var jumlah  = json.jml;
				var message = json.message;
				if(status == "not_null"){
					$("#informasi").fadeIn(1000);
					$("#informasi").html(message)
					$(".registrasi").attr('disabled','disabled');
				}else{
					$("#informasi").fadeOut(1000);
					$("#informasi").html(message)
					$(".registrasi").removeAttr('disabled','disabled');
				}
			}
		});
	});
	$("#email").change(function(){ 
    	var email  	= $("#email").val(); 
		$.ajax({
			type	: "POST",
			url		: "Auth-Email",    
			data	: "email=" + email,
			dataType: "json",
			success	: function(json){ 
				var status  = json.status;
				var jumlah  = json.jml;
				var message = json.message;
				if(status == "not_null"){
					$("#informasi").fadeIn(1000);
					$("#informasi").html(message);
					$(".registrasi").attr('disabled','disabled');
				}else{
					$("#informasi").fadeOut(1000);
					$("#informasi").html(message);
					$(".registrasi").removeAttr('disabled','disabled');
				}
			}
		});
	});
	//------------------------------------------------------------Kontak Kami----------------------------------------//
	//--Kontak Kami Proses--//
	$('#kontak').validate({
        rules: {
			nama_depan:{
				required: true,
			},
			nama_belakang:{
				required: true,
			},
			email:{
				email: true,
			},
			telp: {
				required: true,
                number: true,
                minlength: 12,
                maxlength: 12,
            },
			pesan:{
				required: true,
			},
			
        },
		messages: {
			nama_depan:{
				required: "Mohon diisi.",
			},
			nama_belakang:{
				required: "Mohon diisi.",
			},
			email:{
				email: "Harus alamat email.",
			},
			telp:{
				number: "Hanya angka.",
				minlength: "Minimal 12 digit.",
				maxlength: "Maksimal 12 digit.",
			},
			pesan:{
				required: "Mohon diisi.",
			},
		},
       errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
			$("#informasi").html("<div class='alert alert-danger alert-block'> <button type='button' class='close' data-dismiss='alert'>×</button><h4><i class='fa fa-bell-alt'></i>Maaf..</h4><p>Mohon lengkapi semua field yang pada form kontak kami.</p></div>");
			setTimeout(function() {
				$("#informasi").html('');
			}, 2000);
		},
		submitHandler: function(form) {
				var dataForm = $("#kontak").serialize();
				$.ajax({
					type		: "POST",
					url			: "Proses-Konta-Kami",
					data		: dataForm,
					dataType	: "json",
					beforeSend	: function(){
					  	$("#preload").html('<img src="lib_/images/255.gif">');
					},
					timeout:3000,
					success: function(json){
						var status = json.status;
						var pesan  = json.pesan;
						if(status == 'success'){
							$("#kontak")[0].reset();
							clearFormCheck();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}else{
							$("#kontak")[0].reset();
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}
					}
				});
			return false;
		}
    });
	//--------------------------------------------------------- Profil Pelanggan ------------------------------------//
	$('#profil_pelanggan').validate({
        rules: {
			nama_depan:{
				required: true,
			},
			nama_belakang:{
				required: true,
			},
			telp: {
				required: true,
                number: true,
                minlength: 12,
                maxlength: 12,
            },
			alamat:{
				required: true,
			},
			
        },
		messages: {
			nama_depan:{
				required: "Mohon diisi.",
			},
			nama_belakang:{
				required: "Mohon diisi.",
			},
			telp:{
				number: "Hanya angka.",
				minlength: "Minimal 12 digit.",
				maxlength: "Maksimal 12 digit.",
			},
			alamat:{
				required: "Mohon diisi.",
			},
		},
       errorPlacement: function(error, element) {
			error.appendTo(element.parent("span"));
		},
		submitHandler: function(form) {
				var dataForm 	= $("#profil_pelanggan").serialize();
				$.ajax({
					type		: "POST",
					url			: "Proses-Profil-Pelanggan",
					data		: dataForm,
					dataType	: "json",
					beforeSend	: function(){
					  	$("#preload").html('<img src="lib_/images/255.gif">');
					},
					timeout:3000,
					success: function(json){
						var status = json.status;
						var pesan  = json.pesan;
						if(status == 'success'){
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}else{
							setTimeout(function() {
								$("#preload").html('');
							}, 1500);
							setTimeout(function() {
								$('body,html').animate({
									scrollTop: 0
								});
								$("#informasi").fadeIn(1000);
								$("#informasi").html(pesan);
								setTimeout(function() {
									$("#informasi").fadeOut(500);
								}, 3000);
							 }, 2000);
						}
					}
				});
			return false;
		}
    });	
	
	$(function(){
		var btnUpload=$('#upload');
		var status = $('#status');
		new AjaxUpload(btnUpload, {
			action: 'con_/upload.php',
			name: 'uploadfile',
			onSubmit: function(file, ext){
				 if (! (ext && /^(jpg|png|jpeg|gif)$/.test(ext))){ 
                    // extension is not allowed 
					status.html('<div class="alert alert-danger"><strong>Perhatian!</strong> <br> Hanya JPG, PNG atau GIF</div>');
					setTimeout(function() {
						status.fadeOut(700);
					}, 3000);
					return false;
				}
				status.html('<img src="lib_/images/255.gif">');
			},
			onComplete: function(file, response){
				//On completion clear the status
				status.html('');
				$("#status").fadeIn(100);
				
				//Add uploaded file to list
				if(response === "success"){
					$('#files').load('con_/avatar.php');
					$('#files1').load('con_/avatar1.php');
					$('#status').html('<div class="alert alert-success"><strong>Upload Berhasil!</strong><br>Foto anda berhasil di unggah.</div>');
					setTimeout(function() {
						$("#status").fadeOut(700);
					}, 3000);
				} else{
					$('#status').html('<div class="alert alert-danger"><strong>Upload Gagal!</strong><br>Silahkan coba kembali.</div>');
					setTimeout(function() {
						$("#status").fadeOut(700);
					}, 3000);
				}
			}
		});
	});
});
	
	function loadCart(){
		var cart		 	= "cart";
			$.ajax({
				type		: "GET",
				url	    	: "Load-Cart",
				data    	: "cart="+cart,
				timeout 	: 3000,
				beforeSend	: function(){
					$("#cart").html('<img src="lib_/images/blueee.gif"> <br>Loading..</li><br> <br> <br> <br> <br> <br><br> <br>')
				},
				success:function(data){
					$("#cart").html('');
					$("#cart").html(data)
				}
			})
	}
	function loadCartCheckout(){
		var cart		 	= "cart";
			$.ajax({
				type		: "GET",
				url	    	: "Load-Cart-Checkout",
				data    	: "cart="+cart,
				timeout 	: 3000,
				beforeSend	: function(){
					$("#cart1").html('<img src="lib_/images/blueee.gif"> <br>Loading..</li><br> <br> <br> <br> <br> <br><br> <br>')
				},
				success:function(data){
					$("#cart1").html('');
					$("#cart1").html(data)
				}
			})
	}
	function loadTopCart(){
		var show = "shop";
			$.ajax({
				type		: "GET",
				url	    	: "Load-Top-Cart",
				data    	: "shop="+shop,
				timeout 	: 3000,
				beforeSend	:function(){
					$("#shop").html('<li style="text-align:center; margin-bottom:10px; margin-top:10px;"> <img src="lib_/images/camera-loader.gif"> <br>Loading..</li>')
				},
				success:function(data){
					$("#shop").html('');
					$("#shop").html(data)
				}
			})
	}
	function hitungPesanan(){
		var frm_data = {
			id_bahan 	: $("#id_bahan").val(),
			panjang 	: $("#panjang").val(),
			lebar 		: $("#lebar").val(),
			jumlah 		: $("#jumlah").val(),
			harga_jasa	: $("#hargaJasa").val()
		};
		$.ajax({
			type		: "POST",
			url			: "Count-Order",    
			data		: frm_data,
			dataType	: "json",
			success		: function(json){ 
				var status  = json.status;
				var data    = json.data;
				var data1   = json.data1;
				if(status == "success"){
					$("#harga1").val(data);
					$("#harga").val(data1);
				}else{
					$("#harga1").val(data);
					$("#harga").val(data1);
				}
			}
		});	
	}
	function getPesanan(data){
		var id_pesanan = data;
		$.ajax({
			type 		: "POST",
			url 		: "Proses-Belanja-G",
			data 		: "id_pesanan=" + id_pesanan,
			dataType	: "json",
			success 	: function(json){
				var status   = json.status;
				if(status == 'success'){
					$("#id_tampung_pemesanan").val(json.id_tampung);
					$("#jenis_produk").val(json.produk);
					$("#panjang").val(json.panjang);
					$("#lebar").val(json.lebar);
					$("#id_bahan").html(json.bahan);
					$("#jumlah").val(json.jumlah);
					$("#harga").val(json.harga);
					$("#harga1").val(json.harga1);
					$("#keterangan").val(json.keterangan);
					$("#hargaJasa").val(json.jasa);
					$("#total").val(json.total);
					$("#total").html(json.total_rupiah);
				}else{
					$("#informasi").fadeIn(500);
					$("#informasi").html(message);
					setTimeout(function() {
						$("#informasi").fadeOut(700);
						$("#informasi").html('');
					}, 3000);
				}
			}
		});
	}
	function send_forgotPassword(data,kode,nd,nb){
		var dataForm = data;
		var kodeForm = kode;
			$.ajax({
				type	: "POST",
				url	    : "mod_/mod_registrasi/send_email_forgot_password.php?K="+kodeForm+"&nd="+nd+"&nb="+nb+"",
				data    : dataForm,
				success	:function(data){
				}
			})
	}
	function sendBerhentiMember(kode){
		var id_deposit = kode;
		var btn 	   = $(".btn-stop");
			$.ajax({
				type		: "POST",
				url			: "Proses-Member-B",
				data		: "id_deposit="+id_deposit,
				dataType	: "json",
				timeout:3000,
				success: function(json){
					var status   = json.status;
					var pesan    = json.pesan;
					if(status == 'success'){
						btn.attr('disabled', 'disabled');
						btn.removeClass('btn btn-danger');
						btn.addClass('btn btn-default');
						btn.html('Mohon Tunggu.. <img src="lib_/images/loading.gif" height=15 width=15>');
						
						 setTimeout(function() {
							$('body,html').animate({
								scrollTop: 0
							});
							btn.html('Submit');
							btn.removeClass('btn btn-default');
							btn.addClass('btn btn-danger');
							$("#informasi").fadeIn(1000);
							$("#informasi").html(pesan);
							setTimeout(function() {
								$("#informasi").fadeOut(100);
							}, 2000);
							
						 }, 2000);
						 setTimeout( "window.location.href='Daftar-Member'", 5000);
					}else{
						btn.attr('disabled', 'disabled');
						btn.removeClass('btn btn-danger');
						btn.addClass('btn btn-default');
						btn.html('Mohon Tunggu.. <img src="lib_/images/loading.gif" height=15 width=15>');
						
						setTimeout(function() {
							$('body,html').animate({
								scrollTop: 0
							});
							btn.html('Submit');
							btn.removeClass('btn btn-default');
							btn.addClass('btn btn-danger');
							$("#informasi").fadeIn(1000);
							$("#informasi").html(pesan);
							setTimeout(function() {
								$("#informasi").fadeOut(500);
							}, 3000);
						 }, 2000);
						 setTimeout( "window.location.href='Daftar-Member'", 5000);
					}
				}
		});
	}
	function berhentiMember(nama){
		$('#berhentiMember').on('show.bs.modal', function(e) {
			$(this).find('.btn-stop').attr('onClick', $(e.relatedTarget).data('href'));
			$('.debug-data').html('Berhenti Member <strong>' + nama + ' ? </strong>');
		});
	}
	function send_email(data,kode){
		var dataForm = data;
		var kodeForm = kode;
			$.ajax({
				type	: "POST",
				url	    : "mod_/mod_aktivasi/send_active.php?K="+kodeForm+"",
				data    : dataForm,
				success	:function(data){
				}
			})
	}
	function clearFormCheck(){
		$("#nama_depan").val('');
		$("#nama_belakang").val('');
		$("#email").val('');
		$("#telp").val('');
		$("#alamat").val('');
	}	
	function bytesToSize(bytes) {
		var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
		if (bytes == 0) return '0 Bytes';
		var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
		return Math.round(bytes / Math.pow(1024, i), 2) + ' ' + sizes[i];
	}		
	function angka(e){
	var unicode = e.charCode ? e.charCode : e.keyCode
		if (unicode!=8){ //if the key isn't the backspace key (which we should allow)
			if (unicode<46||unicode>46 && unicode<48||unicode>57) //if not a number
			return false //disable key press
			}
		}