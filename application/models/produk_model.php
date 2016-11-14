<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Produk_model extends CI_Model
{
    public $table = 'kb_products';

    function __construct()
    {
        parent::__construct();
    }

    function get_data()
    {
        $query = $this->db->get();
        return $query->result();
    }
    function get_seo($seo)
    {
        $this->db->select('seo_url');
        $this->db->from('kb_products');
        $this->db->where('seo_url', $seo);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }
    function get_data_prd()
    {
        $this->db->select('*');
        $this->db->from('kb_products as a');
        $this->db->join('kb_products_detail as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->order_by("a.id_produk", "desc");
        $query = $this->db->get();
        return $query->result();
    }

    function get_data_prd_detail_by_category($idkat)
    {
        $this->db->select('*');
        $this->db->from('kb_products as a');
        $this->db->join('kb_products_detail as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->where('a.kategori', $idkat);
        $this->db->where('a.status', 'publish');
        $this->db->order_by("a.id_produk", "desc");
        //$this->db->limit(4);
        $query = $this->db->get();
        return $query->result();
    }

    function get_data_prd_detail($permalink)
    {
        $this->db->select('*');
        $this->db->from('kb_products as a');
        $this->db->join('kb_products_detail as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->where('seo_url',$permalink);
        $this->db->where('status','publish');
        $this->db->order_by("a.id_produk", "desc");
        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_widget()
    {
        $this->db->select('*');
        $this->db->from('kb_products as a');
        //$this->db->join('kb_products_detail as b', 'a.id_produk=b.id_produk', 'LEFT');
        $this->db->order_by("a.id_produk", "desc");
        $this->db->limit(4);
        $query = $this->db->get();
        return $query->result();
    }

	function cekid_produk()
    {
        $this->db->select('id_produk');
        $this->db->from('kb_products');
        $this->db->order_by("id_produk", "desc");
        $this->db->limit(1);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

	function cekfoto($id)
    {
        $this->db->select('gambar_produk');
        $this->db->from('kb_products');
        $this->db->where("id_produk", $id);
        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }
	function get_kategori(){
		$this->db->select('*');
        $this->db->from('kb_products_category');	
		$this->db->where("is_parent", '1');
        $this->db->where("parent_id", '0');
        $query = $this->db->get();
        return $query->result();
	}
	function get_subkategori($wh){
		$this->db->select('id_prod_category,category');
        $this->db->from('kb_products_category');
		if($wh !=''){
			$this->db->where('parent_id', $wh);
		}
		$this->db->where("is_parent",'0');
        $query = $this->db->get();
        return $query->result();
	}
	function get_label(){
		 $this->db->select('*');
        $this->db->from('kb_label_produk');
        $query = $this->db->get();
        return $query->result();
	}

    function get_data_detail_by_id($id)
    {
        $this->db->select('*');
        $this->db->from('kb_products_detail');
        $this->db->where('id_produk', $id);
        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        //$this->db->select('a.*, b.category as kat, c.category as subkat, d.nama_label, e.harga');
        $this->db->select('a.*, d.nama_label');
        $this->db->from('kb_products as a');
        if($param['query1']!='') {
            $this->db->like('nama_produk',$param['query1']);
        }
        if($param['status']!='') {
            $this->db->where('status',$param['status']);
        }
        if($param['kategori']!='') {
            $this->db->where('kategori',$param['kategori']);
        }
        //$this->db->join('kb_products_category as b', 'a.kategori = b.id_prod_category', 'LEFT');
        //$this->db->join('kb_products_category as c', 'a.subkategori = c.id_prod_category', 'LEFT');
        $this->db->join('kb_label_produk as d', 'a.id_label = d.id_label', 'LEFT');
        //$this->db->join('kb_products_detail as e', 'a.id_produk = e.id_produk', 'LEFT');
        $this->db->limit($sampai,$dari);
        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall_front($param,$sampai,$dari)
    {
        $this->db->select('a.*, b.category as kat, c.category as subkat, d.nama_label, e.harga, e.diskon, e.ukuran');
        $this->db->from('kb_products as a');
        if($param['query1']!='') {
            $this->db->like('nama_produk',$param['query1']);
        }
        if($param['status']!='') {
            $this->db->where('status',$param['status']);
        }
        if($param['kategori']!='') {
            $this->db->where('kategori',$param['kategori']);
        }
        $this->db->join('kb_products_category as b', 'a.kategori = b.id_prod_category', 'LEFT');
        $this->db->join('kb_products_category as c', 'a.subkategori = c.id_prod_category', 'LEFT');
        $this->db->join('kb_label_produk as d', 'a.id_label = d.id_label', 'LEFT');
        $this->db->join('kb_products_detail as e', 'a.id_produk = e.id_produk', 'LEFT');
        $this->db->where('a.status', 'publish');
        $this->db->order_by('a.id_produk', 'desc');
        $this->db->limit($sampai,$dari);
        $query = $this->db->get();
        return $query->result();
    }

    function jumlah($param){
        if($param['query1']!='') {
            $this->db->like('nama_produk',$param['query1']);
        }
        if($param['status']!='') {
            $this->db->where('status',$param['status']);
        }
        if($param['kategori']!='') {
            $this->db->where('kategori',$param['kategori']);
        }
        //$this->db->join('kb_products_category as b', 'a.kategori = b.id_prod_category', 'LEFT');
        //$this->db->join('kb_products_category as c', 'a.subkategori = c.id_prod_category', 'LEFT');
        $this->db->join('kb_label_produk as d', 'a.id_label = d.id_label', 'LEFT');
        $this->db->join('kb_products_detail as e', 'a.id_produk = e.id_produk', 'LEFT');
        return $this->db->get('kb_products as a')->num_rows();
    }

    function jumlah_front(){
        /*if($param['query1']!='') {
            $this->db->like('nama_produk',$param['query1']);
        }
        if($param['status']!='') {
            $this->db->where('status',$param['status']);
        }
        if($param['kategori']!='') {
            $this->db->where('kategori',$param['kategori']);
        }
        $this->db->join('kb_products_category as b', 'a.kategori = b.id_prod_category', 'LEFT');
        $this->db->join('kb_products_category as c', 'a.subkategori = c.id_prod_category', 'LEFT');
        $this->db->join('kb_label_produk as d', 'a.id_label = d.id_label', 'LEFT');
        $this->db->join('kb_products_detail as e', 'a.id_produk = e.id_produk', 'LEFT');*/
        return $this->db->get('kb_products')->num_rows();
    }

    function jumlahs(){
        $this->db->join('kb_products_category as b', 'a.kategori = b.id_prod_category', 'LEFT');
        $this->db->join('kb_products_category as c', 'a.subkategori = c.id_prod_category', 'LEFT');
        $this->db->join('kb_label_produk as d', 'a.id_label = d.id_label', 'LEFT');
        $this->db->join('kb_products_detail as e', 'a.id_produk = e.id_produk', 'LEFT');
        return $this->db->get('kb_products as a')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_products');
        $this->db->where('id_produk', $id);
        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function cekidprodukdetail($iddetail,$idnya)
    {
        $this->db->select('id_detail_produk');
        $this->db->from('kb_products_detail');
        $this->db->where('id_detail_produk', $iddetail);
        $this->db->where('id_produk', $idnya);
        /*$this->db->where('harga', $harga);
        $this->db->where('diskon', $diskon);
        $this->db->where('ukuran', $ukuran);
        $this->db->where('berat', $berat);
        $this->db->where('qty', $qty);*/
        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_edit2($id)
    {
        $this->db->select('*');
        $this->db->from('kb_products_detail');
        $this->db->where('id_produk', $id);
        $query = $this->db->get();
        return $query->result();
    }

    function get_data_detail_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_products_detail');
        $this->db->where('id_produk', $id);
        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_products', $data);
        return $query;
    }

    function save_data_detail($data)
    {
        $query = $this->db->insert('kb_products_detail', $data);
        return $query;
    }


    function update_data($id,$data)
    {
        $this->db->where('id_produk', $id);
        return $this->db->update('kb_products', $data);
    }

    function update_data_detail($id,$data)
    {
        $this->db->where('id_produk', $id);
        return $this->db->update('kb_products_detail', $data);
    }

    function update_data_detail2($iddetail,$id,$data)
    {
        $this->db->where('id_produk', $id);
        $this->db->where('id_detail_produk', $iddetail);
        return $this->db->update('kb_products_detail', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_produk', $id);
        return $this->db->delete('kb_products');
    }

    function hapus_detail($id)
    {
        $this->db->where('id_detail_produk', $id);
        return $this->db->delete('kb_products_detail');
    }

}

/* End of file produk_model.php */
/* Location: ./application/models/produk_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-21 13:55:00 */
?>