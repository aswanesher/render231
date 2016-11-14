<?php if (!defined('BASEPATH')) exit ('No direct script access allowed');

class mpenjualan extends CI_Controller
{
    public function __construct(){
        parent::__construct();
        $this->load->model('mpenjualan_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('users_model');
        $this->load->model('salestarget_model');
    }
    
    public function index()
    {
        
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_add=='true') {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah sales target';

                $view = 'templates/backend/salestarget_modul/salestarget_add';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }   
}


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
?>

