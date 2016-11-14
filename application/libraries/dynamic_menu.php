<?php

class Dynamic_menu {



	private $ci;            // para CodeIgniter Super Global Referencias o variables globales
    private $id_menu        = 'id="menu"';
    private $class_menu        = 'class="nav nav-list"';
    private $class_parent    = '';
    private $class_last        = 'class="last"';

    function __construct()
    {
        $this->ci =& get_instance();    // get a reference to CodeIgniter.
        $this->ci->load->helper('menu_helper');
    }

    function build_menu($type , $position)
    {
    	$menu = array();
    	$query = $this->ci->db->query("select * from kb_menu where position='".$position."'");

    	 // now we will build the dynamic menus.
        $html_out  = "\t".'<div '.$this->id_menu.'>'."\n";

        switch ($type)
        {
            case 0:            // 0 = top menu
                break;

            case 1:            // 1 = horizontal menu
                $html_out .= "\t\t".'<ul '.$this->class_menu.'>'."\n";
                break;

            case 2:            // 2 = sidebar menu
            	$html_out .= "\t\t".'<ul '.$this->class_menu.'>'."\n";
                break;

            case 3:            // 3 = footer menu
                break;

            default:        // default = horizontal menu
                $html_out .= "\t\t".'<ul '.$this->class_menu.'>'."\n";

                break;
        }

        foreach ($query->result() as $row)
        {
                $id = $row->id;
                $title = $row->title;
                $link_type = $row->link_type;
                $page_id = $row->page_id;
                $module_name = $row->idmodule;
                $url = $row->url;
                $uri = $row->uri;
                $dyn_group_id = $row->dyn_group_id;
                $position = $row->position;
                $target = $row->target;
                $parent_id = $row->parent_id;
                $is_parent = $row->is_parent;
                $show_menu = $row->show_menu;
                $icon = $row->icon;
                $class = $this->ci->router->fetch_class();

                $seg1=$this->ci->uri->segment(1);
                $seg2=$this->ci->uri->segment(2);

                $query2 = $this->ci->db->query("select * from kb_menu where url like '".$class."%'");
                $as=$query2->row();

                if(($as->id==$id)||($as->parent_id==$id)) {
                    $a='class="active"';
                } else {
                    $a='class=""';
                }

              	{
                if ($show_menu && $parent_id == 0)   // are we allowed to see this menu?
                {

                    if ($is_parent == TRUE)
                    {
                       if($url=="#") {
                            $html_out .= "\t\t\t".'<li '.$a.'><a href="#" class="dropdown-toggle"><i class="menu-icon '.$icon.'"></i>'.$title.'</a>';
                       } else {
                            $html_out .= "\t\t\t".'<li '.$a.'>'.anchor($url.' '.$this->class_parent, '<i class="menu-icon '.$icon.'"></i><span>'.$title.'</span>', 'name="'.$title.'" id="'.$id.'" target="'.$target.'"');
                       }
                    }
                    else
                    {
                        $html_out .= "\t\t\t".'<li>'.anchor($url, '<i class="menu-icon '.$icon.'"></i><span>'.$title.'</span>', 'name="'.$title.'" id="'.$id.'" target="'.$target.'"');
                    }

               }

             }
           $html_out .= $this->get_childs($id);
        }

        $html_out .= '</li>'."\n";
        $html_out .= "\t\t".'</ul>' . "\n";
        $html_out .= "\t".'</div>' . "\n";

        return $html_out;
    }

    function get_childs($id)
    {
        $has_subcats = FALSE;

        $html_out  = '';
        $html_out .= "\n\t\t\t\t".'<div>'."\n";
        $html_out .= '<a href="#" class="dropdown-toggle"><b class="arrow fa fa-angle-down" style="
            display: block;
            width: 140px!important;
            height: 14px;
            line-height: 14px;
            text-shadow: none;
            font-size: 18px;
            position: absolute;
            right: 10px;
            top: 12px;
            padding: 0;
            text-align: right !important;
        "></b></a>';
        $html_out .= "\t\t\t\t\t".'<ul class="submenu">'."\n";

        // query q me ejecuta el submenu filtrando por usuario y para buscar el submenu segun el id que traigo
        $query = $this->ci->db->query("select * from kb_menu where parent_id = $id");

        foreach ($query->result() as $row)
        {
                $id = $row->id;
                $title = $row->title;
                $link_type = $row->link_type;
                $page_id = $row->page_id;
                $module_name = $row->idmodule;
                $url = $row->url;
                $uri = $row->uri;
                $dyn_group_id = $row->dyn_group_id;
                $position = $row->position;
                $target = $row->target;
                $parent_id = $row->parent_id;
                $is_parent = $row->is_parent;
                $icon = $row->icon;
                $show_menu = $row->show_menu;
                $class = $this->ci->router->fetch_class();
                $method = $this->ci->router->fetch_method();

                if($this->ci->uri->segment(2)=="") {
                    $qword=$this->ci->uri->segment(1);
                } else {
                    $qword=$this->ci->uri->segment(1)."/".$this->ci->uri->segment(2);
                }

                $qr="select * from kb_menu where url like '".$class."%'";
                $query2 = $this->ci->db->query($qr);
                $as=$query2->row();

                if(($as->id==$id)||($as->parent_id==$id)) {
                    $a='class=""';
                } else {
                    $a='class=""';
                }

                $has_subcats = TRUE;

                if ($is_parent == TRUE)
                {
      			$html_out .= "\t\t\t\t\t\t".'<li '.$a.'>'.anchor($url.' '.$this->class_parent, '<i class="menu-icon '.$icon.'"></i><span>'.$title.'</span>', 'name="'.$title.'" id="'.$id.'" target="'.$target.'"');

                }
                else
                {
                $html_out .= "\t\t\t\t\t\t".'<li '.$a.'>'.anchor($url, '<i class="menu-icon '.$icon.'"></i><span>'.$title.'</span>', 'name="'.$title.'" id="'.$id.'" target="'.$target.'"');
                }

                // Recurse call to get more child submenus.
                   $html_out .= $this->get_childs($id);
        }
      	$html_out .= '</li>' . "\n";
      	$html_out .= "\t\t\t\t\t".'</ul>' . "\n";
      	$html_out .= "\t\t\t\t".'</div>' . "\n";

        return ($has_subcats) ? $html_out : FALSE;

    }

}

?>