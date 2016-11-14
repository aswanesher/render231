
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
                <form action="proses2" method="POST">

                    <div class="panel panel-default">
                      <!-- Default panel contents -->
                      <div class="panel-heading">Tabel <?php echo $namatabel?></div>
                      <div class="panel-body">
                        <p>Silahkan tentukan judul kolom, status ditampilkan dan dapat dicari di tampilan data.</p>
                      </div>

                      <!-- Table -->
                      <table class="table table-bordered">
                        <thead>
                          <td>Column</td>
                          <td>Title/Caption</td>
                          <td>Show?</td>
                          <td>Search?</td>
                        </thead>
                        <tbody>
                        <?php
                        $a=1;
                        foreach($kolomtabel as $row=>$name) {
                        ?>
                        <tr>
                            <td><?php echo $name['column_name'];?></td>
                            <td><input type="text" name="colname<?php echo $a;?>" class="form-control" placeholder="Nama Kolom"></td>
                            <td><input type="checkbox" name="show<?php echo $a;?>" class="form-control"></td>
                            <td><input type="checkbox" name="search<?php echo $a;?>" class="form-control"></td>
                        </tr>
                        <?php $a++; } ?>
                        </tbody>
                      </table>
                    </div>
                    <input type="submit" value="Next" name="generate" class="btn btn-primary" onclick="javascript: return confirm('This will overwrite the existing files. Continue ?')">
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
