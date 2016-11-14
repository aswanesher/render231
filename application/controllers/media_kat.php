<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Media_kat extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('media_kat_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media_kat');
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

                $data['jumlah']= $this->media_kat_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/media_kat/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['media_kat']=$this->media_kat_model->get_dataall($param,$config['per_page'],$dari);

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
                    $data['pesan'] = 'Kategeri Masih Digunakan di Media';
                }
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Pengaturan Kategori Media';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/media_kat_modul/media_kat_data';
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

    public function media_kat_add()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media_kat');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah Kategori Media';

                $view = 'templates/backend/media_kat_modul/media_kat_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media_kat', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media_kat', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_kat_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
                $kategori = $this->input->post('category');
                $va = $this->session->userdata('logged_in');
                $author = $va['id'];
                $created = date("y-m-d/h:i:s");
                $updated = date("y-m-d/h:i:s");
                $data = array (
                    'id_media_cat'=>'',
                    'category'=>$kategori,
                    'id_user'=>$author,
                    'created_at'=>$created,
                    'updated_at'=>$updated
                );
                if($this->media_kat_model->save_data($data)) {
                    $this->session->set_flashdata('success', 'Data disimpan!');
                    redirect('media_kat', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal disimpan!');
                    redirect('media_kat', 'refresh');
                }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_kat_edit($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media_kat');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->media_kat_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['data']=$dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah media_kat';

                $view = 'templates/backend/media_kat_modul/media_kat_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media_kat', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media_kat', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_kat_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id=$this->input->post('id_media_cat');
            $kat = $this->input->post('category');
                $va = $this->session->userdata('logged_in');
                $author = $va['id'];
                $updated = date("y-m-d/h:i:s");
                $data = array(
                    'category'=>$kat,
                    'id_user'=>$author,
                    'updated_at'=>$updated
                );
                if($this->media_kat_model->update_data($id,$data)) {
                    $this->session->set_flashdata('success', 'Data diubah!');
                    redirect('media_kat', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal diubah!');
                    redirect('media_kat', 'refresh');
                }
                        
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_kat_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media_kat');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                if($this->media_kat_model->hapus($id)){
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('media_kat', 'refresh');
                }
                else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('media_kat', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media_kat', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media_kat', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file media_kat.php */
/* Location: ./application/controllers/media_kat.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-05-13 15:17:08 */

?>