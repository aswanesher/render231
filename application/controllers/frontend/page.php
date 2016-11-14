<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Page extends CI_Controller {

	public function __construct() {
		parent::__construct();
		$this->load->library('encrypt');
		$this->load->model('opsi_website');
		$this->load->model('menu_model');
		$this->load->model('halaman_model');
		$this->load->model('users_model');
		$this->load->model('widgets_model');
		$this->load->model('post_model');
		$this->load->model('media_model');
		$this->load->model('testimonial_model');
		$this->load->model('user_grup_model');
		$this->load->model('produk_model');
		$this->load->library(array('form_validation', 'pagination'));  
		$this->load->helper('url'); 
		$this->load->helper('url_helper');
	}

	////////// INDEX FUNCTION ///////////
	public function views($hal)
	{
		//echo $hal;
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['template']=$datas->template;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		$isihal = $this->halaman_model->get_data_frontend($hal);
		
		if(empty($isihal)) {
			$data['page_title']='404 - Halaman Tidak Ditemukan';
			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/404";
			show_frontend($basetemp, $view, $data);
		} else {

			$data['page_title']=$isihal->post_title;
			$data['page_img']=$isihal->post_image;
			$data['page_content']=$isihal->post_content;
			$data['page_link']=$isihal->permalink;

			// Get User Widget
			$team=$this->widgets_model->get_data_filter('team_w');
			if(!empty($team)) {
				$dtuser=$this->users_model->get_data_widget_team($team->konten_text_id);
				$data['team_widget']=$team;
				$data['users']=$dtuser;
			}
			// End User Widget

			// Get Produk Widget
			$produk=$this->widgets_model->get_data_filter('product_w');
			$data['produk_widget']=$produk;
			if(!empty($produk)) {
				$data['prod_caption']=$produk->konten_text_widget;
				$explode=explode('/', $produk->url);
				$data['prod_url']='products';
				$data['prod_list_url']='p/katalog-produk';
			}
			$dtproduk=$this->produk_model->get_data_widget();
			$data['produk_widget_list']=$dtproduk;
			$data['size'] = "12";
			// End Produk Widget

			// Get data testimonial
			if($isihal->template=='testimonial') {
				//$data['testimonial']=$this->testimonial_model->get_data_widget();
				$param = array(
		            'query1' => '',
		            'status' => '',
		            'kategori' => ''
		        );

		        $datas=$this->opsi_website->getdata();

		        // Config page
		        $config['base_url'] = base_url().'/p/testimonial/hal/';
		        $config['total_rows'] = $this->testimonial_model->jumlah($param);
		        $config['per_page'] = 6;

		        $dari = $this->uri->segment('4');
		        $config['uri_segment'] = 4;

		        $data['testimonial']=$this->testimonial_model->get_dataall_front($param,$config['per_page'],$dari);

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
		        $config['cur_tag_open'] = '<li class="active"><a href="#" style="background-color: #4CAF50;
		        color: white;">';
		        $config['cur_tag_close'] = '</a></li>';
		        $config['num_tag_open'] = '<li>';
		        $config['num_tag_close'] = '</li>';

		        $this->pagination->initialize($config);
			}
			// End get data testimonial

			// Get data testimonial
			if($isihal->template=='datatable') {
				if(strpos($isihal->post_content, 'usertype') !== false) {

					$qwords = $this->input->post('query1');

					$dt=explode("=", $isihal->post_content);
					$isidt=$dt[1];
					$kat=explode(",", $isidt);

					$param = array(
			            'katid' => $kat[0],
			            'katid2' => $kat[1],
			            'qwords' => $qwords
			        );

			        $datas=$this->opsi_website->getdata();

			        // Config page
			        $config['base_url'] = base_url().'/p/'.$isihal->permalink.'/hal/';
			        $config['total_rows'] = $this->users_model->jumlah_front($param);
			        $config['per_page'] = 10;

			        $dari = $this->uri->segment('4');
			        $config['uri_segment'] = 4;

			        $data['dftaragen']=$this->users_model->get_dataall_front($param,$config['per_page'],$dari);

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
			        $config['cur_tag_open'] = '<li class="active"><a href="#" style="background-color: #4CAF50;
			        color: white;">';
			        $config['cur_tag_close'] = '</a></li>';
			        $config['num_tag_open'] = '<li>';
			        $config['num_tag_close'] = '</li>';
			        $data['qwords']=$qwords;

			        $this->pagination->initialize($config);
			        $data['page_content']='';
    			} else {
    				echo 'false';
    			}
			}
			// End get data testimonial

			// Get data blog
			if($isihal->template=='blog') {
				//$data['testimonial']=$this->testimonial_model->get_data_widget();
				$param = array(
		            'query1' => '',
		            'status' => '',
		            'kategori' => ''
		        );

		        $datas=$this->opsi_website->getdata();

		        // Config page
		        $config['base_url'] = base_url().'/p/berita/hal/';
		        $config['total_rows'] = $this->post_model->jumlah_blog();
		        $config['per_page'] = 6;

		        $dari = $this->uri->segment('4');
		        $config['uri_segment'] = 4;

		        $data['blogs']=$this->post_model->get_dataall_front($param,$config['per_page'],$dari);

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
		        $config['cur_tag_open'] = '<li class="active"><a href="#" style="background-color: #4CAF50;
		        color: white;">';
		        $config['cur_tag_close'] = '</a></li>';
		        $config['num_tag_open'] = '<li>';
		        $config['num_tag_close'] = '</li>';

		        $this->pagination->initialize($config);
			}
			// End get data blog

			// Get Pricing Widget
			$pricing=$this->widgets_model->get_data_filter('pricing_w');
			if(!empty($pricing)) {
				$dtpricing=$this->post_model->get_data_widget_pricing($pricing->konten_text_id);
				$data['pricing_caption']=$pricing->konten_text_widget;
				$data['pricing_widget']=$pricing;
				$data['pricing']=$dtpricing;
			}
			// End Pricing Widget

			// Get Bank Widget
			$bank=$this->widgets_model->get_data_filter('bank_w');
			if(!empty($bank)) {
				$data['bank_widget']=$bank;
				$data['bank']=$this->media_model->get_data_filter($bank->konten_text_id);
				$data['bank_caption']=$bank->konten_text_widget;
			}
			// End Bank Widget

			// Get Delivery Widget
			$delivery=$this->widgets_model->get_data_filter('delivery_w');
			if(!empty($delivery)) {
				$data['delivery_widget']=$delivery;
				$data['delivery']=$this->media_model->get_data_filter($delivery->konten_text_id);
				$data['delivery_caption']=$delivery->konten_text_widget;
			}
			// End Delivery Widget

			// Get Delivery Widget
			$customw=$this->widgets_model->get_data_filter('custom_w');
			if(!empty($customw)) {
				$data['custom_widget']=$customw;
				$data['custom_caption']=$customw->konten_text_widget;
			}
			// End Delivery Widget

			// Get data produk
			/*$dtproduk=$this->produk_model->get_data_prd();
			$data['produk']=$dtproduk;*/
			/* this is for searching */
			if($isihal->template=='product_fullwidth') {
		        $param = array(
		            'query1' => '',
		            'status' => '',
		            'kategori' => ''
		        );

		        $datas=$this->opsi_website->getdata();

		        // Config page
		        $config['base_url'] = base_url().'/p/produk/hal/';
		        $config['total_rows'] = $this->produk_model->jumlah_front();
		        $config['per_page'] = 6;

		        $dari = $this->uri->segment('4');
		        $config['uri_segment'] = 4;

		        $data['produk']=$this->produk_model->get_dataall($param,$config['per_page'],$dari);

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
		        $config['cur_tag_open'] = '<li class="active"><a href="#" style="background-color: #4CAF50;
		        color: white;">';
		        $config['cur_tag_close'] = '</a></li>';
		        $config['num_tag_open'] = '<li>';
		        $config['num_tag_close'] = '</li>';

		        $this->pagination->initialize($config);
		    }
			// End get data produk
		    $data['meta_desc']=$datas->meta_desc;
			$data['meta_keywords']=$datas->meta_keywords;
			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/".$isihal->template;
			show_frontend($basetemp, $view, $data);
		}
	}

	public function detail_produk($hal)
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		//$isihal = $this->halaman_model->get_data_frontend($hal);
		/*$data['page_title']=$isihal->post_title;
		$data['page_img']=$isihal->post_image;
		$data['page_content']=$isihal->post_content;
		$data['page_link']=$isihal->permalink;*/

		// Get Produk Widget
		$produk=$this->widgets_model->get_data_filter('product_w');
		$data['produk_widget']=$produk;
		if(!empty($produk)) {
			$data['prod_caption']=$produk->konten_text_widget;
			$explode=explode('/', $produk->url);
			$data['prod_url']='products';
			$data['prod_list_url']='p/katalog-produk';
		}
		$dtproduk=$this->produk_model->get_data_widget();
		$data['produk_widget_list']=$dtproduk;
		// End Produk Widget

		// Get User Widget
		$team=$this->widgets_model->get_data_filter('team_w');
		if(!empty($team)) {
			$dtuser=$this->users_model->get_data_widget_team($team->konten_text_id);
			$data['team_widget']=$team;
			$data['users']=$dtuser;
		}
		// End User Widget

		// Get Delivery Widget
		$customw=$this->widgets_model->get_data_filter('custom_w');
		if(!empty($customw)) {
			$data['custom_widget']=$customw;
			$data['custom_caption']=$customw->konten_text_widget;
		}
		// End Delivery Widget

		$dtprod=$this->produk_model->get_data_prd_detail($hal);
		if(empty($dtprod)) {
			$data['page_title']='404 - Halaman Tidak Ditemukan';
			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/404";
			show_frontend($basetemp, $view, $data);
		} else {
			$data['dtprod']=$dtprod;

			// Get data produk
			$dtproduk=$this->produk_model->get_data_prd();
			$data['page_title']=$dtprod->nama_produk;
			$data['produk']=$dtproduk;
			// End get data produk

			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/katalog_detail";
			show_frontend($basetemp, $view, $data);
		}
	}

	public function blogdetail($hal)
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		//$isihal = $this->halaman_model->get_data_frontend($hal);
		/*$data['page_title']=$isihal->post_title;
		$data['page_img']=$isihal->post_image;
		$data['page_content']=$isihal->post_content;
		$data['page_link']=$isihal->permalink;*/

		// Get Delivery Widget
		$customw=$this->widgets_model->get_data_filter('custom_w');
		if(!empty($customw)) {
			$data['custom_widget']=$customw;
			$data['custom_caption']=$customw->konten_text_widget;
		}
		// End Delivery Widget

		// Get User Widget
		$team=$this->widgets_model->get_data_filter('team_w');
		if(!empty($team)) {
			$dtuser=$this->users_model->get_data_widget_team($team->konten_text_id);
			$data['team_widget']=$team;
			$data['users']=$dtuser;
		}
		// End User Widget

		$dtpost=$this->post_model->get_data_detail($hal);
		if(empty($dtpost)) {
			$data['page_title']='404 - Halaman Tidak Ditemukan';
			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/404";
			show_frontend($basetemp, $view, $data);
		} else {
			$data['dtpost']=$dtpost;
			$data['page_title']=$dtpost->post_title;
			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/blogdetail";
			show_frontend($basetemp, $view, $data);
		}
	}

	public function reg_page($hal)
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		// Get Delivery Widget
		$customw=$this->widgets_model->get_data_filter('custom_w');
		if(!empty($customw)) {
			$data['custom_widget']=$customw;
			$data['custom_caption']=$customw->konten_text_widget;
		}
		// End Delivery Widget

		// Get User Widget
		$team=$this->widgets_model->get_data_filter('team_w');
		if(!empty($team)) {
			$dtuser=$this->users_model->get_data_widget_team($team->konten_text_id);
			$data['team_widget']=$team;
			$data['users']=$dtuser;
		}
		// End User Widget

		$isihal = $this->halaman_model->get_data_frontend($hal);
		if(!empty($isihal)) {
			$data['page_title']=$isihal->post_title;
			$data['page_img']=$isihal->post_image;
			$data['page_content']=$isihal->post_content;
			$data['page_link']=$isihal->permalink;
			$data['tipe_user']=$hal;

			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/member_register_form";
			show_frontend($basetemp, $view, $data);
		} else {
			$data['page_title']='404 - Halaman Tidak Ditemukan';
			$basetemp = "templates/frontend/".$datas->template."/";
			$data['temp'] = $basetemp;
			$view = "templates/frontend/".$datas->template."/";
			$data['hal'] = "page/404";
			show_frontend($basetemp, $view, $data);
		}
	}

	public function login_page()
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		$data['page_title']='Login User';

		$basetemp = "templates/frontend/".$datas->template."/";
		$data['temp'] = $basetemp;
		$view = "templates/frontend/".$datas->template."/";
		$data['hal'] = "page/login_page";
		show_frontend($basetemp, $view, $data);
	}

	public function user_profile_page()
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		$data['page_title']='Data User';

		$basetemp = "templates/frontend/".$datas->template."/";
		$data['temp'] = $basetemp;
		$view = "templates/frontend/".$datas->template."/";
		$data['hal'] = "page/user_profile_page";
		show_frontend($basetemp, $view, $data);
	}

	public function change_password_page()
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		$data['page_title']='Ubah Password';

		$basetemp = "templates/frontend/".$datas->template."/";
		$data['temp'] = $basetemp;
		$view = "templates/frontend/".$datas->template."/";
		$data['hal'] = "page/change_password_page";
		show_frontend($basetemp, $view, $data);
	}

	////////// PROSES LOGIN ////////////
	public function loginproses() {

		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;

		$email=$this->form_validation->set_rules('email', 'Email', 'trim|required|xss_clean');
		$passwd=$this->form_validation->set_rules('password', 'Password', 'trim|required|xss_clean');

		$passwdnya=$this->input->post('password');
		$emailnya=$this->input->post('email');
		$password=$this->encrypt->sha1($passwdnya);

		if ($this->form_validation->run() == FALSE) {
			$this->load->view('login',$data);
		} else {
			$result = $this->opsi_website->proseslogin($emailnya,$password);
			if($result != FALSE) {
				$sess_array = array();
				foreach($result as $row)
			    {
			       $sess_array = array(
			         'id' => $row->ID,
			         'user' => $row->user_login,
			         'group' => $row->user_type,
                     'name'=>$row->name,
			       );
			       $this->session->set_userdata('logged_in', $sess_array);
     			   redirect(base_url(), 'refresh');
			    }
			} else {
				$data['error_message']= $this->lang->line('error_message_login');
				$this->load->view('login_page', $data);
			}
		}
	}

	public function logout() {
		session_start();
		$this->session->unset_userdata('logged_in');
		$this->session->unset_userdata('ses_kcfinder');
   		session_destroy();
   		redirect(base_url(), 'refresh');
	}

	public function forgot_password_page()
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		$data['page_title']='Login User';

		$basetemp = "templates/frontend/".$datas->template."/";
		$data['temp'] = $basetemp;
		$view = "templates/frontend/".$datas->template."/";
		$data['hal'] = "page/forgot_password_page";
		show_frontend($basetemp, $view, $data);
	}

	public function testimonial_save($hal)
	{
		$this->load->library('curl'); 

		$recaptchaResponse = trim($this->input->post('g-recaptcha-response'));
		$nama=$this->input->post('nama');
		$judul=$this->input->post('judul');
		$komentar=$this->input->post('komentar');

		$userIp=$this->input->ip_address();
    
  		$secret='6LeHjSETAAAAAAbQqEyKZmRmlIkz0UxhwzVXNErT';
  
  		//$url="https://www.google.com/recaptcha/api/siteverify?secret=".$secret."&response;=".$recaptchaResponse."&remoteip;=".$userIp;
  		$url="https://www.google.com/recaptcha/api/siteverify?secret=".$secret."&response=".$recaptchaResponse."&remoteip=".$userIp; 
  
  		$response = $this->curl->simple_get($url);
  		$status= json_decode($response, true);

  		if($status['success']){
  			$dttesti = array(
				'name'=>$nama,
				'judul_id'=>$judul,
				'testimonial'=>$komentar,
				'approval'=>'false',
				'tanggal'=>date("Y-m-d"),
				'url'=>'#'
			);

			if($this->testimonial_model->save_data($dttesti)) {
				$output = json_encode(array('type'=>'success', 'text' => 'Terima kasih. Testimonial Anda telah terkirim.'));
				die($output);
			} else {
				$output = json_encode(array('type'=>'error', 'text' => 'Maaf testimonial Anda gagal terkirim.'));
				die($output);
			}

  		} else {
  			$output = json_encode(array('type'=>'error', 'text' => 'Captcha tidak diisi.'));
			die($output);
  		}

	}

	public function reg_save($hal)
	{
		$this->load->library('curl'); 

		$rgrup=$this->user_grup_model->cekid();
		$idgrup = $rgrup->id+1;

		$r=$this->users_model->cekid();
		$idnya = $r->ID+1;

		$recaptchaResponse = trim($this->input->post('g-recaptcha-response'));
		$kategori=ucfirst(str_replace("-", " ", $this->input->post('paket')));
		$nama=$this->input->post('nama');
		$email=$this->input->post('email');
		$alamat=$this->input->post('alamat');
		$kota=$this->input->post('kota');
		$negara=$this->input->post('negara');
		$kd_pos=$this->input->post('kd_pos');
		$telepon=$this->input->post('telepon');
		$handphone=$this->input->post('handphone');
		$fb=$this->input->post('fb');
		$whatsapp=$this->input->post('whatsapp');
		$bbm=$this->input->post('bbm');
		$datereg=date("Y-m-d H:i:s");
		$activation=$this->encrypt->sha1($email."-".$datereg);

		$userIp=$this->input->ip_address();
    
  		$secret='6LeHjSETAAAAAAbQqEyKZmRmlIkz0UxhwzVXNErT';
  
  		//$url="https://www.google.com/recaptcha/api/siteverify?secret=".$secret."&response;=".$recaptchaResponse."&remoteip;=".$userIp;
  		$url="https://www.google.com/recaptcha/api/siteverify?secret=".$secret."&response=".$recaptchaResponse."&remoteip=".$userIp; 
  
  		$response = $this->curl->simple_get($url);
  		$status= json_decode($response, true);

  		if($status['success']){  			

			$cekemail = $this->users_model->cekemail($email);
			if(empty($cekemail->user_email)) {

				$id_kat_user = $this->user_grup_model->get_data_cek($kategori);
				if(!empty($id_kat_user->id)) {
						/*$dtgrup = array(
								'id'=>$idgrup,
								'type'=>$kategori
							);*/

						$dtuser = array(
							'ID'=>$idnya,
							'user_nicename'=>$nama,
							'user_email'=>$email,
							'user_registered'=>$datereg,
							'user_activation_key'=>$activation,
							'user_type'=>$id_kat_user->id,
							'display_name'=>$nama
						);

						$dtuserdetail = array(
							'ID'=>$idnya,
							'name'=>$nama,
							'address'=>$alamat,
							'phone'=>$telepon,
							'cellphone'=>$handphone,
							'bbm_pin'=>$bbm,
							'whatsapp'=>$whatsapp
						);
						if($this->users_model->save_data($dtuser)) {
							$this->users_model->save_detail($dtuserdetail);
							// Kirim Email
							$this->load->library('email'); // load email library
						    $this->email->from('admin@kaosnyabagus.com', 'Kaosnyabagus');
						    $this->email->to($email);
						    $this->email->cc('kangcipkusuma@gmail.com'); 
						    $this->email->subject('Registrasi '.$kategori.' Kaosnyabagus');
						    $message="Assalamuallaikum\n\n";
						    $message.="Selamat ".$nama.", Anda telah terdaftar sebagai ".$kategori." di Kaosnyabagus";
						    $message.="\n\nNama : ".$nama;
						    $message.="\nEmail : ".$email;
						    $message.="\nKode Aktivasi : ".$activation;
						    $message.="\n\n\nSalam kami\n";
						    $message.="Tim Kaosnyabagus";
						    $this->email->message($message);
						    $this->email->send();

					        $output = json_encode(array('type'=>'success', 'text' => 'Registrasi Sukses: Selamat! anda telah terdaftar sebagai '.$kategori.' di Kaosnyabagus.'));
							die($output);
						} else {
							$output = json_encode(array('type'=>'error', 'text' => 'Registrasi Gagal: Maaf, anda belum bisa terdaftar sebagai '.$kategori.' di Kaosnyabagus, email anda sudah terdaftar sebelumnya.'));
							die($output);
						}

				} else {
						$dtgrup = array(
								'id'=>$idgrup,
								'type'=>$kategori,
								'date_created'=>$datereg
							);

						$dtuser = array(
							'ID'=>$idnya,
							'user_nicename'=>$nama,
							'user_email'=>$email,
							'user_registered'=>$datereg,
							'user_activation_key'=>$activation,
							'user_type'=>$idgrup,
							'display_name'=>$nama
						);

						$dtuserdetail = array(
							'ID'=>$idnya,
							'name'=>$nama,
							'address'=>$alamat,
							'phone'=>$telepon,
							'cellphone'=>$handphone,
							'bbm_pin'=>$bbm,
							'whatsapp'=>$whatsapp
						);
						$this->user_grup_model->save_data($dtgrup);
						if($this->users_model->save_data($dtuser)) {
							$this->users_model->save_detail($dtuserdetail);
							// Kirim Email
							$this->load->library('email'); // load email library
						    $this->email->from('admin@kaosnyabagus.com', 'Kaosnyabagus');
						    $this->email->to($email);
						    $this->email->cc('kangcipkusuma@gmail.com'); 
						    $this->email->subject('Registrasi '.$kategori.' Kaosnyabagus');
						    $message="Assalamuallaikum\n\n";
						    $message.="Selamat ".$nama.", Anda telah terdaftar sebagai ".$kategori." di Kaosnyabagus";
						    $message.="\n\nNama : ".$nama;
						    $message.="\nEmail : ".$email;
						    $message.="\nKode Aktivasi : ".$activation;
						    $message.="\n\n\nSalam kami\n";
						    $message.="Tim Kaosnyabagus";
						    $this->email->message($message);
						    $this->email->send();

					        $output = json_encode(array('type'=>'success', 'text' => 'Registrasi Sukses: Selamat! anda telah terdaftar sebagai '.$kategori.' di Kaosnyabagus.'));
							die($output);
						} else {
							$output = json_encode(array('type'=>'error', 'text' => 'Registrasi Gagal: Maaf, anda belum bisa terdaftar sebagai '.$kategori.' di Kaosnyabagus, email anda sudah terdaftar sebelumnya'));
							die($output);
						}
				}
			} else {
				$output = json_encode(array('type'=>'error', 'text' => 'Registrasi Gagal: Maaf, anda belum bisa terdaftar sebagai '.$kategori.' di Kaosnyabagus, email anda sudah terdaftar sebelumnya'));
				die($output);
			}
		} else {
			$output = json_encode(array('type'=>'error', 'text' => 'Captcha tidak diisi'));
			die($output);
		}
	}

	public function add_testimonial($hal)
	{
		$datas=$this->opsi_website->getdata();

		$data['judul']=$datas->website_title;
		$data['company']=$datas->company_name;
		$data['website_desc']=$datas->website_desc;
		$data['meta_desc']=$datas->meta_desc;
		$data['meta_keywords']=$datas->meta_keywords;
		$data['address']=$datas->contact_address;
		$data['phone']=$datas->contact_phone;
		$data['bbm']=$datas->bbm_pin;
		$data['whatsapp']=$datas->whatsapp_no;
		$data['telegram']=$datas->telegram_no;
		$data['contact_email']=$datas->contact_email;
		$data['cellphone']=$datas->contact_cellphone;
		$data['fb']=$datas->sosmed_fb;
		$data['twitter']=$datas->sosmed_twitter;
		$data['ig']=$datas->sosmed_instagram;
		$data['gplus']=$datas->sosmed_gplus;
		$data['wlogo']=$datas->logo;
		$data['theme_name']=$datas->template;
		$data['wfavicon']=$datas->favicon;
		$data['analytics']=$datas->google_analytics;
		$data['pixel']=$datas->facebook_pixel;
		$data['gmap']=$datas->gmap_iframe;
		$data['judul_panel']="Dashboard";

		$menu=$this->menu_model->get_data_frontend();
		$data['menu']=$menu;

		// Get Delivery Widget
		$customw=$this->widgets_model->get_data_filter('custom_w');
		if(!empty($customw)) {
			$data['custom_widget']=$customw;
			$data['custom_caption']=$customw->konten_text_widget;
		}
		// End Delivery Widget

		// Get User Widget
		$team=$this->widgets_model->get_data_filter('team_w');
		if(!empty($team)) {
			$dtuser=$this->users_model->get_data_widget_team($team->konten_text_id);
			$data['team_widget']=$team;
			$data['users']=$dtuser;
		}
		// End User Widget

		$data['page_title']='Input Testimonial';

		$basetemp = "templates/frontend/".$datas->template."/";
		$data['temp'] = $basetemp;
		$view = "templates/frontend/".$datas->template."/";
		$data['hal'] = "page/testimonial_form";
		show_frontend($basetemp, $view, $data);
	}

	public function sendemail()
	{	
		$this->load->library('email'); // load email library
	    $this->email->from('aswansetiawan01@gmail.com', 'Kaosnyabagus');
	    $this->email->to('timdimar@gmail.com');
	    //$this->email->cc('kangcipkusuma@gmail.com'); 
	    $this->email->subject('Percobaan Kirim Email');
	    $this->email->message('Test kirim pesan email');
	    /*$this->email->attach('/path/to/file1.png'); // attach file
	    $this->email->attach('/path/to/file2.pdf');*/
	    if ($this->email->send()) {
	        $output = json_encode(array('type'=>'success', 'text' => 'Mailer Success: Mail Sent'));
			die($output);
	    } else {
	        $output = json_encode(array('type'=>'error', 'text' => 'Mailer Error: Failed send email'));
			die($output);
	    }    
	}

}

?>
