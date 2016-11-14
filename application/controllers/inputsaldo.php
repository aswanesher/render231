<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Inputsaldo extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('inputsaldo_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('users_model');
        $this->load->model('updatesaldo_model');
    }

    public function index($p="",$a="")
    {
        $mod=$this->permission_model->get_data_module('inputsaldo');
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

                $data['jumlah']= $this->inputsaldo_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/inputsaldo/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['inputsaldo']=$this->inputsaldo_model->get_dataall($param,$config['per_page'],$dari);

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
                    $data['pesan'] = "Gagal Hapus Data";
                }
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Pengaturan input saldo';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/inputsaldo_modul/inputsaldo_data';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function inputsaldo_add($p="")
    {
        $mod=$this->permission_model->get_data_module('inputsaldo');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();
                
                $data['data_reseller'] = $this->users_model->get_user_sales("Reseller");
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']=  $this->lang->line('inputsaldo_tambah');
                if($p=="x1") {
                    $data['pesan'] = "Gagal Tambah Data";
                }
                $view = 'templates/backend/inputsaldo_modul/inputsaldo_add';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function inputsaldo_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $va = $this->session->userdata('logged_in');
            $id = $this->input->post('id_reseller');
            $nominal = $this->input->post('nominal');
            $data_ = array (
                'no_tf' => $this->input->post('no_tf'),
                'tgl_tf' =>$this->input->post('tgl_tf'),
                'nominal' => $nominal, 
                'id_reseller' => $id,
                'id_admin' => $va['id']
            );
            if($this->inputsaldo_model->save_data($data_)) {
                if($this->updatesaldo_model->get_data_detail($id)){
                    $isi = $this->updatesaldo_model->get_data_edit($id);
                    $saldo = array( 
                        'saldo'=>$isi->saldo + $nominal,
                        'updated'=> date("y-m-d h:i:s")
                            );
                    $this->updatesaldo_model->update_data($id,$saldo);
                }
                else {
                    $data_saldo = array(
                      'id_reseller' => $id,
                        'saldo' => $nominal,
                        'updated'=> date("y-m-d h:i:s")
                    );
                    $this->updatesaldo_model->save_data($data_saldo);
                }
                redirect('inputsaldo','refresh');
            }
            else {/*
                $datas=$this->opsi_website->getdata();
                $data['data_reseller'] = $this->users_model->get_user_sales("Reseller");
                $data['judul']=$datas->website_title;
                $data['judul_panel']=  $this->lang->line('inputsaldo_tambah');
                $data['pesan'] = $this->lang->line('pesan_error_input');
                $view = 'templates/backend/inputsaldo_modul/inputsaldo_add';
                show($view, $data); */
                  redirect('inputsaldo/inputsaldo_add/x1','refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function inputsaldo_edit($id,$p="")
    {
        $mod=$this->permission_model->get_data_module('inputsaldo');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_edit=='true') {
                $datas=$this->opsi_website->getdata();

                $dt=$this->inputsaldo_model->get_data_edit($id);
                
                /* DEFINE YOUR OWN DATA HERE */
                $data['isi'] = $dt;
                $data['data_reseller'] = $this->users_model->get_user_sales("Reseller");
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']=  $this->lang->line('inputsaldo_rubah');
                if($p=="x1") {
                    $data['pesan'] = "Gagal Edit Data";
                }
                $view = 'templates/backend/inputsaldo_modul/inputsaldo_edit';
                show($view, $data);
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function inputsaldo_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $no_tf = $this->input->post('no_tf');
            $data_ = array(
                'no_tf'=>$no_tf,
                'tgl_tf'=>  $this->input->post('tgl_tf'),
                'nominal'=>  $this->input->post('nominal'),
                'id_reseller' => $this->input->post('id_reseller')
            ); /*
            if($this->inputsaldo_model->update_data($no_tf,$data_)) {
                redirect('inputsaldo');
            }
            else {
                $datas=$this->opsi_website->getdata();
                $data['isi'] = $data_;
                $data['data_reseller'] = $this->users_model->get_user_sales("Reseller");
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah input saldo';
                $data['pesan']='Gagal Menyimpan Data';
                $view = 'templates/backend/inputsaldo_modul/inputsaldo_edit';
                show($view, $data);  
            } */
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function inputsaldo_delete($id)
    {
        $mod=$this->permission_model->get_data_module('inputsaldo');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_delete=='true') {
            //    $this->inputsaldo_model->hapus($id);
                redirect('inputsaldo');
            } else {
                echo "<script>alert('".$this->lang->line('alert_akses')."')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
    
    public function cari() {
        
    }
    
    
        
    


}

/* End of file inputsaldo.php */
/* Location: ./application/controllers/inputsaldo.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-25 20:09:26 */

?>