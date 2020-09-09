<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * BlackList class.
 * 
 * @extends CI_Controller
 */
class BlackList extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function black() {
	
		$this->load->view('blackList');}
	public function preEd($Id=0) {

		$this->load->view('blackEdit', [
			'id'=>$Id
		]);	
	}
	public function blackEd() {

		require "dbconfig.php";
		// 连接mysql
		$link = mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
		// 选择数据库
		mysqli_select_db($link,'mysql');
		// 编码设置
		mysqli_set_charset($link,'utf8');

		// 获取修改的黑名单
		$id = $_POST['id'];
		$num = $_POST['num'];
		$name = $_POST['name'];
		// 更新指定数据
		$query=mysqli_query($link,"UPDATE blacklist SET num='$num',name='$name'WHERE id=$id") or die ('跟新数据出错：'.'mysqli_error()');
		// 跟新完跳转到黑名单列表
		$this->load->view('blackList');
	}
	public function blackDel() {

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
		mysqli_query($link,"DELETE FROM blacklist WHERE id ={$id}") or die('删除数据出错：'.'mysqli_error()');
		// 删除完跳转到黑名单列表页
		$this->load->view('blackList');
	}
}