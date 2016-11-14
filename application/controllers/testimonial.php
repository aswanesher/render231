<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Testimonial extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('testimonial_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('testimonial');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_view)&&($per->is_view=='true')) {
                /* this is for searching */
                $query1=$this->input->post('query1');

                $param = array(
                    'query1' => $query1
                );

                $data['query1'] = $query1;

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->testimonial_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/testimonial/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['testimonial']=$this->testimonial_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan testimonial';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/testimonial_modul/testimonial_data';
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

    public function testimonial_add($p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('testimonial');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                session_start();
    	        $_SESSION['ses_kcfinder']=array();
    	        $_SESSION['ses_kcfinder']['disabled'] = false;
                $datas=$this->opsi_website->getdata();
                
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah testimonial';
                    if($p=="x1") {
                        $data['pesan'] = 'Gagal Menambah Data';
                    }
                $view = 'templates/backend/testimonial_modul/testimonial_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('testimonial', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('testimonial', 'refresh');
            }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function testimonial_save()
    {
        if($this->session->userdata('logged_in')) {			
			$dateTime = date('Y-m-d');
			 $data=array(		   
        			'name'=>$this->input->post('name'),
        			'judul_id'=>$this->input->post('judul_id'),
        			'testimonial'=>$this->input->post('testimonial'),
                    'email'=>$this->input->post('email'),
                    'kota'=>$this->input->post('kota'),
        			'tanggal'=>$dateTime,
        			'url'=>$this->input->post('url'),
                     'gambar'=>  $this->input->post('gambar'),
                     'approval'=> $this->input->post('showing')
				);
				if($this->testimonial_model->save_data($data)) {			
                    $this->session->set_flashdata('success', 'Data disimpan!');
                    redirect('testimonial', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal disimpan!');
                    redirect('testimonial', 'refresh');
                }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function testimonial_edit($id,$p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('testimonial');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                session_start();
    	        $_SESSION['ses_kcfinder']=array();
    	        $_SESSION['ses_kcfinder']['disabled'] = false;
    			$dateTime = date('Y-m-d');
                $datas=$this->opsi_website->getdata();
                $dt=$this->testimonial_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */	
    			$data['id'] = $id;
    			$data['name'] = $dt->name;
    			$data['judul_id'] = $dt->judul_id;
    			$data['testimonial'] = $dt->testimonial;
    			$data['url'] = $dt->url;
                $data['gambar'] = $dt->gambar;
                $data['email'] = $dt->email;
                $data['kota'] = $dt->kota;
                $data['show'] = $dt->approval;
    			
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah testimonial';
                    if($p=="x1") {
                        $data['pesan'] = 'Gagal Merubah Data';
                    }
                $view = 'templates/backend/testimonial_modul/testimonial_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('testimonial', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('testimonial', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function testimonial_update()
    {
        if($this->session->userdata('logged_in')) {	
			$dateTime = date('Y-m-d');		
			$id =$this->input->post('id');	
			 $data=array(		
				'name'=>$this->input->post('name'),
				'judul_id'=>$this->input->post('judul_id'),
				'testimonial'=>$this->input->post('testimonial'),
                'email'=>$this->input->post('email'),
                'kota'=>$this->input->post('kota'),
				'tanggal'=>$dateTime,
				'url'=>$this->input->post('url'),
                                'gambar'=>  $this->input->post('gambar'),
                                'approval'=>  $this->input->post('showing')
				);
				if($this->testimonial_model->update_data($id,$data)) {				
                    $this->session->set_flashdata('success', 'Data diubah!');
                    redirect('testimonial', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal diubah!');
                    redirect('testimonial', 'refresh');
                }
            /* PUT YOUR OWN PROCESS HERE */
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function testimonial_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('post');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
    			if($this->testimonial_model->hapus($id)) {
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('testimonial', 'refresh'); 
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('testimonial', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('testimonial', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('testimonial', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file testimonial.php */
/* Location: ./application/controllers/testimonial.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-23 02:25:52 */

?>