<?php
defined('BASEPATH') OR exit('No diret script access allowed');
class BackAdd_model extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }
    public function addBack(){
        $data = array(
            'book_title'=>$this->input->post("book_title"),
            'isbn'=>$this->input->post("isbn"),
            'name'=>$this->input->post("name"),
            'num'=>$this->input->post("num"),
            'date'=>$this->input->post("date"),

        );
        $this->db->insert("back",$data);
    }
}
