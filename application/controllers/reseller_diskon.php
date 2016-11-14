<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Reseller_diskon extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('diskon_reseller_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('label_produk_model');
        $this->load->model('reseller_type');
    }

    public function index($p="",$a="")
    {
        $mod=$this->permission_model->get_data_module('reseller_diskon');
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

                $data['jumlah']= $this->diskon_reseller_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/reseller_diskon/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['reseller_diskon']=$this->diskon_reseller_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan Diskon';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/reseller_diskon_modul/reseller_diskon_data';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_diskon_add($p="")
    {
        $mod=$this->permission_model->get_data_module('reseller_diskon');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();
                $data['data_label'] = $this->label_produk_model->get_data();
                $data['data_type_reseller'] = $this->reseller_type->get_data();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah Diskon';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/reseller_diskon_modul/reseller_diskon_add';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_diskon_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
             $data_ = array(
                 'id_label'=>  $this->input->post('id_label'),
                 'diskon'=>  $this->input->post('diskon'),
                 'type_reseller'=>  $this->input->post('id_type_reseller'),
                 'id_diskon'=>'',
                 'min_beli' =>  $this->input->post('min_beli'),
                 'max_beli'=> $this->input->post('max_beli')
             );
             if(!$this->diskon_reseller_model->cekminmax($this->input->post('min_beli') , $this->input->post('max_beli'))) {
                $this->diskon_reseller_model->save_data($data_);
                 redirect('reseller_diskon','refresh');
             }
             else {/*
                $datas=$this->opsi_website->getdata();
                $data['data_label'] = $this->label_produk_model->get_data();
                $data['data_type_reseller'] = $this->reseller_type->get_data();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah reseller diskon';
                $data['pesan'] = 'Gagal Menambah Data';
                $view = 'templates/backend/reseller_diskon_modul/reseller_diskon_add';
                show($view, $data); */
                  redirect('reseller_diskon/reseller_diskon_add/x1','refresh');
             }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_diskon_edit($id,$p="")
    {
        $mod=$this->permission_model->get_data_module('reseller_diskon');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_edit=='true') {
                $datas=$this->opsi_website->getdata();

                $dt=$this->diskon_reseller_model->get_data_edit($id);
                
                /* DEFINE YOUR OWN DATA HERE */
                $data['data_diskon'] = $dt;
                $data['data_label'] = $this->label_produk_model->get_data();
                $data['data_type_reseller'] = $this->reseller_type->get_data();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah Diskon';
                if($p==="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
                $view = 'templates/backend/reseller_diskon_modul/reseller_diskon_edit';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_diskon_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post('id_diskon');
            $data_ = array(
                'id_label' => $this->input->post('id_label'),
                'diskon' => $this->input->post('diskon'),
                'type_reseller'=>$this->input->post('type_reseller'),
                'min_beli'=>$this->input->post('min_beli'),
                'max_beli'=>$this->input->post('max_beli')
            );
            if($cek = $this->diskon_reseller_model->cekminmax($this->input->post('min_beli') , $this->input->post('max_beli'))) {
                if($cek->id_diskon == $id) {
                    if($this->diskon_reseller_model->update_data($id,$data_)) {
                        redirect('reseller_diskon','refresh');
                    }
                    else {
                        redirect('reseller_diskon/reseller_diskon_edit/'.$id.'/x1','refresh');
                    }
                }
                else {
                    redirect('reseller_diskon/reseller_diskon_edit/'.$id.'/x1','refresh');
                }
            }
            else {
                                    if($this->diskon_reseller_model->update_data($id,$data_)) {
                        redirect('reseller_diskon','refresh');
                    }
                    else {
                        redirect('reseller_diskon/reseller_diskon_edit/'.$id.'/x1','refresh');
                    }
                /*
             $datas=$this->opsi_website->getdata();
                $data['data_diskon'] = array(
                    $data_,
                'id_diskon'=>$id
                );
                $data['data_label'] = $this->label_produk_model->get_data();
                $data['data_type_reseller'] = $this->reseller_type->get_data();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah reseller diskon';
                $data['pesan'] = 'Gagal Menyimpan Data';
                $view = 'templates/backend/reseller_diskon_modul/reseller_diskon_edit';
                show($view, $data);*/
                 //redirect('reseller_diskon/reseller_diskon_edit/'.$id.'/x1','refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reseller_diskon_delete($id)
    {
        $mod=$this->permission_model->get_data_module('reseller_diskon');
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

/* End of file reseller_diskon.php */
/* Location: ./application/controllers/reseller_diskon.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-24 14:13:13 */

?>