<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Media extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('media_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('media_kat_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_view)&&($per->is_view=='true')) {
                /* this is for searching */
                $query1=$this->input->post('query1');
                $kateg=$this->input->post('kategori');
                $param = array(
                    'query1' => $query1,
                    'kateg' => $kateg,
                );

                $data['query1'] = $query1;

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->media_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/media/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['media']=$this->media_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['kategori'] = $this->media_kat_model->get_data();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Pengaturan media';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/media_modul/media_data';
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

    public function media_add($p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false; 
                $datas=$this->opsi_website->getdata();
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['media_kat'] = $this->media_kat_model->get_data();
                $data['judul_panel']='Tambah media';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }                
                $view = 'templates/backend/media_modul/media_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
                $nama =  $this->input->post("nama");
                $jenis = $this->input->post("jenis");
                $ket = $this->input->post("keterangan");
                $gambar = $this->input->post("gambar");
                $kateg = $this->input->post("kategori");
                $url = $this->opsi_website->removeSpesial($this->input->post("url"));
                $va = $this->session->userdata('logged_in');
                $author = $va['id'];
                $created = date("y-m-d/h:i:s");
                $updated = date("y-m-d/h:i:s");
                $thumbs=str_replace("/images/", "/.thumbs/images/", $gambar);
                $thumb=str_replace("/kaosnyabagus/", "", $thumbs);
                $data = array(
                    'id_image'=>'',
                    'nama'=> $nama,
                    'jenis'=> $jenis,
                    'keterangan'=>$ket,
                    'gambar'=>$gambar,
                    'thumb'=>$thumb,
                    'kategori'=>$kateg,
                    'url'=>$url,
                    'author'=>$author,
                    'created_at'=>$created,
                    'updated_at'=>$updated
                );
                if($this->media_model->save_data($data)) {
                    $this->session->set_flashdata('success', 'Data disimpan!');
                    redirect('media', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal disimpan!');
                    redirect('media', 'refresh');
                }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_edit($id,$p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();
                session_start();
                $_SESSION['ses_kcfinder']=array();
                $_SESSION['ses_kcfinder']['disabled'] = false; 
                /* DEFINE YOUR OWN DATA HERE */
                $dt = $this->media_model->get_data_edit($id);
                $data['media_kat'] = $this->media_kat_model->get_data();
                $data['data']=$dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah media';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Merubah Data';
                }
                $view = 'templates/backend/media_modul/media_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
                $nama =  $this->input->post("nama");
                $jenis = $this->input->post("jenis");
                $ket = $this->input->post("keterangan");
                $gambar = $this->input->post("gambar");
                $kateg = $this->input->post("kategori");
                $url = $this->opsi_website->removeSpesial($this->input->post("url"));
                $va = $this->session->userdata('logged_in');
                $author = $va['id'];
                $id_image = $this->input->post("id_image");
                $updated = date("y-m-d/h:i:s");
            $thumbs=str_replace("/images/", "/.thumbs/images/", $gambar);
            $thumb=str_replace("/kaosnyabagus/", "", $thumbs);
                $data = array(
                    'nama'=> $nama,
                    'jenis'=> $jenis,
                    'keterangan'=>$ket,
                    'gambar'=>$gambar,
                    'kategori'=>$kateg,
                    'url'=>$url,
                    'thumb'=>$thumb,
                    'author'=>$author,
                    'updated_at'=>$updated
                );
                if($this->media_model->update_data($id_image,$data)) {
                    $this->session->set_flashdata('success', 'Data diubah!');
                    redirect('media', 'refresh'); 
                } else {
                    $this->session->set_flashdata('error', 'Data gagal diubah!');
                    redirect('media', 'refresh');
                }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function media_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('media');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                if($this->media_model->hapus($id)) {
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('media', 'refresh'); 
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('media', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('media', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }


}

/* End of file media.php */
/* Location: ./application/controllers/media.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-05-09 08:24:03 */

?>