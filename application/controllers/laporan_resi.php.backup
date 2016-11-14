<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Laporan_resi extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('laporan_resi_model');
        $this->load->model('ekspedisi_model');
        $this->load->model('merk_dagang_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->library('Excel');
    }

    public function index()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('laporan_resi');
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

                $data['jumlah']= $this->laporan_resi_model->jumlah();

                // Config page
                $config['base_url'] = base_url().'/laporan_resi/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 20;

                $dari = $this->uri->segment('3');
                $data['laporan_resi']=$this->laporan_resi_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pelaporan Resi Pengiriman';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/laporan_resi_modul/laporan_resi_data';
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

    public function get_data()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('laporan_resi');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);
        $list = $this->laporan_resi_model->get_datatables();
        $data = array();
        $no = '1';
        foreach ($list as $person) {
            //$no++;
            $row = array();
            $row[] = $person->id_resi;
            $row[] = $person->nama;
            $row[] = $person->merk;
            $row[] = $person->ukuran;
            $row[] = $person->no_resi;
            $row[] = strtoupper($person->nm_ekspedisi);
            if(empty($person->biaya_ongkir)) {
                $ongkir='0';
            } else {
                $ongkir=$person->biaya_ongkir;
            }

            if(empty($person->jumlah_transfer)) {
                $transfer='0'; 
            } else {
                $transfer=$person->jumlah_transfer;
            }

            if(empty($person->selisih)) {
                $selisih='0'; 
            } else {
                $selisih=$person->selisih;
            }

            $row[] = 'Rp. '.number_format($ongkir, '0', '.', '.');
            $row[] = 'Rp. '.number_format($transfer, '0', '.', '.');
            if($person->selisih<0) {
                $row[] = '<span class="label label-lg label-danger">'.'Rp. '.number_format($selisih, '0', '.', '.').'</span>';
            } else {
                $row[] = '<span class="label label-lg label-success">'.'Rp. '.number_format($selisih, '0', '.', '.').'</span>';
            }
            $row[] = $person->tanggal;
 
            //add html for action
            if($per->is_edit=='true') { 
                $edit = '<a class="green" href="'.base_url().'laporan_resi/laporan_resi_edit/'.$person->id_resi.'"><i class="ace-icon fa fa-pencil bigger-130"></i></a>';
            } else {
                $edit = '';
            }
            if($per->is_delete=='true') { 
                $hapus = '<a class="red" href="'.base_url().'laporan_resi/laporan_resi_delete/'.$person->id_resi.'"><i class="ace-icon fa fa-trash-o bigger-130"></i></a>';
            } else {
                $hapus = '';
            }
            $row[] = $edit." ".$hapus;

            if($per->is_edit=='true') { 
                $edits = '<li>
                                    <a href="'.base_url().'laporan_resi/laporan_resi_edit/'.$person->id_resi.'" class="tooltip-success" data-rel="tooltip" title="Edit">
                                        <span class="green">
                                            <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                        </span>
                                    </a>
                                </li>';
            } else {
                $edits = '';
            }

            if($per->is_delete=='true') { 
                $hapuss= '<li>
                                    <a href="'.base_url().'laporan_resi/laporan_resi_delete/'.$person->id_resi.'" class="tooltip-error" data-rel="tooltip" title="Delete">
                                        <span class="red">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </span>
                                    </a>
                                </li>';
            } else {
                $hapuss='';
            }


            $row[] = '<div class="hidden-md hidden-lg action-buttons">
                        <div class="inline pos-rel">

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">';
            $row[] = $edits." ".$hapuss;                   
                            $row[]='</ul>
                        </div>
                    </div>';
 
            $data[] = $row;
        }
 
        $output = array(
                        "draw" => $_POST['draw'],
                        "recordsTotal" => $this->laporan_resi_model->jumlah(),
                        "recordsFiltered" => $this->laporan_resi_model->count_filtered(),
                        "data" => $data,
                );
        //output to json format
        echo json_encode($output);
    }

    public function laporan_resi_add()
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('laporan_resi');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_add)&&($per->is_add=='true')) {
                $datas=$this->opsi_website->getdata();

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Tambah Laporan Resi';

                $data['ekspedisi']= $this->ekspedisi_model->get_data();
                $data['merk']= $this->merk_dagang_model->get_data();

                $view = 'templates/backend/laporan_resi_modul/laporan_resi_add';
                show($view, $data);
            } else if(empty($per->is_add)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('laporan_resi', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('laporan_resi', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function laporan_resi_save()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */

            $usr=$this->session->userdata('logged_in');
            $dateTime = date('Y-m-d');
            $data=array(          
                'nama'=>$this->input->post('nama'),
                'jasa_ekspedisi'=>$this->input->post('jasa_ekspedisi'),
                'no_resi'=>$this->input->post('no_resi'),
                'tanggal'=>$this->input->post('post_date'),
                'kategori_produk'=>$this->input->post('merk'),
                'biaya_ongkir'=>$this->input->post('ongkir'),
                'jumlah_transfer'=>$this->input->post('jml_transfer'),
                'selisih'=>$this->input->post('selisih'),
                'ukuran'=>$this->input->post('ukuran'),
                'alamat'=>$this->input->post('alamat'),
                'created_by'=>$usr['id'],
                'created_at'=>$dateTime
            );
            $result=$this->laporan_resi_model->save_data($data);
            if($result!=FALSE) {            
                $this->session->set_flashdata('success', 'Data berhasil ditambah!');
                redirect('laporan_resi', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal ditambah!');
                redirect('laporan_resi', 'refresh');
            }

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function laporan_resi_edit($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('laporan_resi');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_edit)&&($per->is_edit=='true')) {
                $datas=$this->opsi_website->getdata();
                $data['ekspedisi']= $this->ekspedisi_model->get_data();
                $data['merk']= $this->merk_dagang_model->get_data();
                $dt=$this->laporan_resi_model->get_data_edit($id);
                $data['id_resi'] = $dt->id_resi;
                $data['nama'] = $dt->nama;
                $data['jasa_ekspedisi'] = $dt->jasa_ekspedisi;
                $data['status'] = $dt->status;
                $data['kategori_produk']=$dt->kategori_produk;
                $data['ukuran']=$dt->ukuran;
                $data['ongkir'] = $dt->biaya_ongkir;
                $data['ditransfer'] = $dt->jumlah_transfer;
                $data['selisih'] = $dt->selisih;
                $data['no_resi'] = $dt->no_resi;
                $data['tanggal'] = $dt->tanggal;
                $data['alamat'] = $dt->alamat;
                /* DEFINE YOUR OWN DATA HERE */

                $data['judul']=$datas->website_title;
                $data['company']=$datas->company_name;
                $data['judul_panel']='Ubah Pelaporan Resi';

                $view = 'templates/backend/laporan_resi_modul/laporan_resi_edit';
                show($view, $data);
            } else if(empty($per->is_edit)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('laporan_resi', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('laporan_resi', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function laporan_resi_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
            $usr=$this->session->userdata('logged_in');
            $dateTime = date('Y-m-d');
            $id_resi = $this->input->post('id_resi');
            $data=array(          
                'nama'=>$this->input->post('nama'),
                'jasa_ekspedisi'=>$this->input->post('jasa_ekspedisi'),
                'no_resi'=>$this->input->post('no_resi'),
                'status'=>$this->input->post('status'),
                'tanggal'=>$this->input->post('post_date'),
                'kategori_produk'=>$this->input->post('merk'),
                'biaya_ongkir'=>$this->input->post('ongkir'),
                'jumlah_transfer'=>$this->input->post('jml_transfer'),
                'selisih'=>$this->input->post('selisih'),
                'ukuran'=>$this->input->post('ukuran'),
                'created_by'=>$usr['id'],
                'modified_at'=>$dateTime
            );
            $result=$this->laporan_resi_model->update_data($id_resi,$data);
            if($result!=FALSE) {            
                $this->session->set_flashdata('success', 'Data berhasil diubah!');
                redirect('laporan_resi', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Data gagal diubah!');
                redirect('laporan_resi', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function laporan_resi_delete($id)
    {
        $usr=$this->session->userdata('logged_in');
        $mod=$this->permission_model->get_data_module('laporan_resi');
        $per=$this->permission_model->get_data_akses($mod->module_id,$usr['group']);

        if($this->session->userdata('logged_in')) {
            if(!empty($per->is_delete)&&($per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
                $result=$this->laporan_resi_model->hapus($id);
                if($result!=FALSE) {            
                    $this->session->set_flashdata('success', 'Data berhasil dihapus!');
                    redirect('laporan_resi', 'refresh');
                } else {
                    $this->session->set_flashdata('error', 'Data gagal dihapus!');
                    redirect('laporan_resi', 'refresh');
                }
            } else if(empty($per->is_delete)) {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('laporan_resi', 'refresh');
            } else {
                $this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('laporan_resi', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    function export() {
        $obj = new PHPExcel();
        $obj->getProperties()->setTitle("Export")->setDescription("none");
        $obj->setActiveSheetIndex(0);
        
        $data = $this->laporan_resi_model->get_data_export();
        $field = $data->list_fields();
        $col=0;
        //foreach ($field as $f) {
            //$fieldata=ucfirst(str_replace("_", " ", $f));
            //echo $fieldata;
            $obj->getActiveSheet()->setCellValueByColumnAndRow(0,1,"No.");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(1,1,"Nama");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(2,1,"Produk");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(3,1,"No.Resi");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(4,1,"Ekspedisi");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(5,1,"Ongkir");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(6,1,"Ditransfer");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(7,1,"Selisih");
            $obj->getActiveSheet()->setCellValueByColumnAndRow(8,1,"Tanggal");
            //$col++;
        //}
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
        $objw = PHPExcel_IOFactory::createWriter($obj,'Excel5');
        
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="Laporan_Resi_'.date('dMy').'.xls"');
        header('Cache-Control: max-age=0');
        
        $objw->save('php://output');
        redirect('user','refresh');
    }


}

/* End of file laporan_resi.php */
/* Location: ./application/controllers/laporan_resi.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-07-26 10:19:44 */

?>