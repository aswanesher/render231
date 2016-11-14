<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Generator_model extends CI_Model {

	public function getdata() {
		$this->db->select('*');
		$this->db->from('kb_modules');

		$query = $this->db->get();
		$result = $query->row();
        return $result;
	}

	function save_data($data)
    {
        $query = $this->db->insert('kb_modules', $data);
        return $query;
    }

    function save_permission($data)
    {
        $query = $this->db->insert('kb_permission', $data);
        return $query;
    }

    function cekid()
    {
        $this->db->select('module_id');
        $this->db->from('kb_modules');
        $this->db->order_by("module_id", "desc");
        $this->db->limit(1);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }
}

?>