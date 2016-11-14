<?php

$string = "<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class " . $c . " extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        \$this->load->model('$model');
        \$this->load->library('encrypt');
        \$this->load->model('opsi_website');
        \$this->load->model('permission_model');
    }

    public function index()
    {
        \$usr=\$this->session->userdata('logged_in');
        \$mod=\$this->permission_model->get_data_module('".$controller."');
        \$per=\$this->permission_model->get_data_akses(\$mod->module_id,\$usr['group']);

        if(\$this->session->userdata('logged_in')) {
            if(!empty(\$per->is_view)&&(\$per->is_view=='true')) {
                /* this is for searching */
                \$query1=\$this->input->post('query1');

                \$param = array(
                    'query1' => \$query1
                );

                \$data['query1'] = \$query1;

                \$datas=\$this->opsi_website->getdata();

                \$data['jumlah']= \$this->".$model."->jumlah();

                // Config page
                \$config['base_url'] = base_url().'/".$controller."/index';
                \$config['total_rows'] = \$data['jumlah'];
                \$config['per_page'] = 20;

                \$dari = \$this->uri->segment('3');
                \$data['".$controller."']=\$this->".$model."->get_dataall(\$param,\$config['per_page'],\$dari);

                \$config['full_tag_open'] = '<ul class=pagination>';
                \$config['full_tag_close'] = '</ul>';
                \$config['first_link'] = false;
                \$config['last_link'] = false;
                \$config['first_tag_open'] = '<li>';
                \$config['first_tag_close'] = '</li>';
                \$config['prev_link'] = '&laquo';
                \$config['prev_tag_open'] = '<li class=prev>';
                \$config['prev_tag_close'] = '</li>';
                \$config['next_link'] = '&raquo';
                \$config['next_tag_open'] = '<li>';
                \$config['next_tag_close'] = '</li>';
                \$config['last_tag_open'] = '<li>';
                \$config['last_tag_close'] = '</li>';
                \$config['cur_tag_open'] = '<li class=active><a href=#>';
                \$config['cur_tag_close'] = '</a></li>';
                \$config['num_tag_open'] = '<li>';
                \$config['num_tag_close'] = '</li>';

                \$this->pagination->initialize(\$config);

                \$data['judul']=\$datas->website_title;
                \$data['company']=\$datas->company_name;
                \$data['judul_panel']='Pengaturan ".$controller."';
                \$data['tambah']=\$per->is_add;
                \$data['edit']=\$per->is_edit;
                \$data['hapus']=\$per->is_delete;

                \$view = 'templates/backend/".$controller."_modul/".$v_list."';
                show(\$view, \$data);
            } else if(empty(\$per->is_view)) {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('backend_panel/dashboard', 'refresh');
            } else {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('backend_panel/dashboard', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function ".$v_form."()
    {
        \$usr=\$this->session->userdata('logged_in');
        \$mod=\$this->permission_model->get_data_module('".$controller."');
        \$per=\$this->permission_model->get_data_akses(\$mod->module_id,\$usr['group']);

        if(\$this->session->userdata('logged_in')) {
            if(!empty(\$per->is_add)&&(\$per->is_add=='true')) {
                \$datas=\$this->opsi_website->getdata();

                \$data['judul']=\$datas->website_title;
                \$data['company']=\$datas->company_name;
                \$data['judul_panel']='Tambah ".$controller."';

                \$view = 'templates/backend/".$controller."_modul/".$v_form."';
                show(\$view, \$data);
            } else if(empty(\$per->is_add)) {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('".$controller."', 'refresh');
            } else {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('".$controller."', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function ".$controller."_save()
    {
        if(\$this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */

        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function ".$v_edit."(\$id)
    {
        \$usr=\$this->session->userdata('logged_in');
        \$mod=\$this->permission_model->get_data_module('".$controller."');
        \$per=\$this->permission_model->get_data_akses(\$mod->module_id,\$usr['group']);

        if(\$this->session->userdata('logged_in')) {
            if(!empty(\$per->is_edit)&&(\$per->is_edit=='true')) {
                \$datas=\$this->opsi_website->getdata();

                \$dt=\$this->".$model."->get_data_edit(\$id);

                /* DEFINE YOUR OWN DATA HERE */

                \$data['judul']=\$datas->website_title;
                \$data['company']=\$datas->company_name;
                \$data['judul_panel']='Ubah ".$controller."';

                \$view = 'templates/backend/".$controller."_modul/".$v_edit."';
                show(\$view, \$data);
            } else if(empty(\$per->is_edit)) {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('".$controller."', 'refresh');
            } else {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('".$controller."', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function ".$controller."_update()
    {
        if(\$this->session->userdata('logged_in')) {
            /* PUT YOUR OWN PROCESS HERE */
        } else {
            redirect('backend_panel', 'refresh');
        }
    }

    public function ".$v_del."(\$id)
    {
        \$usr=\$this->session->userdata('logged_in');
        \$mod=\$this->permission_model->get_data_module('".$controller."');
        \$per=\$this->permission_model->get_data_akses(\$mod->module_id,\$usr['group']);

        if(\$this->session->userdata('logged_in')) {
            if(!empty(\$per->is_delete)&&(\$per->is_delete=='true')) {
                /* PUT YOUR OWN PROCESS HERE */
            } else if(empty(\$per->is_delete)) {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('".$controller."', 'refresh');
            } else {
                \$this->session->set_flashdata('error', 'Maaf, Anda tidak memiliki hak akses!');
                redirect('".$controller."', 'refresh');
            }
        } else {
            redirect('backend_panel', 'refresh');
        }
    }
";

$string .= "\n\n}\n\n/* End of file $c_file */
/* Location: ./application/controllers/$c_file */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator ".date('Y-m-d H:i:s')." */

?>";

$target = "application/controllers/".$c_file;

if ( ! write_file($target, $string)) {
    echo 'Unable to write the controller file<br>';
} else {
    echo 'File controller written!<br>';
}

?>