<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
        global $template2;
?>
<!-- Header -->
<?php
$this->load->view($temp.'header');
?>

<!-- MAIN PAGE CONTENT -->
<?php
$this->load->view($temp.$hal);
?>
<!-- END MAIN PAGE CONTENT -->
			
<?php
$this->load->view($temp.'footer');
?>
	