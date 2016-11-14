<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Permission extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('permission_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('modul_model');
        $this->load->model('user_grup_model');
    }

    public function index()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('permission');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_view)&&($per->is_view=='true')) {
                /* this is for searching */
                $modul=$this->input->post('modul');
                $grup=$this->input->post('grup');

                $param = array(
                    'modul' => $modul,
                    'grup' => $grup
                );

                $data['modulnya'] = $modul;
                $data['grupnya'] = $grup;

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->permission_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/permission/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['permission']=$this->permission_model->get_dataall($param,$config['per_page'],$dari);
                $data['modul']=$this->modul_model->get_data();
                $data['grup']=$this->user_grup_model->get_data();

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
                $data['judul_panel']='Pengaturan permission';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/permission_modul/permission_data';
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

    public function permission_add()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('permission');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah permission';
                $data['modul']=$this->modul_model->get_data();
                $data['grup']=$this->user_grup_model->get_data();

                $view = 'templates/backend/permission_modul/permission_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('permission', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('permission', 'refresh');
            }    
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function permission_save()
    {
        if($this->session->userdata('logged_in')) {
            $datas=$this->opsi_website->getdata();
            /* PUT YOUR OWN PROCESS HERE */
            $idmodule = $this->input->post('id_module');
            $idusergrup = $this->input->post('id_user_group');
            $isview = $this->input->post('is_view');
            $isadd = $this->input->post('is_add');
            $isedit = $this->input->post('is_edit');
            $isdelete = $this->input->post('is_delete');

            $cek=$this->permission_model->get_data_cek($idmodule,$idusergrup);

            $data['judul']=$datas->website_title;
            $data['company']=$datas->company_name;
            $data['judul_panel']='Tambah permission';
            $data['modul']=$this->modul_model->get_data();
            $data['grup']=$this->user_grup_model->get_data();

            if(!empty($cek->id)) {
                $data['error_message']="Sudah ada data yang sama";
                $view = 'templates/backend/permission_modul/permission_add';
                show($view, $data);
            } else {
                $val = array(
                        'id_module' => $idmodule,
                        'id_user_group' => $idusergrup,
                        'is_view' => $isview,
                        'is_add' => $isadd,
                        'is_edit' => $isedit,
                        'is_delete' => $isdelete
                    );
                if($this->permission_model->save_data($val)) {
                    $this->session->set_flashdata('success', 'Data ditambahkan!');
                    redirect('permission', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal ditambahkan!');
                    redirect('permission', 'refresh');
                }
                /*$data['success_message']="Data berhasil ditambahkan";
                $view = 'templates/backend/permission_modul/permission_add';
                show($view, $data);*/
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function permission_edit($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('permission');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->permission_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah permission';
                $data['modul']=$this->modul_model->get_data();
                $data['grup']=$this->user_grup_model->get_data();
                $dt=$this->permission_model->get_data_edit($id);

                $data['id'] = $dt->id;
                $data['module_id'] = $dt->id_module;
                $data['user_grup'] = $dt->id_user_group;
                $data['isview'] = $dt->is_view;
                $data['isadd'] = $dt->is_add;
                $data['isedit'] = $dt->is_edit;
                $data['isdelete'] = $dt->is_delete;

                $view = 'templates/backend/permission_modul/permission_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('permission', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('permission', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function permission_update()
    {
        if($this->session->userdata('logged_in')) {

            $id = $this->input->post('id');
            $idmodule = $this->input->post('id_module');
            $idusergrup = $this->input->post('id_user_group');
            $isview = $this->input->post('is_view');
            $isadd = $this->input->post('is_add');
            $isedit = $this->input->post('is_edit');
            $isdelete = $this->input->post('is_delete');

            $datas=$this->opsi_website->getdata();
            $dt=$this->permission_model->get_data_edit($id);

            /* PUT YOUR OWN PROCESS HERE */

            $data['judul']=$datas->website_title;
            $data['company']=$datas->company_name;
            $data['judul_panel']='Ubah permission';
            $data['modul']=$this->modul_model->get_data();
            $data['grup']=$this->user_grup_model->get_data();

            $data['id'] = $dt->id;
            $data['module_id'] = $dt->id_module;
            $data['user_grup'] = $dt->id_user_group;
            $data['isview'] = $dt->is_view;
            $data['isadd'] = $dt->is_add;
            $data['isedit'] = $dt->is_edit;
            $data['isdelete'] = $dt->is_delete;

            $val = array(
                    'id_module' => $idmodule,
                    'id_user_group' => $idusergrup,
                    'is_view' => $isview,
                    'is_add' => $isadd,
                    'is_edit' => $isedit,
                    'is_delete' => $isdelete
                );
            $ec=$this->permission_model->update_data($id,$val);
            if($ec=='1') {
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('permission', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('permission', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function permission_delete($id)
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $usr=$this->session->userdata('logged_in');
            $mod=$this->permission_model->get_data_module('permission');
            $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                if($this->permission_model->hapus($id)) {
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('permission', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('permission', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('permission', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('permission', 'refresh');
            }

        } else {
            redirect('login', 'refresh');
        }
    }


}

/* End of file permission.php */
/* Location: ./application/controllers/permission.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-22 14:09:22 */

?>