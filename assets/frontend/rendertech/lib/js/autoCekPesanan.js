// JavaScript Document
function ajax()
  {
     if (window.XMLHttpRequest)
     {
       // untuk IE7+, Firefox, Chrome, Opera, Safari
       xmlhttp=new XMLHttpRequest();
     }
     else
     {
       // untuk IE6, IE5
       xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
     }

     xmlhttp.onreadystatechange=function()
     {
        if (xmlhttp.readyState==4 && xmlhttp.status==200)
        {
          // hasil pembacaan script date.php akan ditampilkan di komponen id="hasil"
          document.getElementById("pesanan").innerHTML = xmlhttp.responseText;
        }
     }

     // menjalankan script date.php secara asynchronous
     xmlhttp.open("GET","con_/cekPesanan.php", true);
     xmlhttp.send();

     // refresh time 1 detik (1000 ms)
     setTimeout("ajax()", 1000);
  }