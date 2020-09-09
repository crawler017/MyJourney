<?php
defined('BASEPATH') OR exit('No diret script access allowed');
class Register_model extends CI_Model {
    public function __construct(){
        parent::__construct();
        $this->load->database();//链接数据库操作
    }
    public function addUser(){
        $data = array(
            'username'=>$this->input->post("username"),//获取表单的值
            'password'=>$this->input->post("password"),//同上
        );
        $this->db->insert("user_info",$data);//调用db方法中的insert函数插入数据库
    }
}
