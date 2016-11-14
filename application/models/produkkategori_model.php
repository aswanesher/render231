<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Produkkategori_model extends CI_Model
{
    public $table = 'kb_products_category';

    function __construct()
    {
        parent::__construct();
    }
    
    function cekdata_produk($idkateg) {
        $this->db->select('kategori');
        $this->db->from('kb_products');
        $this->db->where('kategori',$idkateg);
        $query = $this->db->get();
        return $query->result();  
    }
    function get_seo($seo)
    {
        $this->db->select('seo_url');
        $this->db->from('kb_products_category');
        $this->db->where('seo_url', $seo);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }
    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_products_category');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('kb_products_category.category as nama_kateg,kb_users.display_name,a.*');
        if($param['query1']!='') {
            $this->db->like('kb_products_category.id_prod_category',$param['query1']);
            $this->db->or_like('kb_products_category.category',$param['query1']);
            $this->db->or_like('kb_products_category.seo_url',$param['query1']);
            $this->db->or_like('kb_users.display_name',$param['query1']);
        }
        
        $this->db->join('kb_products_category as a','kb_products_category.id_prod_category = a.parent_id','right');
        $this->db->join('kb_users','a.user_id = kb_users.id','left');
        $query = $this->db->get('kb_products_category',$sampai,$dari);
        return $query->result();
    }

    function jumlah($param){
        if($param['query1']!='') {
            $this->db->like('kb_products_category.id_prod_category',$param['query1']);
            $this->db->or_like('kb_products_category.category',$param['query1']);
            $this->db->or_like('kb_products_category.seo_url',$param['query1']);
            $this->db->or_like('kb_users.display_name',$param['query1']);
        }
        
        $this->db->join('kb_products_category as a','kb_products_category.id_prod_category = a.parent_id','right');
        $this->db->join('kb_users','a.user_id = kb_users.id','left');
        return $this->db->get('kb_products_category')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_products_category');
        $this->db->where('id_prod_category', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_products_category', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id_prod_category', $id);
        return $this->db->update('kb_products_category', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_prod_category', $id);
        return $this->db->delete('kb_products_category');
    }
    
    function get_parent() {
        $this->db->select('id_prod_category as id,category');
        $this->db->from('kb_products_category');
        $this->db->where('is_parent', "1");
        $query = $this->db->get();
        return $query->result(); 
    }

}

/* End of file produkkategori_model.php */
/* Location: ./application/models/produkkategori_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-05-19 11:21:34 */
?>