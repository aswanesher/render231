<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Menu_grup_model extends CI_Model {

    function get_data()
    {
		$this->db->select('*');
        $this->db->from('kb_menu_group');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('*');
        if($param['query1']!='') {
            $this->db->like('title',$param['query1']);
        }

        $query = $this->db->get('kb_menu_group',$sampai,$dari);
        return $query->result();
    }

    function jumlah($param){
        if($param['query1']!='') {
            $this->db->like('title',$param['query1']);
        }
        return $this->db->get('kb_menu_group')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_menu_group');
        $this->db->where('id', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_menu_group', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id', $id);
        return $this->db->update('kb_menu_group', $data);
    }

    function hapusmenugrup($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete('kb_menu_group');
    }
}

?>