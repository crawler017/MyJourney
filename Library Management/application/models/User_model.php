<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends MY_Model
{
    //用户名session标记项
    const USER_SESSION_SIGN = 'username';
    const USER_PASSWORD_SALT = 'this_is_my_sso';

    private $userTable = 'users';

//    /**
//     * 生成哈希密码字符串
//     * @param string $username
//     * @param string $password
//     * @return string
//     */
//    public function createHashedPassword($username = '', $password = '')
//    {
//
//        return md5($password . $username . self::USER_PASSWORD_SALT);
//    }

    /**
     * 校验登录请求
     *
     * @param string $username
     * @param string $password
     * @return bool|mixed
     */
    public function verifyLogin($username = '', $password = '')
    {
        if (!session_id()) session_start();//登录系统开启一个session内容 
		$username=$_REQUEST["username"];//获取表单中的用户名（通过post请求） 
		$password=$_REQUEST["password"];//获取表单中的密码（通过post请求） 
	 
		$con=mysqli_connect("localhost","root","root");//连接mysql 数据库，账户名root ，密码root
		if (!$con) {
		  die('数据库连接失败'.'$mysqli_error($con)');
		}
		mysqli_select_db($con,'my_sso');//use my_sso数据库；
		mysqli_set_charset($con,'utf8');
		$dbusername=null;
		$dbpassword=null;
		$result=mysqli_query($con,"select * from sso_users where username ='{$username}';");
		while ($row=mysqli_fetch_array($result)) {//while循环将$result中的结果找出来 
		  $dbusername=$row["username"];
		  $dbpassword=$row["password"];
		} 
		if (is_null($dbusername)) {//用户名在数据库中不存在时跳回login.php界面
	  ?> 
	  <script type="text/javascript"> 
		alert("用户名不存在"); 
		window.location.href="<?php echo site_url('Login/index'); ?>";
	  </script> 
	  <?php  
		} 
		else { 
      if (password_verify($password, $dbpassword)){//当密码正确时登录
	  ?>
      <?php
            $_SESSION["username"]=$username; 
            $_SESSION["code"]=mt_rand(0, 100000);//给session附一个随机值，防止用户直接通过调用界面访问
            
       ?>     
       <script type="text/javascript"> 
            window.location.href="<?php echo site_url('User/index'); ?>";
       </script>
       <?php  
		  } 
		  else {
        ?> 
        <script type="text/javascript"> 
            alert("密码错误"); 
            window.location.href="<?php echo site_url('Login/index'); ?>";
        </script> 
	  <?php  
		  } 
		} 
	  mysqli_close($con);//关闭数据库连接，如不关闭，下次连接时会出错 
	}
    // public function verifyLogin1($username = '', $password = '')
    // {
    //     if (($user = $this->getUser('username','password', [
    //         'username' => $username,
    //         'password' => $this->createHashedPassword($password)
    //     ]))) {
    //         return $this->setLogin($user->username);
    //     }
    //     return false;
    // }
//
//    /**
//     * 设置登录SESSION记录
//     *
//     * @param string $username
//     * @return bool
//     */
//    public function setLogin($username = '')
//    {
//        $_SESSION[self::USER_SESSION_SIGN] = $username;
//        return true;
//    }
//
//    /**
//     * 销毁当前登录SESSION记录
//     * @return bool
//     */
//    public function setLogout()
//    {
//        unset($_SESSION[self::USER_SESSION_SIGN]);
//        return true;
//    }
//
//    /**
//     * 获取当前登录用户名
//     *
//     * @return bool
//     */
//    public function getCurrentLogin()
//    {
//        return (isset($_SESSION[self::USER_SESSION_SIGN])) ? $_SESSION[self::USER_SESSION_SIGN] : false;
//    }
//
//    /**
//     * 获取当前登录用户信息
//     *
//     * @return bool
//     */
//    public function getCurrentUser()
//    {
//        if (false != ($currentUsername = $this->getCurrentLogin())) {
//            return $this->getUserByUserName($currentUsername);
//        }
//        return false;
//    }
//
//    /**
//     * 获取单个用户
//     *
//     * @param string $select
//     * @param array $where
//     * @param array $like
//     * @return bool|mixed
//     */
//    public function getUser($select = '*', $where = [], $like = [])
//    {
//        return parent::get($this->db, $this->userTable, $select, $where, $like);
//    }
//
//    /**
//     * 通过用户名获取用户信息
//     *
//     * @param string $username
//     * @param string $select
//     * @return bool|mixed
//     */
//    public function getUserByUserName($username = '', $select = '*')
//    {
//        return $this->getUser($select, [
//            'username' => trim($username)
//        ]);
//    }
//
//    /**
//     * 通过用户ID获取用户信息
//     *
//     * @param int $userId
//     * @param string $select
//     * @return bool|mixed
//     */
//    public function getUserById($userId = 0, $select = '*')
//    {
//        return $this->getUser($select, ['user_id' => (int)$userId]);
//    }
//
//    /**
//     * 批量获取用户
//     *
//     * @param string $select
//     * @param array $where
//     * @param array $whereIn
//     * @param array $whereNotIn
//     * @param array $like
//     * @param array $order
//     * @param int $limit
//     * @param int $offset
//     * @param bool $isOnlyReturnCountNum
//     * @param bool $returnAsArray
//     * @return mixed|bool
//     */
//    public function getUsers($select = '*', $where = [],
//                             $whereIn = [], $whereNotIn = [], $like = [], $order = [], $limit = 0, $offset = 0, $isOnlyReturnCountNum = false, $returnAsArray = false)
//    {
//        return parent::gets($this->db, $this->userTable, $select, $where, $whereIn, $whereNotIn, $like, $order, $limit, $offset, $isOnlyReturnCountNum, $returnAsArray);
//    }
//
//    /**
//     * 新增用户
//     *
//     * @param array $set
//     * @return bool
//     */
//    public function addUser($set = [])
//    {
//        if (isset($set['password'])) {
//            $set['password'] = $this->createHashedPassword($set['username'], $set['password']);
//        }
//        return parent::add($this->db, $this->userTable, $set);
//    }
//
//    /**
//     * 使用传参方式新增用户
//     *
//     * @param string $username
//     * @param string $password
//     * @return bool
//     */
//    public function addUserWithParams($username = '', $password = '')
//    {
//        return $this->addUser([
//            'username' => $username,
//            'password' => $password
//        ]);
//    }
//
//    /**
//     * 设置新用户
//     *
//     * @param array $where
//     * @param array $set
//     * @param int $limit
//     * @return bool
//     */
//    public function setUser($where = [], $set = [], $limit = 1)
//    {
//        if(isset($set['password'])){
//            if(!($user=$this->getUser('username',$where))){
//                return false;
//            }
//            $set['password']=$this->createHashedPassword($user->username,$set['password']);
//        }
//        return parent::set($this->db,$this->userTable,$where,$set,$limit);
//    }
//
//    /**
//     * 通过用户编辑用户信息
//     *
//     * @param string $username
//     * @param array $set
//     * @return bool
//     */
//    public function editUserByUserName($username='',$set=[])
//    {
//        if(isset($set['username'])){
//            unset($set['username']);
//        }
//
//        return $this->setUser([
//            'username'=>trim($username)
//        ],$set);
//    }
//
//    /**
//     * 修改用户密码
//     *
//     * @param string $username
//     * @param array $password
//     * @return bool
//     */
//    public function changeUserPassword($username='',$password='')
//    {
//        return $this->editUserByUserName($username,[
//            'password'=>trim($password)
//        ]);
//    }
//
//    /**
//     * 删除用户
//     *
//     * @param array $where
//     * @param int $limit
//     * @return mixed
//     */
//    public function deleteUser($where=[],$limit=1)
//    {
//        return parent::delete($this->db,$this->userTable,$where,$limit);
//    }
//
//    /**
//     * 通过用户ID删除用户
//     *
//     * @param int $userId
//     * @return mixed
//     */
//    public function deleteUserById($userId=0)
//    {
//        return $this->deleteUser(['user_id'=>(int)$userId]);
//    }

}
