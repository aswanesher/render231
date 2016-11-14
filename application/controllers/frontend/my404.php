<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class My404 extends CI_Controller {
	
	public function __construct() 
    {
        parent::__construct(); 
    } 

    public function index() 
    { 
    	$this->output->set_status_header('404'); 
        $data['content'] = 'error_404'; // View name 
        $basetemp = "templates/frontend/kaosnyabagus/";
		$data['temp'] = $basetemp;
		$view = "templates/frontend/kaosnyabagus/";
		$data['hal'] = "page/404";
		show_frontend($basetemp, $view, $data);
    } 
}