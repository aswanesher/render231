<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User_grup extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->library('encrypt');
		$this->load->model('opsi_website');
		$this->load->model('permission_model');
	}

	// Panggil halaman grup user
	public function index($p="",$a="")
	{
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_view)&&($per->is_view=='true')) {
				$query1=$this->input->post('query1');

				$param = array(
						'query1' => $query1
					);

				$data['query1'] = $query1;

				$datas=$this->opsi_website->getdata();
				$this->load->model('user_grup_model');
				$this->load->model('user_type_model');
				$data['user_type']=$this->user_type_model->get_data();

				$data['jumlah']= $this->user_grup_model->jumlah($param);

				// Config page
				$config['base_url'] = base_url().'/user_grup/index';
				$config['total_rows'] = $data['jumlah'];
				$config['per_page'] = 20;

				$dari = $this->uri->segment('3');
				$data['user']=$this->user_grup_model->get_dataall($param,$config['per_page'],$dari);

				$config['full_tag_open'] = '<ul class="pagination">';
		        $config['full_tag_close'] = '</ul>';
		        $config['first_link'] = false;
		        $config['last_link'] = false;
		        $config['first_tag_open'] = '<li>';
		        $config['first_tag_close'] = '</li>';
		        $config['prev_link'] = '&laquo';
		        $config['prev_tag_open'] = '<li class="prev">';
		        $config['prev_tag_close'] = '</li>';
		        $config['next_link'] = '&raquo';
		        $config['next_tag_open'] = '<li>';
		        $config['next_tag_close'] = '</li>';
		        $config['last_tag_open'] = '<li>';
		        $config['last_tag_close'] = '</li>';
		        $config['cur_tag_open'] = '<li class="active"><a href="#">';
		        $config['cur_tag_close'] = '</a></li>';
		        $config['num_tag_open'] = '<li>';
		        $config['num_tag_close'] = '</li>';

				$this->pagination->initialize($config);
                if($p==="x1" || $a==="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']="Pengaturan grup akun";
				$data['tambah']=$per->is_add;
				$data['edit']=$per->is_edit;
				$data['hapus']=$per->is_delete;

				$view = "templates/backend/user_grup_modul/user_grup_data";
				show($view, $data);
			} else if(empty($per->is_view)) {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('backend_panel/dashboard', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('backend_panel/dashboard', 'refresh');
			}
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Halaman tambah grup user
	public function add_user_grup($p="") {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_add)&&($per->is_add=='true')) {
				$datas=$this->opsi_website->getdata();
				$this->load->model('user_grup_model');

				$data['user']=$this->user_grup_model->get_data();

				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']="Tambah grup akun";
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
				$view = "templates/backend/user_grup_modul/add_user_grup";
				show($view, $data);
			} else if(empty($per->is_add)) {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user_grup', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user_grup', 'refresh');
			}
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Proses simpan user grup
	public function simpan_user_grup() {
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();
			$this->load->model('user_grup_model');

			// Validasi form
			$nama_grup=$this->form_validation->set_rules('nama_grup', 'Nama Grup', 'required|xss_clean');

			$nm_grup=$this->input->post('nama_grup');
			$todayf = date("Y-m-d H:i:s");

			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel']="Tambah grup akun";

			if ($this->form_validation->run() == FALSE) {
				$view = "templates/backend/user_grup_modul/add_user_grup";
				show($view, $data);
			} else {
					$inputusergrup = array(
						'type' => $nm_grup,
						'date_created' => $todayf
					);
					if($this->user_grup_model->save_data($inputusergrup)) {
                        $this->session->set_flashdata('success', 'Data ditambah!');
            			redirect('user_grup', 'refresh');
					} else {
						$this->session->set_flashdata('error', 'Data gagal ditambah!');
            			redirect('user_grup', 'refresh');
					}

			}
			redirect('user_grup', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Halaman ubah user grup
	public function editusergrup($id,$p="") {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_edit)&&($per->is_edit=='true')) {
				$datas=$this->opsi_website->getdata();
				$this->load->model('user_grup_model');

				$dt=$this->user_grup_model->get_data_edit($id);

				// Data
				$data['id'] = $dt->id;
				$data['nama_grup'] = $dt->type;

				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']="Ubah grup akun";
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
				$view = "templates/backend/user_grup_modul/edit_user_grup";
				show($view, $data);
			} else if(empty($per->is_edit)) {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user_grup', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user_grup', 'refresh');
			}
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Proses ubah user
	public function ubah_user_grup()
	{
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();
			$this->load->model('user_grup_model');

			// Validasi form
			$nama_lengkap=$this->form_validation->set_rules('nama_grup', 'Nama Grup', 'required|xss_clean');

			$idf=$this->input->post('idusergrup');
			$nmf=$this->input->post('nama_grup');
			$todayf = date("Y-m-d H:i:s");

			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel']="Ubah grup akun";

			if ($this->form_validation->run() == FALSE) {
				$view = "templates/backend/user_grup_modul/editusergrup/".$idf;
				show($view, $data);
			} else {
					$inputusergrup = array(
						'id' => $idf,
						'type' => $nmf,
						'date_modified' => $todayf
					);
					if($this->user_grup_model->update_data($idf,$inputusergrup)) {
						$this->session->set_flashdata('success', 'Data diubah!');
            			redirect('user_grup', 'refresh');
					} else {
						$this->session->set_flashdata('error', 'Data gagal diubah!');
            			redirect('user_grup', 'refresh');
					}
			}
			redirect('user_grup', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Hapus user grup
	public function delgrupuser($idusergrup)
	{
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_delete)&&($per->is_delete=='true')) {
				$this->load->model('user_grup_model');
				if($this->user_grup_model->hapususergrup($idusergrup)) {
					$this->session->set_flashdata('success', 'Data dihapus!');
            		redirect('user_grup', 'refresh');
				} else {
					$this->session->set_flashdata('error', 'Data gagal ditambah!');
            		redirect('user_grup', 'refresh');
				}
			} else if(empty($per->is_delete)) {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user_grup', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user_grup', 'refresh');
			}
		} else {
     		redirect('login', 'refresh');
		}
	}
}