<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * BorrowList class.
 * 
 * @extends CI_Controller
 */
class BorrowList extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function borrow() {
	
		$this->load->view('borrowList');}
	public function borrowDel() {

		// 连接配置文件
		require "dbconfig.php";
		// 连接mysql
		$link = @mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
		// 选择数据库
		mysqli_select_db($link,'mysql');
		// 编码设置
		mysqli_set_charset($link,'utf8');
		// 获取id值
		$id = $_GET['id'];
		//删除指定数据
		mysqli_query($link,"DELETE FROM borrow WHERE id ={$id}") or die('删除数据出错：'.'mysqli_error()');
		// 删除完跳转到黑名单列表页
		$this->load->view('borrowList');
	}
}