<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Login class.
 * 
 * @extends CI_Controller
 */
class AlterPass extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function preAlter() {
	
		$this->load->view('alterPass');}

	public function alter() {

    if (!session_id())session_start ();
    $username = $_REQUEST ["username"]; 
    $oldpassword = $_REQUEST ["oldpassword"]; 
    $newpassword = $_REQUEST ["newpassword"]; 
  
    $con = mysqli_connect ( "localhost", "root", "root" ); 
    if (! $con) { 
      die ( '数据库连接失败' . mysqli_error () );
    } 
    mysqli_select_db ( $con,'mysql');
    mysqli_set_charset( $con,'utf8');
    $dbusername = null; 
    $dbpassword = null; 
    $result = mysqli_query ( $con,"select * from user_info where username ='{$username}' and isdelete =0;" );
    while ( $row = mysqli_fetch_array ( $result ) ) { 
      $dbusername = $row ["username"]; 
      $dbpassword = $row ["password"]; 
    } 
    if (is_null ( $dbusername )) {
      ?> 
    <script type="text/javascript"> 
      alert("用户名不存在"); 
      window.location.href="<?php echo site_url('AlterPass/preAlter'); ?>"; 
    </script>  
    <?php 
    } 
    if ($oldpassword != $dbpassword) {
      ?> 
    <script type="text/javascript"> 
      alert("密码错误"); 
      window.location.href="<?php echo site_url('AlterPass/preAlter'); ?>"; 
    </script> 
    <?php 
    } 
    mysqli_query ( $con,"update user_info set password='{$newpassword}' where username='{$username}'" ) or die ( "存入数据库失败" . mysqli_error () );//如果上述用户名密码判定不错，则update进数据库中
    mysqli_close ( $con ); 
    ?> 
    <script type="text/javascript"> 
      alert("密码修改成功"); 
      window.location.href="<?php echo site_url('Login2/login1'); ?>";
    </script> 
    <?php
  }
}

























































