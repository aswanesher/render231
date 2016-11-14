<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Menu_model extends CI_Model {

    function get_data()
    {
		$this->db->select('*');
        $this->db->from('kb_menu');
        $this->db->join('kb_menu_group', 'kb_menu.dyn_group_id = kb_menu_group.id', 'LEFT');

        $query = $this->db->get();
        return $query->result();
    }

    function get_data_frontend()
    {
        $this->db->select('*');
        $this->db->from('kb_menu');
        $this->db->where('position','frontend');
        $this->db->where('is_parent','1');
        $this->db->order_by('id','asc');

        $query = $this->db->get();
        return $query->result();
    }

    function get_submenu($id)
    {
        $this->db->select('kb_menu.id,kb_menu.icon,kb_menu.title,kb_menu.url,kb_menu.link_type,kb_menu.position');
        $this->db->from('kb_menu');
        $this->db->join('kb_menu_group', 'kb_menu.dyn_group_id = kb_menu_group.id', 'LEFT');
        $this->db->where('parent_id',$id);

        $query = $this->db->get();
        return $query->result();
    }

    function get_submenu_frontend($id)
    {
        $this->db->select('kb_menu.id,kb_menu.icon,kb_menu.title,kb_menu.url,kb_menu.link_type,kb_menu.position');
        $this->db->from('kb_menu');
        $this->db->join('kb_menu_group', 'kb_menu.dyn_group_id = kb_menu_group.id', 'LEFT');
        $this->db->where('parent_id',$id);

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('kb_menu.id,kb_menu.icon,kb_menu.title,kb_menu.url,kb_menu.link_type,kb_menu.position,kb_menu.is_parent');
        $this->db->join('kb_menu_group', 'kb_menu.dyn_group_id = kb_menu_group.id', 'LEFT');
        $this->db->where('is_parent', '1');
        if($param['query1']!='') {
            $this->db->like('title',$param['query1']);
        } else if($param['status']!='') {
            $this->db->where('position',$param['status']);
        } else if($param['grup']!='') {
            $this->db->where('dyn_group_id',$param['grup']);
        }

        $query = $this->db->get('kb_menu',$sampai,$dari);
        return $query->result();
    }

    function jumlah($param){
        if($param['query1']!='') {
            $this->db->like('title',$param['query1']);
        } else if($param['status']!='') {
            $this->db->where('position',$param['status']);
        } else if($param['grup']!='') {
            $this->db->where('dyn_group_id',$param['grup']);
        }
        return $this->db->get('kb_menu')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_menu');
        $this->db->where('id', $id);

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
        $query = $this->db->insert('kb_menu', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id', $id);
        return $this->db->update('kb_menu', $data);
    }

    function hapusmenu($id)
    {
        $this->db->where('id', $id);
        return $this->db->delete('kb_menu');
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
    function updateUrl($ur,$data) {
        $this->db->where('url',$ur);
        return $this->db->update('kb_menu',$data);
    }
    function hapuslink($id)
    {
        $this->db->where('url', "p/".$id);
        return $this->db->delete('kb_menu');
    }
}

?>