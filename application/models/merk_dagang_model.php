<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Merk_dagang_model extends CI_Model
{
    public $table = 'kb_merk_dagang';

    function __construct()
    {
        parent::__construct();
    }

    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_merk_dagang');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('*');
        if($param['query1']!='') {
            $this->db->like('merk',$param['query1']);
        }

        $query = $this->db->get('kb_merk_dagang',$sampai,$dari);
        return $query->result();
    }

    function jumlah(){
        return $this->db->get('kb_merk_dagang')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_merk_dagang');
        $this->db->where('id_merk', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_merk_dagang', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id_merk', $id);
        return $this->db->update('kb_merk_dagang', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_merk', $id);
        return $this->db->delete('kb_merk_dagang');
    }

}

/* End of file merk_dagang_model.php */
/* Location: ./application/models/merk_dagang_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-07-29 14:21:00 */
?>