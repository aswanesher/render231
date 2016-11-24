<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Pemesanan extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('pemesanan_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('pemesanan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_view)&&($per->is_view=='true')) {
                /* this is for searching */
                $ul=$this->session->userdata('logged_in');
                $data['grup_user']=$ul['group'];
                $query1=$this->input->post('query1');
                $query2=$this->input->post('query2');
                $tgl_pesan=$this->input->post('tgl_pesan');
                $status=$this->input->post('status');

                $param = array(
                    'query1' => $query1,
                    'query2' => $query2,
                    'tgl_pesan' => $tgl_pesan,
                    'status' => $status
                );

                $data['query1'] = $query1;
                $data['query2'] = $query2;
                $data['tgl_pesan'] = $tgl_pesan;
                $data['status'] = $status;

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->pemesanan_model->jumlah();

                // Config page
                $config['base_url'] = base_url().'/pemesanan/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['pemesanan']=$this->pemesanan_model->get_dataalls($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan pemesanan';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/pemesanan_modul/pemesanan_data';
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

    public function pemesanan_add()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('pemesanan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah pemesanan';

                $view = 'templates/backend/pemesanan_modul/pemesanan_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function pemesanan_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function pemesanan_edit($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('pemesanan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->pemesanan_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah pemesanan';

                $view = 'templates/backend/pemesanan_modul/pemesanan_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function ambilpesanan($id)
    {
        if($this->session->userdata('logged_in'))
        {
            $ul=$this->session->userdata('logged_in');
            $uid=$ul['id'];

            $data = array(
                    'id_operator' => $uid,
                    'status_pengerjaan' => 'onprocess'
                );
            if($this->pemesanan_model->update_data($id,$data))
            {
                $this->session->set_flashdata('success', 'Terima kasih, selamat mengerjakan!');
                redirect('pemesanan', 'refresh');
            } 
            else
            {
                $this->session->set_flashdata('error', 'Maaf, update gagal!');
                redirect('pemesanan', 'refresh');
            }
        }
    }

    public function selesaipesanan($id)
    {
        if($this->session->userdata('logged_in'))
        {
            $ul=$this->session->userdata('logged_in');
            $uid=$ul['id'];

            $data = array(
                    'id_operator' => $uid,
                    'status_pengerjaan' => 'finished'
                );
            if($this->pemesanan_model->update_data($id,$data))
            {
                $this->session->set_flashdata('success', 'Terima kasih telah menyelesaikan pekerjaan!');
                redirect('pemesanan', 'refresh');
            } 
            else
            {
                $this->session->set_flashdata('error', 'Maaf, update gagal!');
                redirect('pemesanan', 'refresh');
            }
        }
    }

    public function batalkanpesanan($id)
    {
        if($this->session->userdata('logged_in'))
        {
            $ul=$this->session->userdata('logged_in');
            $uid=$ul['id'];

            $data = array(
                    'id_operator' => '',
                    'status_pengerjaan' => 'cancel'
                );
            if($this->pemesanan_model->update_data($id,$data))
            {
                $this->session->set_flashdata('success', 'Pesanan telah dibatalkan!');
                redirect('pemesanan', 'refresh');
            } 
            else
            {
                $this->session->set_flashdata('error', 'Maaf, update gagal!');
                redirect('pemesanan', 'refresh');
            }
        }
    }

    public function detail($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('pemesanan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            //if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();
                $ul=$this->session->userdata('logged_in');
                $data['grup_user'] = $ul['group'];
                $data['uid'] = $ul['id'];
                $dt=$this->pemesanan_model->get_data_edit2($id);
                /* DEFINE YOUR OWN DATA HERE */

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Detail pemesanan';
                $data['datanya'] = $dt;

                $view = 'templates/backend/pemesanan_modul/pemesanan_detail';
                show($view, $data);
            /*} else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            }*/
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function pemesanan_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function pemesanan_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('pemesanan');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('pemesanan', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file pemesanan.php */
/* Location: ./application/controllers/pemesanan.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-11-19 12:55:16 */

?>