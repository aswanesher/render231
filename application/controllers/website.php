<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Website extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('website_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="",$a="")
    {
        $mod=$this->permission_model->get_data_module('website');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_view=='true') {
                /* this is for searching */
                $query1=$this->input->post('query1');

                $param = array(
                    'query1' => $query1
                );

                $data['query1'] = $query1;

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->website_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/website/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['website']=$this->website_model->get_dataall($param,$config['per_page'],$dari);

                $config['full_tag_open'] = '<ul class=pagination>';
                $config['full_tag_close'] = '</ul>';
                $config['first_link'] = false;
                $config['last_link'] = false;
                $config['first_tag_open'] = '<li>';
                $config['first_tag_close'] = '</li>';
                $config['prev_link'] = '&laquo';
                $config['prev_tag_open'] = '<li class=prev>';
                $config['prev_tag_close'] = '</li>';
                $config['next_link'] = '&raquo';
                $config['next_tag_open'] = '<li>';
                $config['next_tag_close'] = '</li>';
                $config['last_tag_open'] = '<li>';
                $config['last_tag_close'] = '</li>';
                $config['cur_tag_open'] = '<li class=active><a href=#>';
                $config['cur_tag_close'] = '</a></li>';
                $config['num_tag_open'] = '<li>';
                $config['num_tag_close'] = '</li>';

                $this->pagination->initialize($config);
                if($p==="x1" || $a==="x1") {
                    $data['pesan'] = 'Gagal Menghapus Data';
                }
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Pengaturan website';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/website_modul/website_data';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function website_add($p="")
    {
        $mod=$this->permission_model->get_data_module('website');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();

                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false;

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah website';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/website_modul/website_add';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function website_save()
    {
        if($this->session->userdata('logged_in')) {
			$id_user=$this->session->userdata('logged_in');
            $data=array(		   
			'meta_author'=>$id_user->id,
			'website_title'=>$this->input->post('website_title'),
			'website_desc'=>$this->input->post('website_desc'),
			'company_name'=>$this->input->post('company_name'),
			'contact_address'=>$this->input->post('contact_address'),
			'contact_email'=>$this->input->post('contact_email'),
			'contact_phone'=>$this->input->post('contact_phone'),
			'contact_fax'=>$this->input->post('contact_fax'),
			'contact_cellphone'=>$this->input->post('contact_cellphone'),
			'meta_title'=>$this->input->post('meta_title'),
			'meta_keywords'=>$this->input->post('meta_keywords'),
			'meta_desc'=>$this->input->post('meta_desc'),
			'favicon'=>$this->input->post('favicon')
				);
        if($this->website_model->save_data($data)) {				
			redirect('website','refresh');
        }
        else {
            redirect('website/website_add/x1','refresh');
        }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function website_edit($id,$p="")
    {
        $mod=$this->permission_model->get_data_module('website');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_edit=='true') {
                $datas=$this->opsi_website->getdata();
                $dt=$this->website_model->get_data_edit($id);
			$data['id'] = $id;
			$data['website_title'] = $dt->website_title;
			$data['website_desc'] = $dt->website_desc;		
			$data['company_name'] = $dt->company_name;
			$data['contact_address'] = $dt->contact_address;
			$data['contact_email'] = $dt->contact_email;
			$data['contact_phone'] = $dt->contact_phone;
			$data['contact_fax'] = $dt->contact_fax;
			$data['contact_cellphone'] = $dt->contact_cellphone;
			$data['meta_title'] = $dt->meta_title;
			$data['meta_keywords'] = $dt->meta_keywords;
			$data['meta_desc'] = $dt->meta_desc;
			$data['favicon'] = $dt->favicon;	

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah website';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
                $view = 'templates/backend/website_modul/website_edit';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function website_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
				
			$id_user=$this->session->userdata('logged_in');
			$id =$this->input->post('id');	
			 $data=array(	   
			
			'website_title'=>$this->input->post('website_title'),
			'website_desc'=>$this->input->post('website_desc'),
			'company_name'=>$this->input->post('company_name'),
			'contact_address'=>$this->input->post('contact_address'),
			'contact_email'=>$this->input->post('contact_email'),
			'contact_phone'=>$this->input->post('contact_phone'),
			'contact_fax'=>$this->input->post('contact_fax'),
			'contact_cellphone'=>$this->input->post('contact_cellphone'),
			'meta_title'=>$this->input->post('meta_title'),
			'meta_keywords'=>$this->input->post('meta_keywords'),
			'meta_desc'=>$this->input->post('meta_desc'),
			'favicon'=>$this->input->post('favicon')
				);
				if($this->website_model->update_data($id,$data)) {				
			redirect('website','refresh');
                                }
                                redirect('website/website_edit/'.$id.'/x1','refresh');
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function website_delete($id)
    {
        $mod=$this->permission_model->get_data_module('website');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_delete=='true') {
                /* PUT YOUR OWN PROCESS HERE */
				if($this->website_model->hapus($id)) {
				redirect('website', 'refresh');
                                }
                                else {
                                    redirect('website/index/x1','refresh');
                                }
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file website.php */
/* Location: ./application/controllers/website.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-29 20:49:05 */

?>