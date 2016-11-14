<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Salestarget extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('salestarget_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('reportsales_model');
        $this->load->model('users_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('salestarget');
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

                $data['jumlah']= $this->salestarget_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/salestarget/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['salestarget']=$this->salestarget_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan salestarget';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/salestarget_modul/salestarget_data';
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

    public function salestarget_add($p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('salestarget');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah salestarget';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/salestarget_modul/salestarget_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('salestarget', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('salestarget', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function salestarget_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $va = $this->session->userdata('logged_in');
            $data_ = array(
                'id_target'=>'',
                'qty_target'=>$this->input->post('qty_target'),
                'month_target'=>  $this->input->post('month_target'),
                'created'=>date("Y-m-d h:i:s"),
                'id_admin'=>  $va['id']
            );
            if($this->salestarget_model->save_data($data_)) {
                $this->session->set_flashdata('success', 'Data disimpan!');
                redirect('salestarget', 'refresh');
            } else {/*
                $datas=$this->opsi_website->getdata();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah salestarget';
                $data['pesan'] = "Gagal Menyimpan DATA";
                $view = 'templates/backend/salestarget_modul/salestarget_add';
                show($view, $data); */
                $this->session->set_flashdata('error', 'Data gagal disimpan!');
                redirect('salestarget', 'refresh');
                //redirect('salestarget/salestarget_add/x1','refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function salestarget_edit($id,$p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('salestarget');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->salestarget_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['isi'] = $dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah sales target';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
                $view = 'templates/backend/salestarget_modul/salestarget_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('salestarget', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('salestarget', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function salestarget_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post('id_target');
            $data_ = array(
                'id_target' => $id,
                'qty_target' => $this->input->post('qty_target'),
                'month_target' => $this->input->post('month_target')
            );
            if($this->salestarget_model->update_data($id,$data_)) {
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('salestarget', 'refresh');
            } else {/*
                $datas=$this->opsi_website->getdata();
                $data['isi'] = $data_;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah sales target';
                $data['pesan'] = "Gagal Menyimpan DATA";

                $view = 'templates/backend/salestarget_modul/salestarget_edit';
                show($view, $data); */
                $this->session->set_flashdata('error', 'Data diubah!');
                redirect('salestarget', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function salestarget_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('salestarget');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                if($this->reportsales_model->getIdTarget($id)) {
                    // echo "<script>alert('Id Target Masih DI Gunakan')</script>";
                    redirect('salestarget/index/x1','refresh');
                } else {
                    if($this->salestarget_model->hapus($id)) {
                        $this->session->set_flashdata('success', 'Data dihapus!');
                        redirect('salestarget', 'refresh');
                    } else {
                        $this->session->set_flashdata('error', 'Data gagal dihapus!');
                        redirect('salestarget', 'refresh');
                    }
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('salestarget', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('salestarget', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
    
    public function detail($id) {
        $mod=$this->permission_model->get_data_module('salestarget');
        $per=$this->permission_model->get_data_akses($mod->module_id);
        if($this->session->userdata('logged_in')) {
                $datas=$this->opsi_website->getdata();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Detail sales target';
                $data['nama_target'] = $this->salestarget_model->get_data_edit($id);
                $data['sum'] = $this->salestarget_model->sumPenjualan($id);
                $view = 'templates/backend/salestarget_modul/salestarget_grafik';
                $isi = $this->salestarget_model->grafikpertarget($id)->result_array();
                $data['isi'] = $isi;
        		foreach( $isi as $row)
		{
			$data['grafik'][]=(float)$row['jumlah_jual'];
                        $data['sales'][]=$row['user_login'];
		}
                show($view, $data);
                
                }
    }
    
    public function mpenjualan() {
        if($this->session->userdata('logged_in')) {
            $datas=$this->opsi_website->getdata();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['target'] = $this->salestarget_model->get_data();
                $data['sales'] = $this->users_model->get_user_sales('Sales');
                $data['judul_panel']='Manajemen Penjualan';
                $status = $this->input->post('status');
                if($status == 1) {
                    $data['status'] = $status;
                $data['nama_target'] = $this->salestarget_model->get_data_edit($this->input->post('target'));
                $data['sum'] = $this->salestarget_model->sumPenjualan($this->input->post('target'));
                $isi = $this->salestarget_model->grafikpertarget($this->input->post('target'))->result_array();
                $data['isi'] = $isi;
        		foreach($isi as $row)
		{
			$data['grafik'][]=(float)$row['jumlah_jual'];
                        $data['salesa'][]=$row['user_login'];
		}
                }
                if($status == 2) {
                    $data['status'] = $status;
                    $tahun = $this->input->post('target');
                    $data['tahun']=$tahun;
                    $isi = $this->salestarget_model->grafikpertahun($tahun)->result_array();
                    $data['isi'] = $isi;
                    foreach ($isi as $row) {
                        $data['grafik'][]=(float)$row['jj'];
                        $data['month'][]=$row['month_target'];
                    }
                }
                if($status == 3) {
                    $data['status'] = $status;
                    $tahun = $this->input->post('target');
                    $sales = $this->input->post('sales');
                    $data['tahun']=$tahun;
                    $data['sales_'] = $sales;
                    $isi = $this->salestarget_model->grafiksalestahunan($tahun,$sales)->result_array();
                    $data['isi'] = $isi;
                    foreach ($isi as $row) {
                        $data['grafik'][]=(float)$row['jj'];
                        $data['month'][]=$row['month_target'];
                    }
                }/*
                if($status == 4) {
                    $datas['status'] = $status;
                    $dateawal = $this->input->post('dateawal');
                    $dateakhir = $this->input->post('dateakhir');
                    $data['dateawal'] = $dateawal;
                    $data['dateakhir'] = $dateakhir;
                    
                } */
 elseif ($status == null) {
                    $data['status']  = 0;
                }
                $view = 'templates/backend/salestarget_modul/mpenjualan';
                show($view, $data);
        }
    }

    

}

/* End of file salestarget.php */
/* Location: ./application/controllers/salestarget.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-24 17:20:26 */

?>