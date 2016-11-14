<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Menu extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->library('encrypt');
		$this->load->model('opsi_website');
		$this->load->model('modul_model');
		$this->load->model('menu_model');
                $this->load->model('post_model');
		$this->load->model('permission_model');
	}

	// Halaman user
	public function index() {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('menu');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_view)&&($per->is_view=='true')) {
				$query1=$this->input->post('query1');
				$status=$this->input->post('status');
				$grup=$this->input->post('grup');

				$param = array(
						'query1' => $query1,
						'status' => $status,
						'grup' => $grup
					);

				$data['query1'] = $query1;
				$data['status'] = $status;
				$data['grup'] = $grup;

				$datas=$this->opsi_website->getdata();
				$this->load->model('menu_grup_model');
				$data['menu_type']=$this->menu_grup_model->get_data();

				$data['jumlah']= $this->menu_model->jumlah($param);
                                $data['post'] = $this->post_model->get_alldata();
				// Config page
				$config['base_url'] = base_url().'/menu/index';
				$config['total_rows'] = $data['jumlah'];
				$config['per_page'] = 20;

				$dari = $this->uri->segment('3');
				$data['menu']=$this->menu_model->get_dataall($param,$config['per_page'],$dari);
				$data['modul']=$this->modul_model->get_data();

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
				$data['judul_panel']=  $this->lang->line('menu');
				$data['tambah']=$per->is_add;
				$data['edit']=$per->is_edit;
				$data['hapus']=$per->is_delete;
				$this->menu =& get_instance();

				$view = "templates/backend/menu_modul/menu_data";
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

	public function submenu($id) {
		$data=$this->menu_model->get_submenu($id);
		return $data;
	}

	// Proses simpan menu
	public function simpan_menu() {
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();

			$nm_menu=$this->input->post('nama_menu');
			$mod_name=$this->input->post('mod_name');
                        $position = $this->input->post('position');
			$nmod=$this->modul_model->cek($mod_name);
			$modul = $nmod->module_name;
                        
                        if($position == 'backend') {
			$data=array(
					'title' => $nm_menu,
					'link_type' => 'module',
					'idmodule' => $mod_name,
					'url' => $modul,
					'dyn_group_id' => '1',
					'position' => $position,
					'parent_id' => '0',
					'is_parent' => '1',
					'show_menu' => '1',
					'icon' => 'fa fa-caret-right'
				);
			$this->menu_model->save_data($data);
                        }
                        else {
                            
                            $link = $this->input->post('link_type');
                            $nmod = $this->post_model->cek($mod_name);
                            $modul = $nmod[0]->permalink;
                            
			$data=array(
					'title' => $nm_menu,
					'link_type' => $link,
					'idmodule' => '',
					'url' => 'p/'.$modul,
					'uri' => $modul,
					'dyn_group_id' => '1',
					'position' => $position,
					'parent_id' => '0',
					'is_parent' => '1',
					'show_menu' => '1',
					'icon' => 'fa fa-caret-right'
				);
				if($this->menu_model->save_data($data)) {
					$this->session->set_flashdata('success', 'Data ditambah!');
            		redirect('menu', 'refresh');
				} else {
					$this->session->set_flashdata('error', 'Data gagal ditambah!');
            		redirect('menu', 'refresh');
				}
            }

			redirect('menu', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}
        
        

	// Proses simpan menu custom
	public function simpan_menu_custom() {
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();

			$nm_menu=$this->input->post('nama_menu_custom');
			$mod_name=$this->input->post('url_menu_custom');
                        $position = $this->input->post('position');
			$data=array(
					'title' => $nm_menu,
					'link_type' => 'module',
					'idmodule' => '0',
					'url' => $mod_name,
					'dyn_group_id' => '1',
					'position' => $position,
					'parent_id' => '0',
					'is_parent' => '1',
					'show_menu' => '1',
					'icon' => 'fa fa-caret-right'
				);
			if($this->menu_model->save_data($data)) {
				$this->session->set_flashdata('success', 'Data ditambah!');
            	redirect('menu', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Data gagal ditambah!');
            	redirect('menu', 'refresh');
			}

			redirect('menu', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	public function ubah_urutan_menu()
	{
                $pst = $this->input->post('pst');
                if($pst == 'bo') {
                   $menu = $this->input->post('arr2'); 
                }
                else {
                    $menu = $this->input->post('arr1');
                }
		
		$as=json_decode($menu);
                print_r(json_encode($as));
		foreach ($as as $key => $value) {
			if(!empty($value->children)) {
				foreach ($value->children as $keys => $dt) {
					//echo $value->id."<br>";
					//echo $dt->id."<br>";
                                            if (!empty($dt->children)) {
                                                foreach ($dt->children as $k => $dt_) {
                                                $data = array(    	'parent_id' => $dt->id,
							'is_parent' => '0',
							'icon' => ''
						);
					$this->menu_model->update_data($dt_->id, $data);
                                                }
                                            }
                                            else {
					$data = array(
							'parent_id' => $value->id,
							'is_parent' => '0',
							'icon' => ''
						);
					if($this->menu_model->update_data($dt->id, $data)) {
						$this->session->set_flashdata('success', 'Urutan diubah!');
            			redirect('menu', 'refresh');
					} else {
						$this->session->set_flashdata('error', 'Urutan gagal diubah!');
            			redirect('menu', 'refresh');
					}
					}
				}
			} else {
				$data = array(
							'parent_id' => '0',
							'is_parent' => '1',
							'icon' => 'fa fa-caret-right'
						);
				if($this->menu_model->update_data($value->id, $data)) {
					$this->session->set_flashdata('success', 'Urutan ditambah!');
            		redirect('menu', 'refresh');
				} else {
					$this->session->set_flashdata('error', 'Urutan gagal diubah!');
            		redirect('menu', 'refresh');
				}
			}
		}
		redirect('menu', 'refresh');
	}

	// Hapus user
	public function delmenu($id)
	{
		if($this->session->userdata('logged_in')) {
			if($this->menu_model->hapusmenu($id)) {
				$this->session->set_flashdata('success', 'Data dihapus!');
            	redirect('menu', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Data gagal dihapus!');
            	redirect('menu', 'refresh');
			}
		} else {
     		redirect('login', 'refresh');
		}
	}

	// Halaman ubah menu
	public function editmenu($id) {
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();

			$dt=$this->menu_model->get_data_edit($id);

			// Data
			$data['id'] = $dt->id;
			$data['nama_menu'] = $dt->title;
			$data['url'] = $dt->url;
			$data['idmodul'] = $dt->idmodule;
			$data['modul']=$this->modul_model->get_data();

			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel']="Ubah menu";

			$view = "templates/backend/menu_modul/edit_menu";
			show($view, $data);
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Proses ubah user
	public function ubah_menu()
	{
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();

			$idm=$this->input->post('idmenu');
			$nmm=$this->input->post('nama_menu');
			$modul=$this->input->post('modul');
			$url=$this->input->post('url_menu');

			if(empty($url)) {
				$editmenu = array(
					'id' => $idm,
					'title' => $nmm,
					'idmodule' => $modul
				);
			} else {
				$editmenu = array(
					'id' => $idm,
					'title' => $nmm,
					'url' => $url
				);
			}
			if($this->menu_model->update_data($idm,$editmenu)) {
				$this->session->set_flashdata('success', 'Data diubah!');
            	redirect('menu', 'refresh');
			} else {
				$this->session->set_flashdata('error', 'Data gagal diubah!');
            	redirect('menu', 'refresh');
			}
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}
}