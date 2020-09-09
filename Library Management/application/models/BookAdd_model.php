<?php
defined('BASEPATH') OR exit('No diret script access allowed');
class BookAdd_model extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();
    }
    public function addBook(){
        $data = array(
            'book_title'=>$this->input->post("book_title"),
            'author'=>$this->input->post("author"),
            'book_copies'=>$this->input->post("book_copies"),
            'publisher_name'=>$this->input->post("publisher_name"),
            'isbn'=>$this->input->post("isbn"),
            'copyright_year'=>$this->input->post("copyright_year"),
            'date_added'=>$this->input->post("date_added"),

        );
        $this->db->insert("book",$data);
    }
}
