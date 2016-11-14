<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Modul_model extends CI_Model {

    function get_data()
    {
		$this->db->select('*');
        $this->db->from('kb_modules');

        $query = $this->db->get();
        return $query->result();
    }

    function cek($id)
    {
        $this->db->select('module_name');
        $this->db->from('kb_modules');
        $this->db->where("module_id", $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }
}

?>