<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Login class.
 * 
 * @extends CI_Controller
 */
class Login extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function login1() {
	
		$this->load->view('login2');}

	public function lCheck() {

        if (!session_id()) session_start();//登录系统开启一个session内容
		$username=$_REQUEST["username"];//获取login.php中的用户名（通过post请求） 
		$password=$_REQUEST["password"];//获取login.php中的密码（通过post请求） 
	 
		$con=mysqli_connect("localhost","root","root");//连接mysql 数据库，账户名root ，密码root
		if (!$con) {
		  die('数据库连接失败'.'$mysqli_error($con)');
		}
		mysqli_select_db($con,'mysql');//use user_info数据库；
		mysqli_set_charset($con,'utf8');
		$dbusername=null;
		$dbpassword=null;
		$result=mysqli_query($con,"select * from user_info where username ='{$username}' and isdelete = 0;");//查出对应用户名的信息，isdelete表示在数据库已被删除的内容
		while ($row=mysqli_fetch_array($result)) {//while循环将$result中的结果找出来 
		  $dbusername=$row["username"];
		  $dbpassword=$row["password"];
		} 
		if (is_null($dbusername)) {//用户名在数据库中不存在时跳回login.php界面
	  ?> 
	  <script type="text/javascript"> 
		alert("用户名不存在"); 
		window.location.href="<?php echo site_url('Login2/login1'); ?>";
	  </script> 
	  <?php  
		} 
		else { 
		  if ($dbpassword!=$password){//当对应密码不对时跳回login.php界面
	  ?> 
	  <script type="text/javascript"> 
		alert("密码错误"); 
		window.location.href="<?php echo site_url('Login2/login1'); ?>";
	  </script> 
	  <?php  
		  } 
		  else { 
			$_SESSION["username"]=$username; 
			$_SESSION["code"]=mt_rand(0, 100000);//给session附一个随机值，防止用户直接通过调用界面访问
	  ?> 
	  <script type="text/javascript"> 
		window.location.href="<?php echo site_url('Main/index'); ?>";
	  </script> 
	  <?php  
		  } 
		} 
	  mysqli_close($con);//关闭数据库连接，如不关闭，下次连接时会出错 
	}
		
}