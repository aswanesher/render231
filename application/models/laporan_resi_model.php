<?php

if (!defined('BASEPATH')) exit ('No direct script access allowed');

class Laporan_resi_model extends CI_Model
{
    var $table = 'kb_no_resi';
    var $column_order = array('id_resi','nama', 'merk', 'ukuran', 'no_resi','jasa_ekspedisi','biaya_ongkir', 'jumlah_transfer', 'selisih','tanggal,',null); //set column field database for datatable orderable
    var $column_search = array('nama','no_resi','status','tanggal','nm_ekspedisi'); //set column field database for datatable searchable just firstname , lastname , address are searchable
    var $order = array('id_resi' => 'desc'); // default order

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    private function _get_datatables_query()
    {
         
        //$this->db->from($this->table);
        $this->db->from('kb_no_resi as a');
        $this->db->join('kb_jasa_ekspedisi as b', 'a.jasa_ekspedisi=b.id_ekspedisi', 'LEFT');
        $this->db->join('kb_merk_dagang as c', 'a.kategori_produk=c.id_merk', 'LEFT');
 
        $i = 0;
     
        foreach ($this->column_search as $item) // loop column 
        {
            if($_POST['search']['value']) // if datatable send POST for search
            {
                 
                if($i===0) // first loop
                {
                    //$this->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
                    $this->db->like($item, $_POST['search']['value']);
                }
                else
                {
                    $this->db->or_like($item, $_POST['search']['value']);
                }
            }
            $i++;
        }
         
        if(isset($_POST['order'])) // here order processing
        {
            $this->db->order_by($this->column_order[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
        } 
        else if(isset($this->order))
        {
            $order = $this->order;
            $this->db->order_by(key($order), $order[key($order)]);
        }
    }

    function get_data_export($tgl1,$tgl2)
    {

        $this->db->select('a.id_resi, a.nama, c.merk, a.no_resi, b.nm_ekspedisi, a.biaya_ongkir, a.jumlah_transfer, a.selisih, a.tanggal');
        $this->db->from('kb_no_resi as a');
        $this->db->join('kb_jasa_ekspedisi as b', 'a.jasa_ekspedisi=b.id_ekspedisi', 'LEFT');
        $this->db->join('kb_merk_dagang as c', 'a.kategori_produk=c.id_merk', 'LEFT');
        if($tgl1<>'') {
            $this->db->where('a.tanggal >= "'.$tgl1.'"');    
        }
        if($tgl2<>'') {
            $this->db->where('a.tanggal <= "'.$tgl2.'"');
        }
        $this->db->order_by('a.id_resi','asc');

        $query = $this->db->get();
        return $query;
    } 

    function get_data()
    {
        $this->db->select('*');
        $this->db->from('kb_no_resi');

        $query = $this->db->get();
        return $query->result();
    }

    function get_dataall($param,$sampai,$dari)
    {
        $this->db->select('*');
        if($param['query1']!='') {
            $this->db->like('nama',$param['query1']);
        }

        $query = $this->db->get('kb_no_resi',$sampai,$dari);
        return $query->result();
    }

    function get_dataall_front($param,$sampai,$dari)
    {
        $qry="select a.*,b.nm_ekspedisi from kb_no_resi as a, kb_jasa_ekspedisi as b where a.jasa_ekspedisi=b.id_ekspedisi";
        if($param['qwords']!='') {
            //$this->db->like('a.nama',$param['qwords']);
            $qry.=" and a.nama like '".$param['qwords']."%'";
        } else if($param['noresi']!='') {
            //$this->db->where('a.no_resi',$param['noresi']);
            $qry.=" and a.no_resi='".$param['noresi']."'";
        }
        if(empty($dari)) {
            $dari='0';
        } else {
            $dari=$dari;
        }
        $qry.=" order by a.id_resi desc limit ".$dari.", ".$sampai."";

        $qr=$this->db->query($qry);
        /*$this->db->select('a.*,b.nm_ekspedisi');
        $this->db->from('kb_no_resi as a');
        $this->db->join('kb_jasa_ekspedisi as b', 'a.jasa_ekspedisi=b.id_ekspedisi', 'LEFT');
        //$this->db->join('kb_merk_dagang as c', 'a.kategori_produk=c.id_merk', 'LEFT');*/
        /*if($param['qwords']!='') {
            $this->db->like('a.nama',$param['qwords']);
        } else if($param['noresi']!='') {
            $this->db->where('a.no_resi',$param['noresi']);
        }*/

        //$query = $this->db->get('kb_no_resi',$sampai,$dari);
        //return $query->result();
        return $qr->result();
    }

    function get_datatables()
    {
        $this->_get_datatables_query();
        if($_POST['length'] != -1)
        $this->db->limit($_POST['length'], $_POST['start']);
        $query = $this->db->get();
        return $query->result();
    }

    function jumlah(){
        return $this->db->get('kb_no_resi')->num_rows();
    }

    function ceklabeltabel()
    {
        $this->db->list_fields('kb_no_resi');
    }

    function count_filtered()
    {
        $this->_get_datatables_query();
        $query = $this->db->get();
        return $query->num_rows();
    }

    function get_data_edit($id)
    {
        $this->db->select('*');
        $this->db->from('kb_no_resi');
        $this->db->where('id_resi', $id);

        $query = $this->db->get();
        $result = $query->row();
        return $result;
    }

    function save_data($data)
    {
        $query = $this->db->insert('kb_no_resi', $data);
        return $query;
    }

    function update_data($id,$data)
    {
        $this->db->where('id_resi', $id);
        return $this->db->update('kb_no_resi', $data);
    }

    function hapus($id)
    {
        $this->db->where('id_resi', $id);
        return $this->db->delete('kb_no_resi');
    }

}

/* End of file laporan_resi_model.php */
/* Location: ./application/models/laporan_resi_model.php */
/* Please DO NOT modify this information : */
/* Generated by Codeigniter CRUD Generator 2016-07-26 10:19:44 */
?>