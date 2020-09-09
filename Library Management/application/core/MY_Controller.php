<?php

class MY_Controller extends CI_Controller
{

    public function loadView($views = '', $assign = []
        )
    {
//        $assign = $assign + $this->getStandardAssign();


        if (is_array($views) && count($views)) {
            foreach ($views as $view) {
                $this->load->view($view, $assign);
            }
        } else {
            $this->load->view($views, $assign);
        }


    }

    public function jsonOut($data){
        return $this->output->set_output(json_encode($data));
    }
}
