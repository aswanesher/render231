<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
        global $template2;
?>
<!-- Header -->
<?php
$this->load->view($temp.'header');
?>

<!-- Main Nav -->
<?php
$this->load->view($temp.'main-nav');
?>

<!-- MAIN PAGE CONTENT -->
<div class="container main-container">
<?php
$this->load->view($temp.$hal);
?>
</div>
<!-- END MAIN PAGE CONTENT -->
			
<?php
$this->load->view($temp.'footer');
?>
	