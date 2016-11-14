<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_grup_model extends CI_Model {

    function get_data()
    {
		$this->db->select('*');
        $this->db->from('kb_user_type');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('*');
        if($param['query1']!='') {
            $this->db->like('type',$param['query1']);
        }

        $query = $this->db->get('kb_user_type',$sampai,$dari);
        return $query->result();
    }

    function jumlah($param){
        if($param['query1']!='') {
            $this->db->like('type',$param['query1']);
        }
        return $this->db->get('kb_user_type')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_user_type');
        $this->db->where('id', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_cek($id)
    {
        $this->db->select('*');
        $this->db->from('kb_user_type');
        $this->db->like('type', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function cekid()
    {
        $this->db->select('id');
        $this->db->from('kb_user_type');
        $this->db->order_by("id", "desc");
        $this->db->limit(1);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_user_type', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id', $id);
        return $this->db->update('kb_user_type', $data);
    }

    function hapususergrup($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete('kb_user_type');
    }
}

?>