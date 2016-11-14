<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->library('encrypt');
		$this->load->model('opsi_website');
		$this->load->model('permission_model');
                
                //$this->load->library('IOFactory');
	}

	// Halaman user
	public function index($p="",$a="") {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user');
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
				$this->load->model('users_model');
				$this->load->model('user_type_model');
				$data['user_type']=$this->user_type_model->get_data();

				$data['jumlah']= $this->users_model->jumlah($param);

				// Config page
				$config['base_url'] = base_url().'/user/index/';
				$config['total_rows'] = $data['jumlah'];
				$config['per_page'] = 20;

				$dari = $this->uri->segment('3');
				$data['user']=$this->users_model->get_dataall($param,$config['per_page'],$dari);

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
                    $data['pesan'] = 'Gagal Menghapus Data';
                }
				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']="Pengaturan akun";
				$data['tambah']=$per->is_add;
				$data['edit']=$per->is_edit;
				$data['hapus']=$per->is_delete;

				$view = "templates/backend/user_modul/user_data";
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

	// Halaman tambah user
	public function add_user($p="") {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_add)&&($per->is_add=='true')) {
				session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false; 
				$datas=$this->opsi_website->getdata();
				$this->load->model('users_model');
				$this->load->model('user_type_model');
				$data['user']=$this->users_model->get_data();
				$data['user_type']=$this->user_type_model->get_data();

				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']="Tambah akun";
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
				$view = "templates/backend/user_modul/add_user";
				show($view, $data);
			} else if(empty($per->is_add)) {
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

	// Proses simpan user
	public function simpan_user() {
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();
			$this->load->model('users_model');

			$r=$this->users_model->cekid();
			$idnya = $r->ID+1;

			// Validasi form
			$nama_lengkap=$this->form_validation->set_rules('nama_lengkap', 'Nama Lengkap', 'required|xss_clean');
			$username=$this->form_validation->set_rules('username','Username','trim|required|xss_clean');
			$email=$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean');
			$passwd=$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');
                        
			$nmf=$this->input->post('nama_lengkap');
			$grupf=$this->input->post('grup');
			$usernamef=$this->input->post('username');
			$emailf=$this->input->post('email');
			$passwdf=$this->input->post('password');
			$alamatf=$this->input->post('alamat');
			$teleponf=$this->input->post('telepon');
			$handphonef=$this->input->post('hp');
			$facebookf=$this->input->post('facebook');
			$twitterf=$this->input->post('twitter');
			$linkedinf=$this->input->post('linkedin');
			$instagramf=$this->input->post('instagram');
			$bbmf=$this->input->post('bbm');
			$whatsappf=$this->input->post('whatsapp');
                        $gambar = $this->input->post("foto");
			$passwordf=$this->encrypt->sha1($passwdf);
			$todayf = date("Y-m-d H:i:s");
			$activationkeyf = $this->encrypt->sha1($usernamef."-".$todayf);

			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel']="Tambah akun";

			if ($this->form_validation->run() == FALSE) {
				$view = "templates/backend/user_modul/add_user";
				show($view, $data);
			} else {
					$inputusers = array(
						'ID' => $idnya,
						'user_login' => $usernamef,
						'user_pass' => $passwordf,
						'display_name' => ucfirst($usernamef),
						'user_email' => $emailf,
						'user_registered' => $todayf,
						'user_activation_key' => $activationkeyf,
						'user_status' => '0',
						'user_type' => $grupf
					);
					if(!$this->users_model->save_data($inputusers)) {
                                            redirect('user/add_user/x1','refresh');
                                            return;
                                        }

					$inputdetailusers = array(
						'ID' => $idnya,
						'name' => $nmf,
						'address' => $alamatf,
						'phone' => $teleponf,
						'cellphone' => $handphonef,
						'user_pic' => $gambar,
						'fb_url' => $facebookf,
						'twitter_url' => $twitterf,
						'linkedin_url' => $linkedinf,
						'instagram_url' => $instagramf,
						'bbm_pin' => $bbmf,
						'whatsapp' => $whatsappf
					);

					if($this->users_model->save_detail($inputdetailusers)) {
						$this->session->set_flashdata('success', 'Data ditambah!');
            			redirect('user', 'refresh');
					} else {
						$this->session->set_flashdata('error', 'Gagal input data!');
            			redirect('user', 'refresh');
					}
			}
			redirect('user', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}

	// Hapus user
	public function deluser($iduser)
	{
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_delete)&&($per->is_delete=='true')) {
				$this->load->model('users_model');
				if($this->users_model->hapususer($iduser)) {
					//redirect('user', 'refresh');
					$this->session->set_flashdata('success', 'Data dihapus!');
            		redirect('user', 'refresh');
				} else {
					$this->session->set_flashdata('error', 'Maaf, Data gagal dihapus!');
            		redirect('user', 'refresh');
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

	// Halaman ubah user
	public function edituser($id,$p="") {
		$usr=$this->session->userdata('logged_in');
		$mod=$this->permission_model->get_data_module('user');
		$per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

		if($this->session->userdata('logged_in')) {
			if(!empty($per->is_edit)&&($per->is_edit=='true')) {
				$datas=$this->opsi_website->getdata();
				$this->load->model('users_model');
				$this->load->model('user_type_model');

				$dt=$this->users_model->get_data_edit($id);
                                            session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false; 
				// Data
				$data['id'] = $dt->ID;
				$data['nama_lengkap'] = $dt->name;
				$data['username'] = $dt->user_login;
				$data['email'] = $dt->user_email;
				$data['alamat'] = $dt->address;
				$data['phone'] = $dt->phone;
				$data['cellphone'] = $dt->cellphone;
				$data['fb'] = $dt->fb_url;
				$data['twitter'] = $dt->twitter_url;
				$data['linkedin'] = $dt->linkedin_url;
				$data['instagram'] = $dt->instagram_url;
				$data['bbm'] = $dt->bbm_pin;
				$data['whatsapp'] = $dt->whatsapp;
				$data['gambar'] = $dt->user_pic;
				$data['grup'] = $dt->user_type;
				$data['posisi'] = $dt->position;

				$data['user_type']=$this->user_type_model->get_data();

				$data['judul']=$datas->website_title;
				$data['company']=$datas->company_name;
				$data['judul_panel']="Ubah akun";
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
				$view = "templates/backend/user_modul/edit_user";
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
	public function ubah_user()
	{
		if($this->session->userdata('logged_in')) {

			$datas=$this->opsi_website->getdata();
			$this->load->model('users_model');

			// Validasi form
			$nama_lengkap=$this->form_validation->set_rules('nama_lengkap', 'Nama Lengkap', 'required|xss_clean');
			$username=$this->form_validation->set_rules('username','Username','trim|required|xss_clean');
			$email=$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean');

			$idf=$this->input->post('iduser');
			$nmf=$this->input->post('nama_lengkap');
			$grupf=$this->input->post('grup');
			$usernamef=$this->input->post('username');
			$emailf=$this->input->post('email');
			$alamatf=$this->input->post('alamat');
			$teleponf=$this->input->post('telepon');
			$handphonef=$this->input->post('hp');
			$facebookf=$this->input->post('facebook');
			$twitterf=$this->input->post('twitter');
			$linkedinf=$this->input->post('linkedin');
			$instagramf=$this->input->post('instagram');
			$bbmf=$this->input->post('bbm');
			$whatsappf=$this->input->post('whatsapp');
			$posisif=$this->input->post('posisi');
			$fotof=$this->input->post('foto');

			$data['judul']=$datas->website_title;
			$data['company']=$datas->company_name;
			$data['judul_panel']="Tambah akun";

			if ($this->form_validation->run() == FALSE) {
				$view = "templates/backend/user_modul/edituser/".$idf;
				show($view, $data);
			} else {
					$inputusers = array(
						'ID' => $idf,
						'user_login' => $usernamef,
						'display_name' => ucfirst($usernamef),
						'user_email' => $emailf,
						'user_type' => $grupf,
						'position'=>$posisif
					);
					if(!$this->users_model->update_data($idf,$inputusers)) {
                                            redirect('user/edituser/'.$idf.'/x1','refresh');
                                            return;
                                        }

					$inputdetailusers = array(
						'ID' => $idf,
						'name' => $nmf,
						'address' => $alamatf,
						'phone' => $teleponf,
						'cellphone' => $handphonef,
						'user_pic' => $fotof,
						'fb_url' => $facebookf,
						'twitter_url' => $twitterf,
						'linkedin_url' => $linkedinf,
						'instagram_url' => $instagramf,
						'bbm_pin' => $bbmf,
						'whatsapp' => $whatsappf
					);

					if($this->users_model->update_detail($idf,$inputdetailusers)) {
						$this->session->set_flashdata('success', 'Data diubah!');
            			redirect('user', 'refresh');
					} else {
						$this->session->set_flashdata('success', 'Data gagal ditambah!');
            			redirect('user', 'refresh');
					}
			}
			redirect('user', 'refresh');
		} else {
     		redirect('backend_panel', 'refresh');
		}
	}
        
        function export() {
            $this->load->model('users_model');
            $this->load->model('user_type_model');
            $this->load->library('Excel');
            $obj = new PHPExcel();
            $obj->getProperties()->setTitle("Export")->setDescription("none");
            $obj->setActiveSheetIndex(0);
            
            $data = $this->users_model->get_data_export();
            $field = $data->list_fields();
            $col=0;
            foreach ($field as $f) {
                $obj->getActiveSheet()->setCellValueByColumnAndRow($col,1,$f);
                $col++;
            }
            $row =2;
            foreach ($data->result() as $fields) {
                $col=0;
                foreach ($field as $value) {
                    $obj->getActiveSheet()->setCellValueByColumnAndRow($col,$row,$fields->$value);
                    $col++;
                }
                $row++;
            }
            $obj->setActiveSheetIndex(0);
            $objw = PHPExcel_IOFactory::createWriter($obj,'excel5');
            
            header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="User_'.date('dMy').'.xls"');
        header('Cache-Control: max-age=0');
        
        $objw->save('php://output');
        redirect('user','refresh');
        }
}