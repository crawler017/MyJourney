<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->Model('User_model');
        $this->load->Model('Request_model');
    }

    /**
     * 加载主页
     */

    public function index()
    {
        $this->loadView('user/index');
    }

    /**
     *  跳转客户端
     */
    public function getClient($clientId = 0)
    {
        if (false !== ($url = $this->Request_model->createRequest($this->user->username, (int)$clientId))) {
            redirect($url);
        }
    }

    /**
     * 跳转到Main
     */
    public function jumpToMain()
    {
      $this->loadView('main');
    }

    /**
     * 创建用户
     */
    public function creatUser()
    {
      $this->load->library('form_validation');
      $this->loadView('user/userAdd');
    }

    /**
     * 执行创建用户
     */
    public function doCreatUser()
    {
        if (!defined('HOST')) define('HOST','localhost');
        if (!defined('USER')) define('USER','root');
        if (!defined('PASS')) define('PASS','root');
        if (!defined('DBNAME')) define('DBNAME','my_sso');
        $link = mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
        // 选择数据库
        mysqli_select_db($link,'my_sso');
        // 编码设置
        mysqli_set_charset($link,'utf8');
        
        $username = $_POST['username'];
        $password = $_POST['password'];
        $hash = password_hash($password, PASSWORD_DEFAULT);

        $sqlSearch = "select * from sso_users where username = '$_POST[username]'";
        $result = $link->query($sqlSearch);
        $number = mysqli_num_rows($result);
        if($number) 
        {
            echo '<script>alert("该用户名已存在，请输入其他名称");history.go(-1);</script>';
        }else{
        $sqlInsert = "INSERT INTO sso_users(username,password) VALUES ('$username','$hash')";
        if ($link->query($sqlInsert)  === TRUE) {
    ?>
        <script type="text/javascript"> 
            alert("添加成功！");
            window.location.href="<?php echo site_url('User/editUser'); ?>";
	   </script>
    <?php 
        }else{
        echo "数据库插入失败" . $sql . "<br>" . $link->error;
        }
    
    }
    }

    /**
     * 列表用户请求登录
     */
    public function requestLogin($id=0)
    {

      if (!session_id()) session_start();
      if (!defined('HOST')) define('HOST','localhost');
      if (!defined('USER')) define('USER','root');
      if (!defined('PASS')) define('PASS','root');
      if (!defined('DBNAME')) define('DBNAME','my_sso');

      $con=mysqli_connect("localhost","root","root");
      mysqli_select_db($con,'my_sso');
      mysqli_set_charset($con,'utf8');
      $user_id = $id;
      $sql = "SELECT username,password FROM sso_users WHERE user_id = {$user_id}";
      $result = mysqli_query($con,$sql);
      if (!$result) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
       }
      $row = mysqli_fetch_array($result);
      $username = $row['username'];
      $password = $row['password'];

      $dbusername=null;
      $dbpassword=null;
      $result=mysqli_query($con,"select * from sso_users where username ='{$username}';");
      while ($row=mysqli_fetch_array($result)) {
        $dbusername=$row["username"];
        $dbpassword=$row["password"];
      } 
      if (is_null($dbusername)) {
      ?> 
      <script type="text/javascript"> 
      alert("用户名不存在"); 
      window.location.href="<?php echo site_url('User/editUser'); ?>";
      </script> 
      <?php  
      } 
      else { 
        if ($dbpassword !=$password){
      ?> 
      <script type="text/javascript"> 
      alert("密码错误"); 
      window.location.href="<?php echo site_url('User/editUser'); ?>";
      </script> 
      <?php  
        } 
        else { 
        $_SESSION["username"]=$username; 
        $_SESSION["code"]=mt_rand(0, 100000);//给session附一个随机值，防止用户直接通过调用界面访问
      ?> 
      <script type="text/javascript"> 
      window.location.href="<?php echo site_url('User/index'); ?>";
      </script> 
      <?php  
        } 
      } 
      mysqli_close($con);//关闭数据库连接，如不关闭，下次连接时会出错
    }

    /**
     * 编辑用户
     */
    public function editUser()
    {
      $this->loadView('user/userList');
    }

    public function delUser()
    {
      if (!defined('HOST')) define('HOST','localhost');
      if (!defined('USER')) define('USER','root');
      if (!defined('PASS')) define('PASS','root');
      if (!defined('DBNAME')) define('DBNAME','my_sso');

      $link = @mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
      mysqli_select_db($link,'my_sso');
      // 编码设置
      mysqli_set_charset($link,'utf8');
      $user_id = $_GET['user_id'];
      //删除指定数据
      mysqli_query($link,"DELETE FROM sso_users WHERE user_id={$user_id}") or die('删除数据出错：'.'mysqli_error()');
      $this->loadView('User/userList');
    }
    /**
     * 修改密码
     */
    public function changePass()
    {

        $this->loadView('user/alterPass');}

    public function doChangePass()
    {

        if (!session_id())session_start ();
        $username = $_REQUEST ["username"]; 
        $oldpassword = $_REQUEST ["oldpassword"]; 
        $newpassword = $_REQUEST ["newpassword"];


       $passwordHash = password_hash($newpassword, PASSWORD_DEFAULT);

        $con = mysqli_connect ( "localhost", "root", "root" ); 
        if (! $con) { 
          die ( '数据库连接失败' . mysqli_error () );
        } 
        mysqli_select_db ( $con,'my_sso');
        mysqli_set_charset( $con,'utf8');
        $dbusername = null; 
        $dbpassword = null; 
        $result = mysqli_query ( $con,"select * from sso_users where username ='{$username}';" );
        while ( $row = mysqli_fetch_array ( $result ) ) { 
          $dbusername = $row ["username"]; 
          $dbpassword = $row ["password"]; 
        } 
        if (is_null ( $dbusername )) {
          ?> 
        <script type="text/javascript"> 
          alert("用户名不存在"); 
          window.location.href="<?php echo site_url('User/changePass'); ?>"; 
        </script>  
        <?php 
        } 
        if (password_verify($oldpassword, $dbpassword === false)) {
          ?> 
        <script type="text/javascript"> 
          alert("密码错误"); 
          window.location.href="<?php echo site_url('User/changePass'); ?>"; 
        </script> 
        <?php 
        } 
        mysqli_query ( $con,"update sso_users set password='{$passwordHash}' where username='{$username}'" ) or die ( "存入数据库失败" . mysqli_error () );//如果上述用户名密码判定不错，则update进数据库中
        mysqli_close ( $con ); 
        ?> 
        <script type="text/javascript"> 
          alert("密码修改成功!请重新登陆"); 
          window.location.href="<?php echo site_url('Login/index'); ?>";
        </script> 
        <?php
    }
}