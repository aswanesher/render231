<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Profile extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('profile_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index($p="")
    {
        $mod=$this->permission_model->get_data_module('profile');
        //$per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            //if($per->is_view=='true') {
                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false; 
                /* this is for searching */
                /*$query1=$this->input->post('query1');

                $param = array(
                    'query1' => $query1
                );

                $data['query1'] = $query1; */

                $datas=$this->opsi_website->getdata();

                /*$data['jumlah']= $this->profile_model->jumlah();

                // Config page
                $config['base_url'] = base_url().'/profile/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20; 

                $dari = $this->uri->segment('3'); */
                $va = $this->session->userdata('logged_in');
                $data['profile']=$this->profile_model->get_data_edit($va['id']);
                if($p =='x1') {
                    $data['pesan'] = 'Kata Sandi Tidak Sesuai';
                }
                /*
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
                */
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Pengaturan profile';
                /*$data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;*/

                $view = 'templates/backend/profile_modul/profile_add';
                show($view, $data);
            /*} else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }*/
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
/*
    public function profile_add()
    {
        $mod=$this->permission_model->get_data_module('profile');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah profile';

                $view = 'templates/backend/profile_modul/profile_add';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function profile_save()
    {
        if($this->session->userdata('logged_in')) {
            // PUT YOUR OWN PROCESS HERE 

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function profile_edit($id)
    {
        $mod=$this->permission_model->get_data_module('profile');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_edit=='true') {
                $datas=$this->opsi_website->getdata();

                $dt=$this->profile_model->get_data_edit($id);

                // DEFINE YOUR OWN DATA HERE 

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah profile';

                $view = 'templates/backend/profile_modul/profile_edit';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    } */

    public function profile_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post('ID');
            $name = $this->input->post('name');
            $address = $this->input->post('address');
            $phone = $this->input->post('phone');
            $cphone = $this->input->post('cellphone');
            $pic = $this->input->post('user_pic');
            $fb = $this->input->post('fb_url');
            $twit = $this->input->post('twitter_url');
            $link = $this->input->post('linkedin_url');
            $ig = $this->input->post('instagram_url');
            $bbm = $this->input->post('bbm_pin');
            $wa = $this->input->post('whatsapp');
            $pass = $this->input->post('password');
            $cpass = $this->input->post('cpassword');
            $data = array(
              'ID'=>$id,
                'name'=>$name,
                'address'=>$address,
                'phone'=>$phone,
                'cellphone'=>$cphone,
                'user_pic'=>$pic,
                'fb_url'=>$fb,
                'twitter_url'=>$twit,
                'linkedin_url'=>$link,
                'instagram_url'=>$ig,
                'bbm_pin'=>$bbm,
                'whatsapp'=>$wa
            );
            
            if ($pass == $cpass) {
                $datap = array(
                    'user_pass'=>$this->encrypt->sha1($pass)
                );
                $this->profile_model->update_data($id,$data);
                $this->profile_model->update_data_pass($id,$datap);
            }
            else {
                redirect('profile/index/x1','refresh');
            }
            
            redirect('profile','refresh');
            
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
/*
    public function profile_delete($id)
    {
        $mod=$this->permission_model->get_data_module('profile');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_delete=='true') {
                // PUT YOUR OWN PROCESS HERE 
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
*/

}

/* End of file profile.php */
/* Location: ./application/controllers/profile.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-05-20 13:22:01 */

?>