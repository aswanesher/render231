<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_type_model extends CI_Model {

    function get_data()
    {
		$this->db->select('*');
        $this->db->from('kb_user_type');

        $query = $this->db->get();
        return $query->result();
    }

}

?>