<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Menu_grup extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->library('encrypt');
		$this->load->model('opsi_website');
		$this->load->model('permission_model');
	}

	// Panggil halaman menu user
	public function index()
	{
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('menu_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_view)&&($per->is_view=='true')) {
				$query1=$this->input->post('query1');

				$param = array(
						'query1' => $query1
					);

				$data['query1'] = $query1;

				$datas=$this->opsi_website->getdata();
				$this->load->model('menu_grup_model');

				$data['jumlah']= $this->menu_grup_model->jumlah($param);

				// Config page
				$config['base_url'] = base_url().'/menu_grup/index';
				$config['total_rows'] = $data['jumlah'];
				$config['per_page'] = 20;

				$dari = $this->uri->segment('3');
				$data['menu_grup']=$this->menu_grup_model->get_dataall($param,$config['per_page'],$dari);

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

				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']=  $this->lang->line('menugroup');
				$data['tambah']=$per->is_add;
				$data['edit']=$per->is_edit;
				$data['hapus']=$per->is_delete;

				$view = "templates/backend/menu_grup_modul/menu_grup_data";
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
	public function add_menu_grup() {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('menu_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_add)&&($per->is_add=='true')) {
				$datas=$this->opsi_website->getdata();
				$this->load->model('menu_grup_model');

				$data['menu_grup']=$this->menu_grup_model->get_data();

				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']=  $this->lang->line('menugroup_tambah');

				$view = "templates/backend/menu_grup_modul/add_menu_grup";
				show($view, $data);
			} else if(empty($per->is_add)) {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('menu_grup', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('menu_grup', 'refresh');
			}
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Proses simpan user grup
	public function simpan_menu_grup() {
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();
			$this->load->model('menu_grup_model');

			// Validasi form
			$nama_grup=$this->form_validation->set_rules('nama_grup', 'Nama Grup', 'required|xss_clean');

			$nm_grup=$this->input->post('nama_grup');
			$abrev=strtolower(str_replace(" ", "-", $nm_grup));
			$todayf = date("Y-m-d H:i:s");

			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel'] = $this->lang->line('groupakun_tambah');

			if ($this->form_validation->run() == FALSE) {
				$view = "templates/backend/menu_grup_modul/add_menu_grup";
				show($view, $data);
			} else {
					$inputmenugrup = array(
						'title' => $nm_grup,
						'abbrev' => $abrev
					);
					if($this->menu_grup_model->save_data($inputmenugrup)) {
						$this->session->set_flashdata('success', 'Data ditambah!');
            			redirect('menu_grup', 'refresh');
					} else {
						$this->session->set_flashdata('error', 'Data gagal ditambah!');
            			redirect('menu_grup', 'refresh');
					}
			}
			redirect('menu_grup', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Halaman ubah user grup
	public function editmenugrup($id) {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('menu_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_edit)&&($per->is_edit=='true')) {
				$datas=$this->opsi_website->getdata();
				$this->load->model('menu_grup_model');

				$dt=$this->menu_grup_model->get_data_edit($id);

				// Data
				$data['id'] = $dt->id;
				$data['nama_grup'] = $dt->title;

				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']=  $this->lang->line('menugroup_rubah');

				$view = "templates/backend/menu_grup_modul/edit_menu_grup";
				show($view, $data);
			} else if(empty($per->is_edit)) {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user', 'refresh');
			}
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Proses ubah user
	public function ubah_menu_grup()
	{
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();
			$this->load->model('menu_grup_model');

			// Validasi form
			$nama_lengkap=$this->form_validation->set_rules('nama_grup', 'Nama Grup', 'required|xss_clean');

			$idf=$this->input->post('idmenugrup');
			$nmf=$this->input->post('nama_grup');
			$abrev=strtolower(str_replace(" ", "-", $nmf));

			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel']=  $this->lang->line('menugroup_rubah');

			if ($this->form_validation->run() == FALSE) {
				$view = "templates/backend/menu_grup_modul/editmenugrup/".$idf;
				show($view, $data);
			} else {
				$inputmenugrup = array(
					'id' => $idf,
					'title' => $nmf,
					'abbrev' => $abrev
				);
				if($this->menu_grup_model->update_data($idf,$inputmenugrup)) {
					$this->session->set_flashdata('success', 'Data diubah!');
        			redirect('menu_grup', 'refresh');
				} else {
					$this->session->set_flashdata('error', 'Data gagal diubah!');
        			redirect('menu_grup', 'refresh');
				}
			}
			redirect('menu_grup', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Hapus user grup
	public function delgrupmenu($idmenugrup)
	{
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('menu_grup');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_delete)&&($per->is_delete=='true')) {
				$this->load->model('menu_grup_model');
				if($this->menu_grup_model->hapusmenugrup($idmenugrup)) {
					$this->session->set_flashdata('success', 'Data dihapus!');
            		redirect('menu_grup', 'refresh');
				} else {
					$this->session->set_flashdata('error', 'Data gagal ditambah!');
            		redirect('menu_grup', 'refresh');
				}
			} else if(empty($per->is_delete)) {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
            	redirect('user', 'refresh');
			}
		} else {
     		redirect('login', 'refresh');
		}
	}
}
?>