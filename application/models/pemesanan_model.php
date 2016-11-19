<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Pemesanan_model extends CI_Model
{
    public $table = 'kb_pemesanan';

    function __construct()
    {
        parent::__construct();
    }

    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_pemesanan');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('*');
        if($param['query1']!='') {
            $this->db->like('name',$param['query1']);
        }

        $query = $this->db->get('kb_pemesanan',$sampai,$dari);
        return $query->result();
    }

    function jumlah(){
        return $this->db->get('kb_pemesanan')->num_rows();
    }

    function jumlahfront($usr){
        $this->db->where('id_session',$usr);
        return $this->db->get('kb_pemesanan')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_pemesanan');
        $this->db->where('id_tampung_pemesanan', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_pemesanan', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id_tampung_pemesanan', $id);
        return $this->db->update('kb_pemesanan', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_tampung_pemesanan', $id);
        return $this->db->delete('kb_pemesanan');
    }

}

/* End of file pemesanan_model.php */
/* Location: ./application/models/pemesanan_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-11-19 12:55:16 */
?>