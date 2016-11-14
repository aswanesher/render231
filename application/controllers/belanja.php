<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Belanja extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('belanja_model');
        $this->load->model('diskon_reseller_model');
        $this->load->library('encrypt');
        $this->load->model('opsi_website');
        $this->load->model('permission_model');
        $this->load->model('users_model');
        $this->load->library('cart');
    }

    public function index()
    {
        $mod=$this->permission_model->get_data_module('belanja');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            if($per->is_view=='true') {
                /* this is for searching */
	            $query1=$this->input->post('query1');
	            $status=$this->input->post('status');
	            $kategori=$this->input->post('kategori');

	            $param = array(
	                'query1' => $query1,
	                'status' => $status,
	                'kategori' => $kategori
	            );

	            $data['query1'] = $query1;
	            $data['status'] = $status;
	            $data['kategori'] = $kategori;
	            $data['kategorinya']= $this->belanja_model->get_kategori();

                $datas=$this->opsi_website->getdata();

                $data['jumlah']= $this->belanja_model->jumlah($param);

                // Config page
                $config['base_url'] = base_url().'/belanja/index';
                $config['total_rows'] = $data['jumlah'];
                $config['per_page'] = 6;

                $dari = $this->uri->segment('3');
                $data['belanja']=$this->belanja_model->get_dataall($param,$config['per_page'],$dari);

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
                $data['judul_panel']='Pengaturan belanja';
                $data['tambah']=$per->is_add;
                $data['edit']=$per->is_edit;
                $data['hapus']=$per->is_delete;

                $view = 'templates/backend/belanja_modul/belanja_data';
                show($view, $data);
            } else {
                echo "<script>alert('Tidak ada hak akses')</script>";
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function add()
    {
        $mod=$this->permission_model->get_data_module('belanja');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            $data = array (
			'id' => $this->input->post('id'),
			'name' => $this->input->post('name'),
			'price' => $this->input->post('price'),
			'qty' => 1
                );
            $this->cart->insert($data);
            redirect('belanja','refresh');
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function remove($rowid)
    {
        if($this->session->userdata('logged_in')) {
		if ($rowid==="all"){
			$this->cart->destroy();
		}else{
			$data = array(
				'rowid'   => $rowid,
				'qty'     => 0
			);
			$this->cart->update($data);
		}
		
		redirect('belanja','refresh');
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function updatecart()
    {
        $mod=$this->permission_model->get_data_module('belanja');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
                            $cart_info =  $_POST['cart'] ;
 		foreach( $cart_info as $id => $cart)
		{	
                    $rowid = $cart['rowid'];
                    $price = $cart['price'];
                    $amount = $price * $cart['qty'];
                    $qty = $cart['qty'];
                    
                    	$data = array(
				'rowid'   => $rowid,
                                'price'   => $price,
                                'amount' =>  $amount,
				'qty'     => $qty
			);
             
			$this->cart->update($data);
		}
		redirect('belanja','refresh'); 
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function belanja_update()
    {
        if($this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function view()
    {
        $mod=$this->permission_model->get_data_module('belanja');
        $per=$this->permission_model->get_data_akses($mod->module_id);

        if($this->session->userdata('logged_in')) {
            $datas=$this->opsi_website->getdata();
                    $data['judul']=$datas->website_title;
                    $data['company']=$datas->company_name;
                    $data['judul_panel']='View Pesanan';
                    $data['reseller'] = $this->users_model->get_user_sales('Reseller');
                    $idres = $this->input->post('id_reseller');
                    $data['idres']=$idres;
                    $view = 'templates/backend/belanja_modul/belanja_add';
                    show($view, $data);
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
    
    public function save() {
        $this->load->model('konfirmasipesanan_model');
        $cart = $this->input->post('cart');
        $reseller = $this->input->post('reseller');
        $total = $this->input->post('total');
        $va = $this->session->userdata('logged_in');
        $nofak =strtotime(date("Y-m-d h:i:s"));
        $data = array('tanggal'=>  date("Y-m-d h:i:s"),
            'no_faktur'=>  $nofak,
            'id_reseller'=>$reseller,
            'total_belanja'=>$total,
            'id_admin'=>$va['id'] );
        if($this->konfirmasipesanan_model->save_data($data)) {
            foreach ($cart as $key => $value) {
                $data_detail = array (
                    'no_faktur'=>$nofak,
                    'id_produk'=>$value['id'],
                    'id_detail_produk'=>$value['id'],
                    'qty'=>$value['qty']
                );
                $this->konfirmasipesanan_model->save_data_detail($data_detail);
            }
            redirect('belanja/remove/all','refresh');
        }
        else {
            redirect('belanja/view','refresh');
        }
        
    }


}

/* End of file belanja.php */
/* Location: ./application/controllers/belanja.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-06-04 12:14:27 */

?>