<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Client extends My_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->Model('Client_model');
    }

    /**
     * 接入客户端管理
     */
    public function index()
    {
        $this->loadView('client/clientList');
    }

    /**
     * 增加客户端
     */
    public function clientAdd()
    {
        $this->load->library('form_validation');
        $this->loadView('client/addClient');
    }

    /**
     * 执行删除客户端
     */
    public function clientDel() 
    {
        if (!defined('HOST')) define('HOST','localhost');
        if (!defined('USER')) define('USER','root');
        if (!defined('PASS')) define('PASS','root');
        if (!defined('DBNAME')) define('DBNAME','my_sso');

		$link = @mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
		mysqli_select_db($link,'my_sso');
		// 编码设置
		mysqli_set_charset($link,'utf8');
		$client_id = $_GET['client_id'];
		//删除指定数据
		mysqli_query($link,"DELETE FROM sso_clients WHERE client_id={$client_id}") or die('删除数据出错：'.'mysqli_error()');
		$this->loadView('client/clientList');
    }

    /**
     * 执行修改客户端
     */
    public function clientChange($Id=0)
    {
        $this->loadView('Client/alterClient', ['client_id'=>$Id]);
    }

    /**
     * 执行修改客户端
     */
    public function doClientChange()
    {
        if (!defined('HOST')) define('HOST','localhost');
        if (!defined('USER')) define('USER','root');
        if (!defined('PASS')) define('PASS','root');
        if (!defined('DBNAME')) define('DBNAME','my_sso');

        $link = mysqli_connect(HOST,USER,PASS) or die("提示：数据库连接失败！");
		mysqli_select_db($link,'my_sso');
		// 编码设置
        mysqli_set_charset($link,'utf8');
        
        $client_id = $_POST['client_id'];
		$client_name = $_POST['client_name'];
		$client_key = $_POST['client_key'];
		$client_url = $_POST['client_url'];
        $client_state = $_POST['client_state'];
        $hash = password_hash($client_key, PASSWORD_DEFAULT);

		$query=mysqli_query($link,"UPDATE sso_clients SET client_name='$client_name',client_key='$hash',client_url='$client_url',client_state='$client_state'WHERE client_id=$client_id") or die ('跟新数据出错：'.'mysqli_error()');
        $this->loadView('client/clientList');
    }


    /**
     * 执行创建客户端
     */
    public function doClientAdd()
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
        
        $client_name = $_POST['client_name'];
        $client_key = $_POST['client_key'];
        $client_url = $_POST['client_url'];
        $client_state = $_POST['client_state'];
        $hash = password_hash($client_key, PASSWORD_DEFAULT);

        $Search1 = "select * from sso_clients where client_name = '$_POST[client_name]'";
        $result = $link->query($Search1);
        $number = mysqli_num_rows($result);
        if($number) 
        {
            echo '<script>alert("该客户端名已存在，请输入其他名称");history.go(-1);</script>';
        }else{
            if($client_state == 1)
            {
                $sqlInsert1 = "INSERT INTO sso_request(user_name,signature,request_state) VALUES ('$client_name','$hash','$client_state')";
                $sqlInsert2 = "INSERT INTO sso_clients(client_name,client_key,client_url,client_state) VALUES ('$client_name','$hash','$client_url','$client_state')";
            }else{
                $sqlInsert2 = "INSERT INTO sso_clients(client_name,client_key,client_url,client_state) VALUES ('$client_name','$hash','$client_url','$client_state')";
            }
        if ($link->query($sqlInsert2)  === TRUE) {
    ?>
        <script type="text/javascript"> 
            alert("添加成功！");
            window.location.href="<?php echo site_url('Client/index'); ?>";
	   </script>
    <?php 
        }else{
        echo "数据库2插入失败";
        }

        if ($link->query($sqlInsert1)  === TRUE) {
            ?>
                <script type="text/javascript"> 
                    alert("添加成功！");
                    die;
                    window.location.href="<?php echo site_url('Client/index'); ?>";
               </script>
            <?php 
                }else{
                echo "数据库1插入失败";
                }
    
    }
}

}
