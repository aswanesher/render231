<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Konfirmasi_bayar_model extends CI_Model
{
    public $table = 'kb_konfirmasi_bayar';

    function __construct()
    {
        parent::__construct();
    }

    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_konfirmasi_bayar');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('*');
        if($param['query1']!='') {
            $this->db->like('name',$param['query1']);
        }

        $query = $this->db->get('kb_konfirmasi_bayar',$sampai,$dari);
        return $query->result();
    }

    function jumlah(){
        return $this->db->get('kb_konfirmasi_bayar')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_konfirmasi_bayar');
        $this->db->where('id_pembayaran', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_konfirmasi_bayar', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id_pembayaran', $id);
        return $this->db->update('kb_konfirmasi_bayar', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_pembayaran', $id);
        return $this->db->delete('kb_konfirmasi_bayar');
    }

}

/* End of file konfirmasi_bayar_model.php */
/* Location: ./application/models/konfirmasi_bayar_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-11-22 23:23:35 */
?>