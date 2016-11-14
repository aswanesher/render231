<?php
if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Widgets extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('widgets_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('post_model');
        $this->load->model('halaman_model');
        $this->load->model('media_kat_model');
        $this->load->model('post_category_model');
        $this->load->model('user_type_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('widgets');
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

                $data['jumlah']= $this->widgets_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/widgets/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['widgets']=$this->widgets_model->get_dataall($param,$config['per_page'],$dari);

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
                /*if($p==="x1" || $a==="x1") {
                    $data['pesan'] = 'Gagal Menghapus Data';
                }*/
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Pengaturan widgets';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/widgets_modul/widgets_data';
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

    public function widgets_add($p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('widgets');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();


                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false;

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah widgets';
                $data['post']=$this->post_model->get_data();
                $data['halaman']=$this->halaman_model->get_data();
                $data['kat_media']=$this->media_kat_model->get_data();
                $data['post_cat']=$this->post_category_model->get_data();
                $data['user_cat']=$this->user_type_model->get_data();
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/widgets_modul/widgets_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('widgets', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('widgets', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function widgets_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */

            $nm_widget          = $this->input->post('nm_widget');
            $post_w             = $this->input->post('post_w');
            $page_w             = $this->input->post('page_w');
            $slider_w           = $this->input->post('slider_w');
            $pricing_w          = $this->input->post('pricing_w');
            $promo_w            = $this->input->post('promo_w');
            $team_w             = $this->input->post('team_w');
            $runningtext_w      = $this->input->post('runningtext_w');
            $blog_w             = $this->input->post('blog_w');
            $bank_w             = $this->input->post('bank_w');
            $delivery_w             = $this->input->post('delivery_w');
            $caption            = $this->input->post('konten_text_widget');
            $permalink          = $this->input->post('permalink');

            if(!empty($post_w)) {
                $dt = $post_w;
            } else if(!empty($page_w)) {
                $dt = $page_w;
            } else if(!empty($slider_w)) {
                $dt = $slider_w;
            } else if(!empty($pricing_w)) {
                $dt = $pricing_w;
            } else if(!empty($promo_w)) {
                $dt = $promo_w;
            } else if(!empty($team_w)) {
                $dt = $team_w;
            } else if(!empty($runningtext_w)) {
                $dt = $runningtext_w;
            } else if(!empty($blog_w)) {
                $dt = $blog_w;
            } else if(!empty($bank_w)) {
                $dt = $bank_w;
            } else if(!empty($delivery_w)) {
                $dt = $delivery_w;
            } else {
                $dt = '';
            }

            if(!empty($caption)) {
                $cap = $caption;
            } else {
                $cap = '';
            }

            $user_data = $this->session->userdata('logged_in');
            $sess=$user_data['id'];

            $isi    = array(
                    'nm_widget'=>$nm_widget,
                    'konten_text_id'=>$dt,
                    'konten_text_widget'=>$cap,
                    'author'=>$sess,
                    'created'=>date("Y-m-d h:i:s"),
                    'url'=>$permalink
                );

            if($this->widgets_model->save_data($isi)) {
                $this->session->set_flashdata('success', 'Data disimpan!');
                redirect('widgets', 'refresh');
            } else  {
                $this->session->set_flashdata('error', 'Data gagal disimpan!');
                redirect('widgets', 'refresh');
            }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function widgets_edit($id,$p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('widgets');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->widgets_model->get_data_edit($id);

                /* DEFINE YOUR OWN DATA HERE */
                $data['post']=$this->post_model->get_data();
                $data['halaman']=$this->halaman_model->get_data();
                $data['kat_media']=$this->media_kat_model->get_data();
                $data['post_cat']=$this->post_category_model->get_data();
                $data['user_cat']=$this->user_type_model->get_data();
                $data['data'] = $dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah widgets';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
                $view = 'templates/backend/widgets_modul/widgets_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('widgets', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('widgets', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function widgets_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $id = $this->input->post('id_widget');
            $post_w             = $this->input->post('post_w');
            $page_w             = $this->input->post('page_w');
            $slider_w           = $this->input->post('slider_w');
            $pricing_w          = $this->input->post('pricing_w');
            $promo_w            = $this->input->post('promo_w');
            $team_w             = $this->input->post('team_w');
            $runningtext_w      = $this->input->post('runningtext_w');
            $blog_w             = $this->input->post('blog_w');
            $bank_w             = $this->input->post('bank_w');
            $delivery_w         = $this->input->post('delivery_w');
            $caption            = $this->input->post('konten_text_widget');
            $permalink          = $this->input->post('permalink');

            if(!empty($post_w)) {
                $dt = $post_w;
            } else if(!empty($page_w)) {
                $dt = $page_w;
            } else if(!empty($slider_w)) {
                $dt = $slider_w;
            } else if(!empty($pricing_w)) {
                $dt = $pricing_w;
            } else if(!empty($promo_w)) {
                $dt = $promo_w;
            } else if(!empty($team_w)) {
                $dt = $team_w;
            } else if(!empty($runningtext_w)) {
                $dt = $runningtext_w;
            } else if(!empty($blog_w)) {
                $dt = $blog_w;
            } else if(!empty($bank_w)) {
                $dt = $bank_w;
            } else if(!empty($delivery_w)) {
                $dt = $delivery_w;
            } else {
                $dt = '';
            }

            if(!empty($caption)) {
                $cap = $caption;
            } else {
                $cap = '';
            }

            $user_data = $this->session->userdata('logged_in');
            $sess=$user_data['id'];

            $isi    = array(
                    'konten_text_id'=>$dt,
                    'konten_text_widget'=>$cap,
                    'author'=>$sess,
                    'updated'=>date("Y-m-d h:i:s"),
                    'url'=>$permalink
                );
            if($this->widgets_model->update_data($id,$isi)){
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('widgets', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('widgets', 'refresh');
            }            
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function widgets_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('widgets');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                if($this->widgets_model->hapus($id)) {
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('widgets', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('widgets', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('widgets', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('widgets', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
}
/* End of file widgets.php */
/* Location: ./application/controllers/widgets.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-05-17 10:20:58 */
?>