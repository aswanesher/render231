<?php
    if (!defined('BASEPATH')) exit ('No direct script access allowed');

    class Setting extends CI_Controller
    {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('setting_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
    }

    public function index()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('setting');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_view)&&($per->is_view=='true')) {
                /* this is for searching */
                $query1=$this->input->post('query1');

                $param = array(
                    'query1' => $query1
                );

                $user_data = $this->session->userdata('logged_in');
                //var_dump($user_data);
                $sess=$user_data['user'];

                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false;

                $data['query1'] = $query1;

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->setting_model->jumlah();

                // Config page
                $config['base_url'] = base_url().'/setting/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['setting']=$this->setting_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan setting';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/setting_modul/setting_add';
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

    public function setting_add()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('setting');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                //$_SESSION['ses_kcfinder']['uploadURL'] = "../content_upload";
                $datas=$this->opsi_website->getdata();

                $user_data = $this->session->userdata('logged_in');
                //var_dump($user_data);
                $sess=$user_data['user'];

                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false;

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah setting';

                $view = 'templates/backend/setting_modul/setting_add';
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

    public function setting_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post('id');
            $website_title = $this->input->post('website_title');
            $website_desc = $this->input->post('website_desc');
            $logo = $this->input->post('logo');
            $favicon = $this->input->post('favicon');
            $company_name = $this->input->post('company_name');
            $contact_address = $this->input->post('contact_address');
            $contact_email = $this->input->post('contact_email');
            $contact_phone = $this->input->post('contact_phone');
            $contact_fax = $this->input->post('contact_fax');
            $contact_cellphone = $this->input->post('contact_cellphone');
            $meta_title = $this->input->post('meta_title');
            $meta_author = $this->input->post('meta_author');
            $meta_desc = $this->input->post('meta_desc');
            $meta_keywords = $this->input->post('meta_keywords');
            $sosmed_fb = $this->input->post('sosmed_fb');
            $sosmed_twitter = $this->input->post('sosmed_twitter');
            $sosmed_gplus = $this->input->post('sosmed_gplus');
            $sosmed_linkedin = $this->input->post('sosmed_linkedin');
            $sosmed_instagram = $this->input->post('sosmed_instagram');
            $bbm_pin = $this->input->post('bbm_pin');
            $whatsapp_no = $this->input->post('whatsapp_no');
            $telegram_no = $this->input->post('telegram_no');
            $f_an = $this->input->post('f_analytic');
            $g_an = $this->input->post('g_analytic');
            $m_iframe = $this->input->post('map_iframe');
            $token_fb = $this->input->post('token_fb');
            $token_tw = $this->input->post('token_twitter');
            $token_ig = $this->input->post('token_instagram');
            $dt = array(
                    'website_title' => $website_title,
                    'website_desc' => $website_desc,
                    'company_name' => $company_name,
                    'contact_address' => $contact_address,
                    'contact_email' => $contact_email,
                    'contact_phone' => $contact_phone,
                    'contact_fax' => $contact_fax,
                    'contact_cellphone' => $contact_cellphone,
                    'meta_title' => $meta_title,
                    'meta_author' => $meta_author,
                    'meta_desc' => $meta_desc,
                    'meta_keywords' => $meta_keywords,
                    'logo' => $logo,
                    'favicon' => $favicon,
                    'sosmed_fb' => $sosmed_fb,
                    'sosmed_twitter' => $sosmed_twitter,
                    'sosmed_gplus' => $sosmed_gplus,
                    'sosmed_linkedin' => $sosmed_linkedin,
                    'sosmed_instagram' => $sosmed_instagram,
                    'bbm_pin' => $bbm_pin,
                    'whatsapp_no' => $whatsapp_no,
                    'telegram_no' => $telegram_no,
                    'facebook_pixel'=>$f_an,
                    'google_analytics'=>$g_an,
                    'gmap_iframe'=>$m_iframe,
                    'token_fb'=>$token_fb,
                    'token_twitter'=>$token_tw,
                    'token_instagram'=>$token_ig
                );
            if($this->setting_model->save_data($dt)) {
                $this->session->set_flashdata('success', 'Data ditambah!');
                redirect('setting', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal ditambah!');
                redirect('setting', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function setting_edit($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('setting');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $user_data = $this->session->userdata('logged_in');
                //var_dump($user_data);
                $sess=$user_data['user'];

                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false;
                //$_SESSION['ses_kcfinder']['uploadURL'] = "../content_upload";

                $dt=$this->setting_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah setting';

                $view = 'templates/backend/setting_modul/setting_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('user', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('user', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function setting_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post('id');
            $website_title = $this->input->post('website_title');
            $website_desc = $this->input->post('website_desc');
            $logo = $this->input->post('logo');
            $favicon = $this->input->post('favicon');
            $company_name = $this->input->post('company_name');
            $contact_address = $this->input->post('contact_address');
            $contact_email = $this->input->post('contact_email');
            $contact_phone = $this->input->post('contact_phone');
            $contact_fax = $this->input->post('contact_fax');
            $contact_cellphone = $this->input->post('contact_cellphone');
            $meta_title = $this->input->post('meta_title');
            $meta_author = $this->input->post('meta_author');
            $meta_desc = $this->input->post('meta_desc');
            $meta_keywords = $this->input->post('meta_keywords');
            $sosmed_fb = $this->input->post('sosmed_fb');
            $sosmed_twitter = $this->input->post('sosmed_twitter');
            $sosmed_gplus = $this->input->post('sosmed_gplus');
            $sosmed_linkedin = $this->input->post('sosmed_linkedin');
            $sosmed_instagram = $this->input->post('sosmed_instagram');
            $bbm_pin = $this->input->post('bbm_pin');
            $whatsapp_no = $this->input->post('whatsapp_no');
            $telegram_no = $this->input->post('telegram_no');
            $f_an = $this->input->post('f_analytic');
            $g_an = $this->input->post('g_analytic');
            $m_iframe = $this->input->post('map_iframe');
            $token_fb = $this->input->post('token_fb');
            $token_tw = $this->input->post('token_twitter');
            $token_ig = $this->input->post('token_instagram');
            $dt = array(
                    'website_title' => $website_title,
                    'website_desc' => $website_desc,
                    'company_name' => $company_name,
                    'contact_address' => $contact_address,
                    'contact_email' => $contact_email,
                    'contact_phone' => $contact_phone,
                    'contact_fax' => $contact_fax,
                    'contact_cellphone' => $contact_cellphone,
                    'meta_title' => $meta_title,
                    'meta_author' => $meta_author,
                    'meta_desc' => $meta_desc,
                    'meta_keywords' => $meta_keywords,
                    'logo' => $logo,
                    'favicon' => $favicon,
                    'sosmed_fb' => $sosmed_fb,
                    'sosmed_twitter' => $sosmed_twitter,
                    'sosmed_gplus' => $sosmed_gplus,
                    'sosmed_linkedin' => $sosmed_linkedin,
                    'sosmed_instagram' => $sosmed_instagram,
                    'bbm_pin' => $bbm_pin,
                    'whatsapp_no' => $whatsapp_no,
                    'telegram_no' => $telegram_no,
                'facebook_pixel'=>$f_an,
                'google_analytics'=>$g_an,
                'gmap_iframe'=>$m_iframe,
                    'token_fb'=>$token_fb,
                    'token_twitter'=>$token_tw,
                    'token_instagram'=>$token_ig
                );
            if($this->setting_model->update_data($id,$dt)) {
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('setting', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('setting', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function setting_delete($id)
    {
        $mod=$this->permission_model->get_data_module('setting');
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

    /* End of file setting.php */
    /* Location: ./application/controllers/setting.php */
    /* Please DO NOT modify this information : */
    /* Generated by Codeigniter CRUD Generator 2016-04-13 09:38:45 */
    ?>