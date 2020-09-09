<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->Model('User_model');
    }

    /**
     * 登录页面
     */
    public function index()
    {
        $this->loadView('login');
    }



    public function doLogin()
    {

        $retData = [
            'errorCode' => 1,
            'message' => '登录失败'
        ];

        $login = $this->input->post([
            'username', 'password'
        ], true);

        foreach ($login as $k => $v) {
            if (!isset($v[0])) {
                $retData['message'] = "$k 不能为空，请返回修改";
            }

            $this->jsonOut($retData);
        }

        if ($this->User_model->verifyLogin($login['username'], $login['password'])) {
            $retData = [
                'errorCode' => 0,
                'redirectUrl' => site_url('User')
            ];
        }
        $this->jsonOut($retData);
    }

    /**
     * 退出登陆
     */
    public function esc()
    {
        if (!session_id()) session_start();//将session销毁时调用destroy 
        session_destroy ();
        $this->loadView('login');
    }

    /**
     * 系统跳转
     */
    public function jump($id=0)
    {
        if (!session_id()) session_start();
        if (!defined('HOST')) define('HOST','localhost');
        if (!defined('USER')) define('USER','root');
        if (!defined('PASS')) define('PASS','root');
        if (!defined('DBNAME')) define('DBNAME','my_sso');
  
        $con=mysqli_connect("localhost","root","root");
        mysqli_select_db($con,'my_sso');
        mysqli_set_charset($con,'utf8');
        $flow_id = $id;
        $sql = "SELECT user_name,signature FROM sso_request WHERE flow_id = {$flow_id}";
        $result = mysqli_query($con,$sql);
        if (!$result) {
          printf("Error: %s\n", mysqli_error($con));
          exit();
         }
        $row = mysqli_fetch_array($result);
        $user_name = $row['user_name'];
        $signature = $row['signature'];
  
        $dbusername=null;
        $dbpassword=null;
        $result=mysqli_query($con,"select * from sso_request where user_name ='{$user_name}';");
        while ($row=mysqli_fetch_array($result)) {
          $dbusername=$row["user_name"];
          $dbpassword=$row["signature"];
        } 
        if (is_null($dbusername)) {
        ?> 
        <script type="text/javascript"> 
        alert("用户名不存在"); 
        window.location.href="<?php echo site_url('User/index'); ?>";
        </script> 
        <?php  
        } 
        else { 
          if ($dbpassword !=$signature){
        ?> 
        <script type="text/javascript"> 
        alert("密码错误"); 
        window.location.href="<?php echo site_url('User/index'); ?>";
        </script> 
        <?php  
          } 
          else { 
          $_SESSION["user_name"]=$user_name; 
          $_SESSION["code"]=mt_rand(0, 100000);//给session附一个随机值，防止用户直接通过调用界面访问
        ?> 
        <script type="text/javascript">
        alert("登陆成功！欢迎您");
        window.location.href="<?php echo site_url('User/jumpToMain'); ?>";
        </script> 
        <?php  
          } 
        } 
        mysqli_close($con);//关闭数据库连接，如不关闭，下次连接时会出错
      }
//
//    /**
//     * 接收SSO登录推送
//     * @param string $requestString
//     */
//    public function ssoLogin($requestString = '')
//    {
//        $this->load->library('SSOClient');
//
//        if (is_array(($ret = $this->SSOClient->verify($requestString))) && ('0000' === $ret['errorCode'])) {
//            //设置目标用户登录逻辑
//            if ($this->User_model->getUserByUsername($ret['username'])) {
//                $this->User_model->setLogin($ret['username']);
//                redirect(site_url());
//            }
//        }
//        echo $ret['message'];
//    }


}
