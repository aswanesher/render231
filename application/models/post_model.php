<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Post_model extends CI_Model
{
    public $table = 'kb_posts';

    function __construct()
    {
        parent::__construct();
    }
    
    function cek($param) {
        $this->db->select('permalink');
        $this->db->from('kb_posts');
        $this->db->where('id_post', $param);

        $query = $this->db->get();
        return $query->result();
    }
    function get_data_link($id)
    {
        $this->db->select('permalink');
        $this->db->from('kb_posts');
        $this->db->where('id_post', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }
    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_posts');
        $this->db->where('post_type', 'post');

        $query = $this->db->get();
        return $query->result();
    }
        
    function get_alldata()
    {
        $this->db->select('*');
        $this->db->from('kb_posts');

        $query = $this->db->get();
        return $query->result();
    }


    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('kb_posts.*,kb_post_category.category');
        if($param['query1']!='') {
            $this->db->like('post_title',$param['query1']);
        }
        if($param['status']!='') {
            $this->db->where('post_status',$param['status']);
        }
        if($param['kategori']!='') {
            $this->db->where('post_parent',$param['kategori']);
        }
        $this->db->where('post_type', 'post');
        $this->db->join('kb_post_category','kb_posts.post_parent = kb_post_category.post_parent','left');
        $query = $this->db->get('kb_posts',$sampai,$dari);
        return $query->result();
    }

    function get_dataall_front($param,$sampai,$dari)
    {
        $this->db->select('kb_posts.*,kb_post_category.category');
        if($param['query1']!='') {
            $this->db->like('post_title',$param['query1']);
        }
        if($param['status']!='') {
            $this->db->where('post_status',$param['status']);
        }
        if($param['kategori']!='') {
            $this->db->where('post_parent',$param['kategori']);
        }
        $this->db->where('post_type', 'post');
        $this->db->where('kb_post_category.category', 'blog');
        $this->db->where('post_status', 'publish');
        $this->db->join('kb_post_category','kb_posts.post_parent = kb_post_category.post_parent','left');
        $this->db->order_by('id_post', 'desc');
        $query = $this->db->get('kb_posts',$sampai,$dari);
        return $query->result();
    }

    function jumlah($param){
        if($param['query1']!='') {
            $this->db->like('post_title',$param['query1']);
        }
        if($param['status']!='') {
            $this->db->where('post_status',$param['status']);
        }
        if($param['kategori']!='') {
            $this->db->where('post_parent',$param['kategori']);
        }
        $this->db->where('post_type', 'post');
        $this->db->join('kb_post_category','kb_posts.post_parent = kb_post_category.post_parent','left');
        return $this->db->get('kb_posts')->num_rows();
    }

    function jumlah_blog(){
        $this->db->select('kb_posts.*,kb_post_category.category');
        $this->db->where('post_type', 'post');
        $this->db->where('kb_post_category.category', 'blog');
        $this->db->where('post_status', 'publish');
        $this->db->join('kb_post_category','kb_posts.post_parent = kb_post_category.post_parent','left');

        $query = $this->db->get('kb_posts');
        $result = $query->num_rows();
        return $result;
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_posts');
        $this->db->where('id_post', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_detail($permalink)
    {
        $this->db->select('*');
        $this->db->from('kb_posts');
        $this->db->where('permalink', $permalink);
        $this->db->where('post_status', 'publish');

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_widget($id)
    {
        $this->db->select('*');
        $this->db->from('kb_posts');
        $this->db->where('id_post', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function get_data_widget_pricing($id)
    {
        $this->db->select('*');
        $this->db->from('kb_posts');
        $this->db->where('post_parent', $id);

        $query = $this->db->get();
        return $query->result();
    }

    function get_data_widget_blog($id)
    {
        $this->db->select('*');
        $this->db->from('kb_posts');
        $this->db->where('post_parent', $id);
        $this->db->order_by('id_post', 'desc');
        $this->db->limit(3);

        $query = $this->db->get();
        return $query->result();
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_posts', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id_post', $id);
        return $this->db->update('kb_posts', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_post', $id);
        return $this->db->delete('kb_posts');
    }
    function ceklink($link) {
        $this->db->select("permalink");
        $this->db->from("kb_posts");
        $this->db->where('permalink',$link);
        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

}

/* End of file post_model.php */
/* Location: ./application/models/post_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-24 05:13:11 */
?>