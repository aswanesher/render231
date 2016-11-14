<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Produkkategori extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('produkkategori_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('produkkategori');
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

                $data['jumlah']= $this->produkkategori_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/produkkategori/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['produkkategori']=$this->produkkategori_model->get_dataall($param,$config['per_page'],$dari);

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
                    $data['pesan'] = 'Kategori Masih Digunakan diProduk';
                }
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Pengaturan produk kategori';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/produkkategori_modul/produkkategori_data';
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

    public function produkkategori_add($p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('produkkategori');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();
                $data['parent'] = $this->produkkategori_model->get_parent();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah produk kategori';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/produkkategori_modul/produkkategori_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('produkkategori', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('produkkategori', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function produkkategori_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $kateg = $this->input->post("category");
            $parent_id = $this->input->post("parent_id");
            $is_parent = $this->input->post("is_parent");
            $created = date("y-m-d/h:i:s");
            $updated = date("y-m-d/h:i:s");
            $va = $this->session->userdata('logged_in');
            $admin = $va['id'];
           // $plink = strtolower($kateg);
           // $seo = str_replace(" ", "-", $plink);
            $seo = $this->opsi_website->removeSpesial($kateg);
            if($this->produkkategori_model->get_seo($seo)) {
                $seo = $seo."-".$this->produkkategori_model->jumlah();
            }
            $data = array(
              'id_prod_category' =>'',
                'category'=>$kateg,
                'seo_url'=>$seo,
                'user_id'=>$admin,
                'parent_id'=>$parent_id,
                'is_parent'=>$is_parent,
                'created_at'=>$created,
                'updated_at'=>$updated
            );
            if($this->produkkategori_model->save_data($data)) {
                $this->session->set_flashdata('success', 'Data disimpan!');
                redirect('produkkategori', 'refresh');
            }
            else {
                $this->session->set_flashdata('error', 'Data gagal disimpan!');
                redirect('produkkategori', 'refresh');
            }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function produkkategori_edit($id,$p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('produkkategori');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->produkkategori_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['parent'] = $this->produkkategori_model->get_parent();
                $data['data'] = $dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah produk kategori';
                $view = 'templates/backend/produkkategori_modul/produkkategori_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('produkkategori', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('produkkategori', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function produkkategori_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post("id_prod_category");
            $kateg = $this->input->post("category");
            $parent_id = $this->input->post("parent_id");
            $is_parent = $this->input->post("is_parent");
            $updated = date("y-m-d/h:i:s");
          //  $plink = strtolower($kateg);
           // $seo = str_replace(" ", "-", $plink);
            $seo = $this->opsi_website->removeSpesial($kateg);
            if($this->produkkategori_model->get_seo($seo)) {
                $seo = $seo."-".$this->produkkategori_model->jumlah();
            }
            $data = array (
              'category'=>$kateg,
                'seo_url'=>str_replace(" ", "-", $seo),
                'parent_id'=>$parent_id,
                'is_parent'=>$is_parent,
                'updated_at'=>$updated
            );
            if($this->produkkategori_model->update_data($id,$data)) {
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('produkkategori', 'refresh'); 
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('produkkategori', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function produkkategori_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('produkkategori');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                if($this->produkkategori_model->cekdata_produk($id)) {
                    redirect('produkkategori/index/x1','refresh');
                } else {
                    if($this->produkkategori_model->hapus($id)) {
                        $this->session->set_flashdata('success', 'Data dihapus!');
                        redirect('produkkategori', 'refresh');
                    } else {
                        $this->session->set_flashdata('error', 'Data gagal dihapus!');
                        redirect('produkkategori', 'refresh');
                    }
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('produkkategori', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('produkkategori', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file produkkategori.php */
/* Location: ./application/controllers/produkkategori.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-05-19 11:21:34 */

?>