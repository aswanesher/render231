<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Panel extends CI_Controller {

	private $host;
    private $user;
    private $password;
    private $database;
    private $sql;

	public function __construct() {
		parent::__construct();
		$this->connection();
		$this->load->helper('file');
        $this->load->model('generator_model');
		//$this->load->library('encrypt');
		//$this->load->model('opsi_website');
	}

	public function index()
	{
		$data['judul_panel']="Generator";
		$data['company']="Savana-Tech";
		$data['tabel'] = $this->db->list_tables();
		$this->load->view('generator/index',$data);
	}

	function connection()
    {
        $subject = file_get_contents('application/config/database.php');
        $string = str_replace("defined('BASEPATH') OR exit('No direct script access allowed');", "", $subject);

        $con = 'application/controllers/generator/core/connection.php';
        $create = fopen($con, "w") or die("Unable to open core/connection.php!");
        fwrite($create, $string);
        fclose($create);

        require $con;

        $this->host = $db['default']['hostname'];
        $this->user = $db['default']['username'];
        $this->password = $db['default']['password'];
        $this->database = $db['default']['database'];

        $this->sql = new mysqli($this->host, $this->user, $this->password, $this->database);
        if ($this->sql->connect_error)
        {
            echo $this->sql->connect_error . ", please check 'application/config/database.php'.";
            die();
        }

        unlink($con);
    }

	function primary_field($table)
    {
        $query = "SELECT COLUMN_NAME,COLUMN_KEY FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=? AND TABLE_NAME=? AND COLUMN_KEY = 'PRI'";
        $stmt = $this->sql->prepare($query) OR die("Error code :" . $this->sql->errno . " (primary_field)");
        $stmt->bind_param('ss', $this->database, $table);
        $stmt->bind_result($column_name, $column_key);
        $stmt->execute();
        $stmt->fetch();
        return $column_name;
        $stmt->close();
        $this->sql->close();
    }

    function not_primary_field($table)
    {
        $query = "SELECT COLUMN_NAME,COLUMN_KEY,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=? AND TABLE_NAME=? AND COLUMN_KEY <> 'PRI'";
        $stmt = $this->sql->prepare($query) OR die("Error code :" . $this->sql->errno . " (not_primary_field)");
        $stmt->bind_param('ss', $this->database, $table);
        $stmt->bind_result($column_name, $column_key, $data_type);
        $stmt->execute();
        while ($stmt->fetch()) {
            $fields[] = array('column_name' => $column_name, 'column_key' => $column_key, 'data_type' => $data_type);
        }
        return $fields;
        $stmt->close();
        $this->sql->close();
    }

    function all_field($table)
    {
        $query = "SELECT COLUMN_NAME,COLUMN_KEY,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA=? AND TABLE_NAME=?";
        $stmt = $this->sql->prepare($query) OR die("Error code :" . $this->sql->errno . " (not_primary_field)");
        $stmt->bind_param('ss', $this->database, $table);
        $stmt->bind_result($column_name, $column_key, $data_type);
        $stmt->execute();
        while ($stmt->fetch()) {
            $fields[] = array('column_name' => $column_name, 'column_key' => $column_key, 'data_type' => $data_type);
        }
        return $fields;
        $stmt->close();
        $this->sql->close();
    }

	function proses()
	{

		$tbl_name 	    = $this->input->post('table_name');
        $mod_type       = $this->input->post('mod_type');
        $module_title   = $this->input->post('module_title');
        $module_desc    = $this->input->post('module_desc');
		$primary_f 	    = $this->primary_field($tbl_name);
		$allfield 	    = $this->all_field($tbl_name);
		$controller     = $this->input->post('controller');
		$model 		    = $this->input->post('model');

		if($tbl_name<>'')
		{
                   
			$c = ucfirst($controller);
			$m = ucfirst($model);

			$v_list = $controller."_data";
			$v_edit = $controller."_edit";
			$v_form = $controller."_add";
			$v_del 	= $controller."_delete";

            $ids=$this->generator_model->cekid();
            $idmodule=$ids->module_id+1;


            // simpan ke tabel module
            $post = array(
                    'module_id' => $idmodule,
                    'module_name' => $controller,
                    'module_title' => $module_title,
                    'module_desc' => $module_desc,
                    'module_note' => $module_desc,
                    'module_tbl' => $tbl_name,
                    'module_type' => $mod_type
                );
            $this->generator_model->save_data($post);

            $post2 = array(
                    'id_module' => $idmodule,
                    'id_user_group' => '1',
                    'is_view' => 'true',
                    'is_add' => 'true',
                    'is_edit' => 'true',
                    'is_delete' => 'true'
                );

            $this->generator_model->save_permission($post2);

			// URL
			$c_url = strtolower($c);

			// Filename
			$c_file = $controller.'.php';
			$m_file = $model.'.php';
			$v_list_file = $v_list.'.php';
			$v_edit_file = $v_edit.'.php';
			$v_form_file = $v_form.'.php';

			//var_dump($allfield);

			include 'core/create_controller.php';
			include 'core/create_model.php';
			include 'core/create_view_list.php';
			include 'core/create_view_form.php';
			include 'core/create_view_edit.php';
		}
		redirect('menu', 'refresh');

	}
}
?>