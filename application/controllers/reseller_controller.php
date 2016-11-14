<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Reseller_controller extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('reseller_type');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="",$a="")
    {
        $mod=$this->permission_model->get_data_module('reseller_controller');
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

                $data['jumlah']= $this->reseller_type->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/reseller_controller/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['reseller_controller']=$this->reseller_type->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan reseller';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/reseller_controller_modul/reseller_controller_data';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_controller_add($p="")
    {
        $mod=$this->permission_model->get_data_module('reseller_controller');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah reseller ';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/reseller_controller_modul/reseller_controller_add';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_controller_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            
            $data_ = array(
                'id_typereseller'=>'',
                'nama_type'=>$this->input->post('nama_type')
            );

               // show($view, $data);
                if($this->reseller_type->save_data($data_)) {
                    redirect('reseller_controller');
                }
                else {/*
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah reseller ';

                $view = 'templates/backend/reseller_controller_modul/reseller_controller_add';
                    $data['pesan'] = "Gagal Simpan Data";
                    show($view, $data);*/
                     redirect('reseller_controller/reseller_controller_add/x1','refresh');
                }
                
            //redirect('reseller_controller');
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_controller_edit($id,$p="")
    {
        $mod=$this->permission_model->get_data_module('reseller_controller');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_edit=='true') {
                $datas=$this->opsi_website->getdata();

                $dt=$this->reseller_type->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['id'] = $id;
                $data['nama_type']=$dt->nama_type;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah reseller';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
                $view = 'templates/backend/reseller_controller_modul/reseller_controller_edit';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_controller_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post('id_typereseller');
            $nama = $this->input->post('nama_type');
            
            $data_ = array(
              'nama_type' => $nama  
            );
            
            //$this->load->model('reseller_type');
            if($this->reseller_type->update_data($id,$data_)) {
                redirect('reseller_controller');
            }
            else { /*
                $datas=$this->opsi_website->getdata();
                $data['id'] = $id;
                $data['nama_type']=$nama;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah reseller';
                $data['pesan'] = "Gagal Edit Data";

                $view = 'templates/backend/reseller_controller_modul/reseller_controller_edit';
                show($view, $data);*/
                 redirect('reseller_controller/reseller_controller_edit/'.$id.'/x1','refresh');
            }
            
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_controller_delete($id)
    {
        $mod=$this->permission_model->get_data_module('reseller_controller');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_delete=='true') {
                /* PUT YOUR OWN PROCESS HERE */
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file reseller_controller.php */
/* Location: ./application/controllers/reseller_controller.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-23 09:54:00 */

?>