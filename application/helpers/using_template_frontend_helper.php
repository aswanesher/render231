<?php
    if ( ! function_exists('show_frontend'))
    {
        function  show_frontend($basetemp, $view, $data)
        {
           global $template2;
           $ci = &get_instance();
           $data['view'] = $view;
           $ci->load->view($basetemp.'index', $data);
        }
    }
?>