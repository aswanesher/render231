<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Salestarget_model extends CI_Model
{
    public $table = 'kb_target_sales';

    function __construct()
    {
        parent::__construct();
    }

    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_target_sales');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('kb_target_sales.*,kb_users.display_name');
        if($param['query1']!='') {
            $this->db->like('id_target',$param['query1']);
            $this->db->or_like('qty_target',$param['query1']);
            $this->db->or_like('month_target',$param['query1']);
        }
        $this->db->join('kb_users','kb_target_sales.id_admin = kb_users.id','left');

        $query = $this->db->get('kb_target_sales',$sampai,$dari);
        return $query->result();
    }

    function jumlah($param){
        if($param['query1']!='') {
            $this->db->like('id_target',$param['query1']);
            $this->db->or_like('qty_target',$param['query1']);
            $this->db->or_like('month_target',$param['query1']);
        }
        $this->db->join('kb_users','kb_target_sales.id_admin = kb_users.id','left');
        return $this->db->get('kb_target_sales')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_target_sales');
        $this->db->where('id_target', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_target_sales', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id_target', $id);
        return $this->db->update('kb_target_sales', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_target', $id);
        return $this->db->delete('kb_target_sales');
    }
    
    function getID($nama) {
        $this->db->select('id_target');
        $this->db->from('kb_target_sales');
        $this->db->where('month_target',$nama);
        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }
        
        function grafikpertarget($id_target) {
            $bc = $this->db->query("SELECT a.* , sum(b.jumlah_jual) as jumlah_jual  from kb_users as a left join kb_sales_report as b on 
                    a.id = b.id_sales  where a.user_type = 3 and b.id_target = ".$id_target." group by a.user_login");
            return $bc;
        }
        
        function sumPenjualan($id) {
        $this->db->select('sum(jumlah_jual) as a');
        $this->db->from('kb_sales_report');
        $this->db->where('id_target', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
        }
        
        function grafikpertahun($tahun) {
            $bc = $this->db->query("SELECT a.*,sum(b.jumlah_jual) as jj  FROM kb_target_sales as a left join kb_sales_report as b on a.id_target = b.id_target where a.month_target
            like '%".$tahun."%' group by b.id_target");
            return $bc;
        }
        
        function grafiksalestahunan($tahun , $idsales) {
            $bc = $this->db->query("SELECT a.*,sum(b.jumlah_jual) as jj , c.user_login  FROM kb_target_sales as a left join kb_sales_report as b on a.id_target = b.id_target left join kb_users as c on b.id_sales = c.id
where  c.id = ".$idsales." and a.month_target
            like '%".$tahun."%' group by b.id_target");
            return $bc;
        }
        
  /*      function grafikdate($dateawal, $dateakhir) {
            $bc = $this->db->query("select a.*, sum(b.jumlah_jual) as jj , c.name from kb_target_sales as a left join kb_sales_report as b "
                    . "on a.id_target = b.id_target left join kb_user_detail as c on b.id_sales = c.id "
                    . "where b.month_date_time between '".$dateawal."' and '".$dateakhir."'");
        } */
    
    

}

/* End of file salestarget_model.php */
/* Location: ./application/models/salestarget_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-24 17:20:26 */
?>