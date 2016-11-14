<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class Opsi_website extends CI_Model {

	public function getdata() {
		$this->db->select('*');
		$this->db->from('kb_option');

		$query = $this->db->get();
		$result = $query->row();
        return $result;
	}

	public function proseslogin($username,$password) {
		$this->db->select('kb_users.ID,kb_users.user_login,kb_users.user_type,kb_user_detail.name,kb_user_detail.user_pic');
		$this->db->from('kb_users');
                $this->db->join('kb_user_detail','kb_user_detail.id = kb_users.id','LEFT');
		$this->db->where('kb_users.user_email', $username);
		$this->db->where('kb_users.user_pass', $password);

		$query = $this->db->get();
		if($query -> num_rows() == 1) {
		    return $query->result();
		} else {
		    return false;
		}
	}
        
                public function removeSpesial($string) {
            $string = str_replace(' ', '-', $string);
            $string = preg_replace('/[^A-Za-z0-9\-]/', '', $string);
            //$string = preg_replace('/-+?/', '', $string);
            
            return strtolower($string);
        }
}

?>