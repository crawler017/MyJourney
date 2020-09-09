<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * BookList class.
 * 
 * @extends CI_Controller
 */
class BookList extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function book() {
	
		$this->load->view('bookList');}
	
	public function preEd($bookId=0) {
		
		$this->load->view('bookEdit', [
			'book_id'=>$bookId
		]);	
	}

	public function bookEd() {

		// 连接数据库配置文件
		require_once('dbconfig.php');
		// 连接mysql
		$link = mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
		// 选择数据库
		mysqli_select_db($link,'mysql');
		// 编码设置
		mysqli_set_charset($link,'utf8');
		// 获取修改的书籍信息
		$book_id = $_POST['book_id'];
		$book_title = $_POST['book_title'];
		$author = $_POST['author'];
		$book_copies = $_POST['book_copies'];
		$publisher_name = $_POST['publisher_name'];
		$isbn = $_POST['isbn'];
		$copyright_year = $_POST['copyright_year'];
		$date_added = $_POST['date_added'];
		// 更新指定数据
		$query=mysqli_query($link,"UPDATE book SET book_title='$book_title',author='$author',book_copies='$book_copies',publisher_name='$publisher_name',isbn='$isbn',copyright_year='$copyright_year',date_added='$date_added'WHERE book_id=$book_id") or die ('跟新数据出错：'.'mysqli_error()');
		// 跟新完跳转到图书列表
		$this->load->view('bookList');
	}
	public function bookDel() {

		// 连接数据库配置文件
		require_once('dbconfig.php');
		// 连接mysql
		$link = @mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
		// 选择数据库
		mysqli_select_db($link,'mysql');
		// 编码设置
		mysqli_set_charset($link,'utf8');
		$book_id = $_GET['book_id'];
		//删除指定数据
		mysqli_query($link,"DELETE FROM book WHERE book_id={$book_id}") or die('删除数据出错：'.'mysqli_error()');
		// 删除完跳转到图书列表页
		$this->load->view('bookList');
	}
}