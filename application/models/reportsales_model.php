<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Reportsales_model extends CI_Model
{
    public $table = 'kb_sales_report';

    function __construct()
    {
        parent::__construct();
    }

    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_sales_report');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('kb_sales_report.*,kb_users.display_name,kb_user_detail.name,kb_target_sales.month_target');
        if($param['stt'] == '1') {
            if($param['query1']!='') {
                $this->db->like('kb_sales_report.id_sales',$param['query1']);
                $this->db->or_like('kb_sales_report.month_date_time',$param['query1']);
                $this->db->or_like('kb_sales_report.jumlah_jual',$param['query1']);
                $this->db->or_like('kb_sales_report.id_target',$param['query1']);
                $this->db->or_like('kb_users.display_name',$param['query1']);
                $this->db->or_like('kb_user_detail.name',$param['query1']);
                $this->db->or_like('kb_target_sales.month_target',$param['query1']);
            }
        }
        else if($param['stt'] == '2') {
            if($param['sales'] != '') {
                $this->db->like('kb_sales_report.id_sales',$param['sales']);
            }
            if($param['tglawal'] != '' && $param['tglakhir'] != ''){
            $this->db->where("kb_sales_report.month_date_time BETWEEN '".date('Y-m-d',  strtotime($param['tglawal']))."' and '".date('Y-m-d',  strtotime($param['tglakhir']))."' ");
            }
        }
        $this->db->join('kb_users','kb_sales_report.id_sales=kb_users.id','left');
        $this->db->join('kb_user_detail','kb_users.id=kb_user_detail.id','left');
        $this->db->join('kb_target_sales','kb_sales_report.id_target=kb_target_sales.id_target','left');
        $query = $this->db->get('kb_sales_report',$sampai,$dari);
        return $query->result();
    }
    
    function get_data_export() {
        $this->db->select('b.name as nama, kb_sales_report.month_date_time as bulan, kb_sales_report.jumlah_jual , kb_sales_report.created as dibuat, c.month_target as target');
        $this->db->join('kb_user_detail as b','kb_sales_report.id_sales=b.id','left');
        $this->db->join('kb_target_sales as c','kb_sales_report.id_target=c.id_target','left');
        $query = $this->db->get('kb_sales_report');
        return $query;
    }

    function jumlah($param){
        if($param['stt'] == '1') {
            if($param['query1']!='') {
                $this->db->like('kb_sales_report.id_sales',$param['query1']);
                $this->db->or_like('kb_sales_report.month_date_time',$param['query1']);
                $this->db->or_like('kb_sales_report.jumlah_jual',$param['query1']);
                $this->db->or_like('kb_sales_report.id_target',$param['query1']);
                $this->db->or_like('kb_users.display_name',$param['query1']);
                $this->db->or_like('kb_user_detail.name',$param['query1']);
                $this->db->or_like('kb_target_sales.month_target',$param['query1']);
            }
        }
        else if($param['stt'] == '2') {
            if($param['sales'] != '') {
                $this->db->like('kb_sales_report.id_sales',$param['sales']);
            }
            if($param['tglawal'] != '' && $param['tglakhir'] != ''){
            $this->db->where("kb_sales_report.month_date_time BETWEEN '".date('Y-m-d',  strtotime($param['tglawal']))."' and '".date('Y-m-d',  strtotime($param['tglakhir']))."' ");
            }
        }
        $this->db->join('kb_users','kb_sales_report.id_sales=kb_users.id','left');
        $this->db->join('kb_user_detail','kb_users.id=kb_user_detail.id','left');
        $this->db->join('kb_target_sales','kb_sales_report.id_target=kb_target_sales.id_target','left');
        return $this->db->get('kb_sales_report')->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->like('created',$id);
        return $this->db->get($this->table)->result();;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_sales_report', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('created', $id);
        return $this->db->update('kb_sales_report', $data);
    }

    function hapus($id)
    {
        $this->db->where('created', $id);
        return $this->db->delete('kb_sales_report');
    }
    
    function getIdTarget($id) {
        $this->db->select('id_target');
        $this->db->from('kb_sales_report');
        $this->db->where('id_target',$id);
        $query = $this->db->get();
        $result = $query->row();
        return $result;

    }

}

/* End of file reportsales_model.php */
/* Location: ./application/models/reportsales_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-03-25 16:33:01 */
?>