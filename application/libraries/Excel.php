<?php if ( ! defined('BASEPATH')) exit('No direct  access allowed');

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once APPPATH.'/third_party/PHPExcel.php';
class Excel extends PHPExcel {

    public function __construct() {
        parent::__construct();
    }

}
