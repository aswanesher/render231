<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Merk_dagang extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('merk_dagang_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('merk_dagang');
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

                $data['jumlah']= $this->merk_dagang_model->jumlah();

                // Config page
                $config['base_url'] = base_url().'/merk_dagang/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['merk_dagang']=$this->merk_dagang_model->get_dataall($param,$config['per_page'],$dari);

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

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Merk Dagang';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/merk_dagang_modul/merk_dagang_data';
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

    public function merk_dagang_add()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('merk_dagang');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah Merk';

                $view = 'templates/backend/merk_dagang_modul/merk_dagang_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('merk_dagang', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('merk_dagang', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function merk_dagang_save()
    {
        $usr=$this->session->userdata('logged_in');
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $dateTime = date('Y-m-d');
            $data=array(          
                'merk'=>$this->input->post('merk'),
                'created_by'=>$usr['id'],
                'created_at'=>$dateTime
            );
            $result=$this->merk_dagang_model->save_data($data);
            if($result!=FALSE) {            
                $this->session->set_flashdata('success', 'Data berhasil ditambah!');
                redirect('merk_dagang', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal ditambah!');
                redirect('merk_dagang', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function merk_dagang_edit($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('merk_dagang');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->merk_dagang_model->get_data_edit($id);
                $data['id'] = $dt->id_merk;
                $data['merk'] = $dt->merk;

                /* DEFINE YOUR OWN DATA HERE */

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah Merk Dagang';

                $view = 'templates/backend/merk_dagang_modul/merk_dagang_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('merk_dagang', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('merk_dagang', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function merk_dagang_update()
    {
        $usr=$this->session->userdata('logged_in');
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $dateTime = date('Y-m-d');
            $id=$this->input->post('id_merk');
            $data=array(          
                'merk'=>$this->input->post('merk'),
                'modified_at'=>$dateTime
            );
            $result=$this->merk_dagang_model->update_data($id,$data);
            if($result!=FALSE) {            
                $this->session->set_flashdata('success', 'Data berhasil diubah!');
                redirect('merk_dagang', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('merk_dagang', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function merk_dagang_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('merk_dagang');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                $result=$this->merk_dagang_model->hapus($id);
                if($result!=FALSE) {            
                    $this->session->set_flashdata('success', 'Data berhasil dihapus!');
                    redirect('merk_dagang', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('merk_dagang', 'refresh');
                } 
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('merk_dagang', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('merk_dagang', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file merk_dagang.php */
/* Location: ./application/controllers/merk_dagang.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-07-29 14:20:59 */

?>