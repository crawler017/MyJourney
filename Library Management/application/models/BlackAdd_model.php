<?php
defined('BASEPATH') OR exit('No diret script access allowed');
class BlackAdd_model extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }
    public function addBlack(){
        $data = array(
            'num'=>$this->input->post("num"),
            'name'=>$this->input->post("name"),

        );
        $this->db->insert("blacklist",$data);
    }
}
