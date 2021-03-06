<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Bahan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('bahan_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('bahan');
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

                $data['jumlah']= $this->bahan_model->jumlah();

                // Config page
                $config['base_url'] = base_url().'/bahan/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['bahan']=$this->bahan_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan bahan';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/bahan_modul/bahan_data';
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

    public function bahan_add()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('bahan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah bahan';

                $view = 'templates/backend/bahan_modul/bahan_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('bahan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('bahan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function bahan_save()
    {
        if($this->session->userdata('logged_in')) {
            //* PUT YOUR OWN PROCESS HERE */
            $jenis_bahan = $this->input->post("jenis_bahan");
            $harga = $this->input->post("harga");
            $qty = $this->input->post("qty");

            $data = array(
                'jenis_bahan' => $jenis_bahan,
                'harga' => $harga,
                'qty' => $qty
            );

            if($this->bahan_model->save_data($data)) {
                $this->session->set_flashdata('success', 'Data ditambah!');
                redirect('bahan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal ditambah!');
                redirect('bahan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function bahan_edit($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('bahan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->bahan_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['id_bahan'] = $dt->id_bahan;
                $data['jenis_bahan'] = $dt->jenis_bahan;
                $data['harga'] = $dt->harga;
                $data['qty'] = $dt->qty;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah bahan';

                $view = 'templates/backend/bahan_modul/bahan_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('bahan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('bahan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function bahan_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id_bahan = $this->input->post("id_bahan");
            $jenis_bahan = $this->input->post("jenis_bahan");
            $harga = $this->input->post("harga");
            $qty = $this->input->post("qty");

            $data = array(
                'jenis_bahan' => $jenis_bahan,
                'harga' => $harga,
                'qty' => $qty
            );
            if($this->bahan_model->update_data($id_bahan, $data)) {
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('bahan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('bahan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function bahan_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('bahan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                if($this->bahan_model->hapus($id)) {
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('bahan', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('bahan', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('bahan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('bahan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file bahan.php */
/* Location: ./application/controllers/bahan.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-11-13 12:28:21 */

?>