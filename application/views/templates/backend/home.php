<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.7&appId=1051026648318470";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class="page-header">
    <h1>
        Dashboard
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <div class="alert alert-block alert-success">
            <button type="button" class="close" data-dismiss="alert">
                <i class="ace-icon fa fa-times"></i>
            </button>

            <i class="ace-icon fa fa-check green"></i>

            Selamat Datang di Dashboard <?php echo $company?>
        </div>
        <?php
        
        if (!empty($this->session->flashdata('error'))) {
            echo "<div class='alert alert-danger'>";
            echo '<button type="button" class="close" data-dismiss="alert"><i class="ace-icon fa fa-times"></i>
            </button>';
            echo "<b>".$this->session->flashdata('error')."</b>";
            echo "</div>";
        }
        
        ?>
                <div class="widget-box transparent">
                    
                </div><!-- /.widget-box -->
    </div>

