<?php
class uri
{
    private $server_path_info = '';
    private $segment = array();
    private $segments = 0;

    public function __construct()
    {
        $segment_temp = array();
        $this->server_path_info = preg_replace("/\?/", "", $_SERVER["PATH_INFO"]);
        $segment_temp = explode("/", $this->server_path_info);
        foreach ($segment_temp as $key => $seg)
        {
            if (!preg_match("/([a-zA-Z0-9\.\_\-]+)/", $seg) || empty($seg)) unset($segment_temp[$key]);
        }
        foreach ($segment_temp as $k => $value)
        {
            $this->segment[] = $value;
        }
        unset($segment_temp);
        $this->segments = count($this->segment);
    }

    public function segment_exists($id = 0)
    {
        $id = (int)$id;
        if (isset($this->segment[$id])) return true;
        else return false;
    }

    public function get_segment($id = 0)
    {
    $id--;
        $id = (int)$id;
        if ($this->segment_exists($id) === true) return $this->segment[$id];
        else return false;
    }
}
?>