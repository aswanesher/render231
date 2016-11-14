<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Konfirmasipesanan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('konfirmasipesanan_model');
        $this->load->model('detailpesanan_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index()
    {
        $mod=$this->permission_model->get_data_module('konfirmasipesanan');
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

                $data['jumlah']= $this->konfirmasipesanan_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/konfirmasipesanan/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['konfirmasipesanan']=$this->konfirmasipesanan_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']= $this->lang->line('konfirmasipesanan');
                $data['tambah']= false;//$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=false;//$per->is_delete;

                $view = 'templates/backend/konfirmasipesanan_modul/konfirmasipesanan_data';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function konfirmasipesanan_add()
    {
        $mod=$this->permission_model->get_data_module('konfirmasipesanan');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']= $this->lang->line('konfirmasipesanan_tambah');

                $view = 'templates/backend/konfirmasipesanan_modul/konfirmasipesanan_add';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function konfirmasipesanan_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function konfirmasipesanan_edit($id)
    {
        $mod=$this->permission_model->get_data_module('konfirmasipesanan');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_edit=='true') {
                $datas=$this->opsi_website->getdata();

                $dt=$this->konfirmasipesanan_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['isi'] = $dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']= $this->lang->line('konfirmasipesanan_rubah');

                $view = 'templates/backend/konfirmasipesanan_modul/konfirmasipesanan_edit';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function konfirmasipesanan_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $konfim = $this->input->post('konfirmasi');
            $nof = $this->input->post('no_faktur');
            $va = $this->session->userdata('logged_in');
            if($konfim == '1') {
                $data_ = array(
                    'id_admin' => $va['id']
                );
                $this->konfirmasipesanan_model->update_data($nof, $data_);
            }
            redirect('konfirmasipesanan','refresh');
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function konfirmasipesanan_delete($id)
    {
        $mod=$this->permission_model->get_data_module('konfirmasipesanan');
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

    public function detail($nofaktur)
    {
        $mod=$this->permission_model->get_data_module('konfirmasipesanan');
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

                $data['jumlah']= $this->detailpesanan_model->jumlah($nofaktur);

                // Config page
                $config['base_url'] = base_url().'/konfirmasipesanan/';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 10;

                $dari = $this->uri->segment('3');
                $data['konfirmasipesanan']=$this->konfirmasipesanan_model->getDetail($param,$config['per_page'],$dari,$nofaktur);

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
                $data['judul_panel']=  $this->lang->line('konfirmasipesanan_detail');
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/konfirmasipesanan_modul/detailpesanan_data';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

}

/* End of file konfirmasipesanan.php */
/* Location: ./application/controllers/konfirmasipesanan.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-29 11:24:54 */

?>