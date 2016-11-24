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
        $this->db->select('a.*,b.thumb,b.seo_url,b.nama_produk as jenis,c.jenis_bahan,d.name,e.name as opp');
        //$this->db->from('kb_pemesanan as a');
        $this->db->join('kb_products as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->join('kb_bahan as c', 'a.id_bahan=c.id_bahan', 'LEFT');
        $this->db->join('kb_user_detail as d', 'a.id_session=d.id', 'LEFT');
        $this->db->join('kb_user_detail as e', 'a.id_operator=e.id', 'LEFT');
        if($param['query1']<>'') {
            $this->db->like('d.name',$param['query1']);
        }
        if($param['query2']<>'') {
            $this->db->where('a.kd_pemesanan',$param['query2']);
        }
        if($param['tgl_pesan']<>'') {
            $this->db->where('a.tgl_pesan',$param['tgl_pesan']);
        }
        if($param['status']<>'') {
            $this->db->where('a.status_pengerjaan',$param['status']);
        }
        //$this->db->where('a.id_session',$uid);
        $this->db->where_not_in('a.status_bayar','paid');
        $this->db->order_by("a.id_produk", "desc");

        $query = $this->db->get('kb_pemesanan as a',$sampai,$dari);
        return $query->result();
    }

    function get_dataalls($param,$sampai,$dari)
    {
        $this->db->select('a.*,b.thumb,b.seo_url,b.nama_produk as jenis,c.jenis_bahan,d.name,e.name as opp');
        //$this->db->from('kb_pemesanan as a');
        $this->db->join('kb_products as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->join('kb_bahan as c', 'a.id_bahan=c.id_bahan', 'LEFT');
        $this->db->join('kb_user_detail as d', 'a.id_session=d.id', 'LEFT');
        $this->db->join('kb_user_detail as e', 'a.id_operator=e.id', 'LEFT');
        if($param['query1']<>'') {
            $this->db->like('d.name',$param['query1']);
        }
        if($param['query2']<>'') {
            $this->db->where('a.kd_pemesanan',$param['query2']);
        }
        if($param['tgl_pesan']<>'') {
            $this->db->where('a.tgl_pesan',$param['tgl_pesan']);
        }
        if($param['status']<>'') {
            $this->db->where('a.status_pengerjaan',$param['status']);
        }
        //$this->db->where('a.id_session',$uid);
        //$this->db->where_not_in('a.status_bayar','paid');
        $this->db->order_by("a.id_produk", "desc");

        $query = $this->db->get('kb_pemesanan as a',$sampai,$dari);
        return $query->result();
    }

    function get_dataall_frontend($param,$sampai,$dari,$uid)
    {
        $this->db->select('*');
        $this->db->where('id_session',$uid);
        $query = $this->db->get('kb_pemesanan',$sampai,$dari);
        return $query->result();
    }

    function get_data_pesanan($uid)
    {
        $this->db->select('a.*,b.thumb,b.seo_url,b.nama_produk as jenis,c.jenis_bahan');
        $this->db->from('kb_pemesanan as a');
        $this->db->join('kb_products as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->join('kb_bahan as c', 'a.id_bahan=c.id_bahan', 'LEFT');
        $this->db->where('a.id_session',$uid);
        $this->db->where_not_in('a.status_bayar','paid');
        $this->db->order_by("a.id_produk", "desc");
        $query = $this->db->get();
        return $query->result();
    }

    function jumlah(){
        return $this->db->get('kb_pemesanan')->num_rows();
    }

    function jumlahfront($usr){
        $this->db->where('id_session',$usr);
        $this->db->where_not_in('status_bayar','paid');
        return $this->db->get('kb_pemesanan')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('a.*,b.thumb,b.seo_url,b.nama_produk as jenis,c.jenis_bahan,d.name,e.nama,e.gambar as gambar_model');
        $this->db->from('kb_pemesanan as a');
        $this->db->join('kb_products as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->join('kb_bahan as c', 'a.id_bahan=c.id_bahan', 'LEFT');
        $this->db->join('kb_user_detail as d', 'a.id_session=d.id', 'LEFT');
        $this->db->join('kb_model as e', 'a.id_model=e.id_model', 'LEFT');
        $this->db->where('a.id_tampung_pemesanan',$id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_edit2($id)
    {
        $this->db->select('a.*,b.thumb,b.seo_url,b.nama_produk as jenis,c.jenis_bahan,d.name,e.nama,e.gambar as gambar_model');
        $this->db->from('kb_pemesanan as a');
        $this->db->join('kb_products as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->join('kb_bahan as c', 'a.id_bahan=c.id_bahan', 'LEFT');
        $this->db->join('kb_user_detail as d', 'a.id_session=d.id', 'LEFT');
        $this->db->join('kb_model as e', 'a.id_model=e.id_model', 'LEFT');
        $this->db->where('a.id_tampung_pemesanan',$id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_detail($uid)
    {
        $this->db->select('a.*,b.thumb,b.seo_url,b.nama_produk as jenis,c.jenis_bahan,c.harga,d.name,d.address,d.phone,d.cellphone');
        $this->db->from('kb_pemesanan as a');
        $this->db->join('kb_products as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->join('kb_bahan as c', 'a.id_bahan=c.id_bahan', 'LEFT');
        $this->db->join('kb_user_detail as d', 'a.id_session=d.ID', 'LEFT');
        $this->db->where('a.id_tampung_pemesanan',$uid);
        $this->db->order_by("a.id_produk", "desc");
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