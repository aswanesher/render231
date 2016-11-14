<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Post_category extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('post_category_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('post_category');
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

                $data['jumlah']= $this->post_category_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/post_category/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['post_category']=$this->post_category_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan Kategori Post';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/post_category_modul/post_category_data';
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

    public function post_category_add($p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('post_category');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah Kategori Post';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/post_category_modul/post_category_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('post_category', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('post_category', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function post_category_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $user_data = $this->session->userdata('logged_in');
            $sess=$user_data['id'];
            $kategori = $this->input->post('category');
            $plink = strtolower($kategori);
            $seo = str_replace(" ", "-", $plink);
            if($this->post_category_model->get_seo($seo)) {
                $seo = $seo."-".$this->post_category_model->jumlah();
            }
            $data = array(
                'post_parent' =>'',
                'category'=> $kategori,
                'creator' => $sess,
                'created_at' => date("Y-m-d h:i:s"),
                'seo_url'=>$seo
            );
            if($this->post_category_model->save_data($data)) {
                $this->session->set_flashdata('success', 'Data ditambah!');
                redirect('post_category', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal ditambah!');
                redirect('post_category', 'refresh');
            }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function post_category_edit($id,$p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('post_category');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->post_category_model->get_data_edit($id);
                /* DEFINE YOUR OWN DATA HERE */
                $data['id'] = $dt->post_parent;
                $data['category']=$dt->category;

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah Kategori Post';
                $view = 'templates/backend/post_category_modul/post_category_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('post_category', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('post_category', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function post_category_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $user_data = $this->session->userdata('logged_in');
            $sess=$user_data['id'];

            $id = $this->input->post('post_parent');
            $kategori = $this->input->post('category');
            $plink = strtolower($kategori);
            $seo = str_replace(" ", "-", $plink);
            if($this->post_category_model->get_seo($seo)) {
                $seo = $seo."-".$this->post_category_model->jumlah();
            }            
            $data = array(
                'category'=> $kategori,
                'creator' => $sess,
                'updated_at' => date("Y-m-d h:i:s"),
                'seo_url'=>$seo
            );
            if($this->post_category_model->update_data($id, $data)) {
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('post_category', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('post_category', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function post_category_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('post_category');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                if($this->post_category_model->hapus($id)) {
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('post_category', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('post_category', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('post_category', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('post_category', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file post_category.php */
/* Location: ./application/controllers/post_category.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-04-12 10:32:57 */

?>