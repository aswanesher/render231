<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Label_produk extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('label_produk_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="",$a="")
    {
        $mod=$this->permission_model->get_data_module('label_produk');
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

                $data['jumlah']= $this->label_produk_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/label_produk/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['label_produk']=$this->label_produk_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']= $this->lang->line('labelproduk');
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/label_produk_modul/label_produk_data';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function label_produk_add($p="")
    {
        $mod=$this->permission_model->get_data_module('label_produk');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']=$this->lang->line('labelproduk_tambah');
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/label_produk_modul/label_produk_add';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function label_produk_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */

            $data_ = array(
                'id_label' =>'',
                'nama_label'=> $this->input->post('nama_label'),
                'created' => date("Y-m-d h:i:s")
            );
            if($this->label_produk_model->save_data($data_)) {
                redirect('label_produk','refresh');
            }
            else {/*
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']=$this->lang->line('labelproduk_tambah');
                $data['pesan'] = $this->lang->line('pesan_error_input');
                $view = 'templates/backend/label_produk_modul/label_produk_add';
                show($view, $data);*/
                 redirect('label_produk/label_produk_add/x1','refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function label_produk_edit($id,$p="")
    {
        $mod=$this->permission_model->get_data_module('label_produk');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_edit=='true') {
                $datas=$this->opsi_website->getdata();

                $dt=$this->label_produk_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['id'] = $id;
                $data['nama_label']=$dt->nama_label;

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']=$this->lang->line('labelproduk_rubah');
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
                $view = 'templates/backend/label_produk_modul/label_produk_edit';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function label_produk_update()
    {
        if($this->session->userdata('logged_in')) {
            $id = $this->input->post('id_label');
            $nama = $this->input->post('nama_label');
            $data_ = array(
              'nama_label'=>$nama  
            );
            if($this->label_produk_model->update_data($id,$data_)) {
                redirect('label_produk','refresh');
            }
            else {/*
                $datas=$this->opsi_website->getdata();
                $data['id'] = $id;
                $data['nama_label']=$nama;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']=$this->lang->line('labelproduk_rubah');
                $data['pesan'] = $this->lang->line('pesan_error_input');
                $view = 'templates/backend/label_produk_modul/label_produk_edit';
                show($view, $data); */
                  redirect('label_produk/label_produk_edit/'.$id.'/x1','refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function label_produk_delete($id)
    {
        $mod=$this->permission_model->get_data_module('label_produk');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_delete=='true') {
                /* PUT YOUR OWN PROCESS HERE */
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file label_produk.php */
/* Location: ./application/controllers/label_produk.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-24 05:17:00 */

?>