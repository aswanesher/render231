<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Reportsales extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('reportsales_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('users_model');
        $this->load->model('salestarget_model');
    }

    public function index($p="",$a="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('reportsales');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_view)&&($per->is_view=='true')) {
                /* this is for searching */
                $query1=$this->input->post('query1');

                $param = array(
                    'query1' => $query1,
                     'stt' => $this->input->post('stt'),
                    'tglawal'=>$this->input->post('tglawal'),
                    'tglakhir'=>$this->input->post('tglakhir'),
                    'sales'=>$this->input->post('carisales')
                );

                $data['query1'] = $query1;

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->reportsales_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/reportsales/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['reportsales']=$this->reportsales_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan reportsales';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;
                $data['sales'] = $this->users_model->get_user_sales('Sales');
                $view = 'templates/backend/reportsales_modul/reportsales_data';
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

    public function reportsales_add($p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('reportsales');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();
                
                $data['target'] = $this->salestarget_model->get_data();
                $data['sales'] = $this->users_model->get_user_sales('Sales');
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah report sales';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menambah Data';
                }
                $view = 'templates/backend/reportsales_modul/reportsales_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('reportsales', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('reportsales', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reportsales_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $data_ = array (
                'id_sales' => $this->input->post('id_sales'),
                'month_date_time' => $this->input->post('tgl_jual'),
                'jumlah_jual' => $this->input->post('jumlah_jual'),
                'created' => date("y-m-d/h:i:s"),
                'id_target'=> $this->input->post('id_target')
            );
            if($this->reportsales_model->save_data($data_)) {
                $this->session->set_flashdata('success', 'Data disimpan!');
                redirect('reportsales', 'refresh');
            } else {/*
                $datas=$this->opsi_website->getdata();
                
                $data['target'] = $this->salestarget_model->get_data();
                $data['sales'] = $this->users_model->get_user_sales('Sales');
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah report sales';
                $data['pesan']='Gagal Menyimpan Data';
                $view = 'templates/backend/reportsales_modul/reportsales_add';
                show($view, $data);*/
                $this->session->set_flashdata('error', 'Data gagal disimpan!');
                redirect('reportsales', 'refresh');
            }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reportsales_edit($id,$p="")
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('reportsales');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();

                $dt=$this->reportsales_model->get_data_edit(date("y-m-d h:i:s",$id));
                
                /* DEFINE YOUR OWN DATA HERE */
                $data['target'] = $this->salestarget_model->get_data();
                $data['sales'] = $this->users_model->get_user_sales('Sales');
                $data['isi'] = $dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah report sales';
                if($p=="x1") {
                    $data['pesan'] = 'Gagal Menghapus Data';
                }
                $view = 'templates/backend/reportsales_modul/reportsales_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('reportsales', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('reportsales', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reportsales_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $created = $this->input->post('created');
            $data_ = array(
                'id_sales'=>  $this->input->post('id_sales'),
                'jumlah_jual'=> $this->input->post('jumlah_jual'),
                'month_date_time' => $this->input->post('tgl_jual'),
                'id_target'=> $this->input->post('id_target')
            );
            if($this->reportsales_model->update_data($created,$data_)) {
                $this->session->set_flashdata('success', 'Data diubah!');
                redirect('reportsales', 'refresh');
            } else { /*
                $datas=$this->opsi_website->getdata();

                $dt=$this->reportsales_model->get_data_edit($created);
                $data['target'] = $this->salestarget_model->get_data();
                $data['sales'] = $this->users_model->get_user_sales('Sales');
                $data['isi'] = $dt;
                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['pesan'] = 'Gagal Menyimpan Data';
                $data['judul_panel']='Ubah report sales';

                $view = 'templates/backend/reportsales_modul/reportsales_edit';
                show($view, $data);*/
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('reportsales', 'refresh');
}
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function reportsales_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('reportsales');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                if($this->reportsales_model->hapus(date("y-m-d h:i:s",$id))) {
                    $this->session->set_flashdata('success', 'Data dihapus!');
                    redirect('reportsales', 'refresh');
                }
                else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('reportsales', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('reportsales', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('reportsales', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
    
    function export() {
       $this->load->library('Excel');
            $obj = new PHPExcel();
            $obj->getProperties()->setTitle("Export")->setDescription("none");
            $obj->setActiveSheetIndex(0);
            
            $data = $this->reportsales_model->get_data_export();
            $field = $data->list_fields();
            $col=0;
            foreach ($field as $f) {
                $obj->getActiveSheet()->setCellValueByColumnAndRow($col,1,$f);
                $col++;
            }
            $row =2;
            foreach ($data->result() as $fields) {
                $col=0;
                foreach ($field as $value) {
                    $obj->getActiveSheet()->setCellValueByColumnAndRow($col,$row,$fields->$value);
                    $col++;
                }
                $row++;
            }
            $obj->setActiveSheetIndex(0);
            $objw = PHPExcel_IOFactory::createWriter($obj,'excel5');
            
            header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Penjulan_'.date('dMy').'.xls"');
        header('Cache-Control: max-age=0');
        
        $objw->save('php://output');
        redirect('reportsales','refresh');
    }


}

/* End of file reportsales.php */
/* Location: ./application/controllers/reportsales.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-25 16:33:01 */

?>