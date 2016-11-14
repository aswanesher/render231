
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title><?php echo $company." | ".$judul_panel;?></title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo base_url();?>/assets/backend/css/bootstrap.min.css" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="<?php echo base_url();?>/assets/backend/css/jumbotron-narrow.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="#">Home</a></li>
            <li role="presentation"><a href="#">About</a></li>
            <li role="presentation"><a href="#">Contact</a></li>
          </ul>
        </nav>
        <h3 class="text-muted"><?php echo $company." | ".$judul_panel;?></h3>
      </div>

      <div class="row marketing">
        <div class="col-md-12">
            <form action="<?php echo base_url('generator/panel/proses'); ?>" method="POST">

                    <div class="form-group">
                        <label>Select Table - <a href="<?php echo base_url();?>generator/panel/index">Refresh</a></label>
                        <select id="table_name" name="table_name" class="form-control" onchange="setname()">
                            <option value="">Please Select</option>
                            <?php foreach($tabel as $tbl) {?>
                            <option value="<?php echo $tbl;?>"><?php echo $tbl;?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Select Type</label>
                        <select id="mod_type" name="mod_type" class="form-control">
                            <option value="">Please Select</option>
                            <option value="core">Core</option>
                            <option value="addon">Addon</option>
                            <option value="master">Master</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Module Title</label>
                        <input type="text" id="module_title" name="module_title" value="" class="form-control" placeholder="Module Title" required>
                    </div>
                    <div class="form-group">
                        <label>Module Description</label>
                        <input type="text" id="module_desc" name="module_desc" value="" class="form-control" placeholder="Module Description" required>
                    </div>
                    <div class="form-group">
                        <label>Custom Controller Name</label>
                        <input type="text" id="controller" name="controller" value="" class="form-control" placeholder="Controller Name" required>
                    </div>
                    <div class="form-group">
                        <label>Custom Model Name</label>
                        <input type="text" id="model" name="model" value="" class="form-control" placeholder="Controller Name" required>
                    </div>
                    <input type="submit" value="Generate" name="generate" class="btn btn-primary" onclick="javascript: return confirm('This will overwrite the existing files. Continue ?')">
                </form>
                <br>

        </div>
      </div>

      <footer class="footer">
        <p>&copy; 2015 Company, Inc.</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
