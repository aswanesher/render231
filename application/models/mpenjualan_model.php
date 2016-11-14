<?php if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Salestarget_model extends CI_Model
{
    function __construct()
    {
        parent::__construct();
    }
    
    function getData() {
        $this->db->select('*');
        $this->db->from('kb_target_sales');

        $query = $this->db->get();
        return $query->result();
    }
    
    
}

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

