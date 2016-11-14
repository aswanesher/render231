<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Backend_panel extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->library('encrypt');
		$this->load->model('opsi_website');
                $this->load->model('salestarget_model');
	}

	////////// INDEX FUNCTION ///////////
	public function index()
	{

		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		if($this->session->userdata('logged_in')) { 
			redirect('backend_panel/dashboard', 'refresh');
		} else {
			$this->load->view('login', $data);
		}
	}

	////////// PROSES LOGIN ////////////
	public function loginproses() {

		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;

		$email=$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean');
		$passwd=$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');

		$passwdnya=$this->input->post('password');
		$emailnya=$this->input->post('email');
		$password=$this->encrypt->sha1($passwdnya);

		if ($this->form_validation->run() == FALSE) {
			$this->load->view('login',$data);
		} else {
			$result = $this->opsi_website->proseslogin($emailnya,$password);
			if($result != FALSE) {
				$sess_array = array();
				foreach($result as $row)
			    {
                   /*if($row->user_pic != '') {
                      $foto = $row->user_pic;
                   } else {
                      $foto = base_url()."/uploads/.thumbs/images/no_images.jpg";
                   }*/
			       $sess_array = array(
			         'id' => $row->ID,
			         'user' => $row->user_login,
			         'group' => $row->user_type,
                     'name'=>$row->name,
                     //'foto'=>$foto
			       );
			       //$this->session->set_userdata('ses_kcfinder', array('disabled' => false, 'uploadURL' => '../content_upload'));
			       $this->session->set_userdata('logged_in', $sess_array);
     			   redirect('backend_panel/dashboard', 'refresh');
			    }
			} else {
				$data['error_message']= $this->lang->line('error_message_login');
				$this->load->view('login', $data);
			}
		}
	}

	// Proses tampil halaman dashboard
	public function dashboard() {
		$usr=$this->session->userdata('logged_in');
		if($this->session->userdata('logged_in')) {
            $this->load->model('users_model');
			$datas=$this->opsi_website->getdata();
			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel']="Dashboard";
            $idtargeti = $this->salestarget_model->getID(Date("M-Y"));
            if(!$idtargeti) {
                $idtarget=0;
            } else {
                $idtarget = $idtargeti->id_target;  
            }
	        $data['nama_target'] = $this->salestarget_model->get_data_edit($idtarget);
	        $data['sum'] = $this->salestarget_model->sumPenjualan($idtarget);
	        $isi = $this->salestarget_model->grafikpertarget($idtarget)->result_array();
        	foreach($isi as $row)
			{
				$data['grafik'][]=(float)$row['jumlah_jual'];
	                        $data['salesa'][]=$row['user_login'];
			}
            $data['users'] = $this->users_model->get_data();
            $fto=$this->users_model->cekfoto($usr['id']);
            $data['foto'] = $fto->user_pic;
			$view = "templates/backend/home";
			show($view, $data);
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	public function logout() {
		session_start();
		$this->session->unset_userdata('logged_in');
		$this->session->unset_userdata('ses_kcfinder');
   		session_destroy();
   		redirect('backend_panel', 'refresh');
	}
}?>