<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Users_model extends CI_Model {

    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_users');
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');
        $this->db->join('kb_user_type', 'kb_users.user_type = kb_user_type.id', 'LEFT');
        $query = $this->db->get();
        return $query->result();
    }
    
    function get_data_export()
    {
        $this->db->select('*');
        $this->db->from('kb_users');
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');

        $query = $this->db->get();
        return $query;
    }    
    
    function get_data_widget_team($id)
    {
        $this->db->select('*');
        $this->db->from('kb_users');
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');
        $this->db->where('user_type',$id);

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('kb_users.*,kb_user_detail.*,kb_user_type.type as grup');
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');
        $this->db->join('kb_user_type', 'kb_users.user_type = kb_user_type.id', 'LEFT');
        if($param['query1']!='') {
            $this->db->like('name',$param['query1']);
            //$this->db->or_like('user_status',$param['status']);
        } //else if($param['status']!='') {
            
        //}
        else if($param['grup']!='') {
            $this->db->where('user_type',$param['grup']);
        }

        $query = $this->db->get('kb_users',$sampai,$dari);
        return $query->result();
    }

    function get_dataall_front($param,$sampai,$dari)
    {
        $this->db->select('kb_users.*,kb_user_detail.*');
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');
        if(!empty($param)) {
            $this->db->where('user_type',$param['katid']);
            $this->db->or_where('user_type',$param['katid2']);
            //$this->db->like('name', $param['qwords']);
            $this->db->like('address', $param['qwords']);
            //$this->db->or_like('address', $param['qwords']);
            //$this->db->like('name', $param['qwords']);
            //$this->db->or_like('address', $param['qwords']);
        } 
        $query = $this->db->get('kb_users',$sampai,$dari);
        return $query->result();
    }

    function jumlah($param){
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');
        $this->db->join('kb_user_type', 'kb_users.user_type = kb_user_type.id', 'LEFT');
        if($param['query1']!='') {
            $this->db->like('name',$param['query1']);
            $this->db->or_like('user_status',$param['status']);
        } //else if($param['status']!='') {
            
        //}
        else if($param['grup']!='') {
            $this->db->where('user_type',$param['grup']);
        }
        return $this->db->get('kb_users')->num_rows();
    }

    function jumlah_front($param){
        $this->db->select('kb_users.*,kb_user_detail.*');
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');
        if(!empty($param)) {
            $this->db->where('user_type',$param['katid']);
            $this->db->or_where('user_type',$param['katid2']);
            $this->db->like('address', $param['qwords']);
        } 
        $query = $this->db->get('kb_users');
        return $query->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_users');
        $this->db->join('kb_user_detail', 'kb_users.ID = kb_user_detail.ID', 'LEFT');
        $this->db->where('kb_users.ID', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function cekid()
    {
        $this->db->select('ID');
        $this->db->from('kb_users');
        $this->db->order_by("ID", "desc");
        $this->db->limit(1);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function cekemail($email)
    {
        $this->db->select('*');
        $this->db->from('kb_users');
        $this->db->where("user_email", $email);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function cekaktivasikode($act)
    {
        $this->db->select('*');
        $this->db->from('kb_users');
        $this->db->where("user_activation_key", $act);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function cekfoto($id)
    {
        $this->db->select('user_pic');
        $this->db->from('kb_user_detail');
        $this->db->where("ID", $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_users', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('ID', $id);
        return $this->db->update('kb_users', $data);
    }

    function hapususer($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete('kb_users');
    }

    function save_detail($data)
    {
        $query = $this->db->insert('kb_user_detail', $data);
        return $query;
    }

    function update_detail($id,$data)
    {
        $this->db->where('ID', $id);
        return $this->db->update('kb_user_detail', $data);
    }
    
    function get_user_sales($nama) {
        $this->db->select('kb_users.id , kb_users.display_name, kb_user_detail.name');
        $this->db->from('kb_users');
        $this->db->join('kb_user_type','kb_users.user_type = kb_user_type.id','INNER');
        $this->db->join('kb_user_detail','kb_users.ID = kb_user_detail.ID','INNER');
        $this->db->where("kb_user_type.type", $nama);
        $this->db->order_by('kb_users.id','desc');
        $query = $this->db->get();
        return $query->result();
    }
}

?>