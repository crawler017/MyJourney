<?php
/**
*客户端 模型
*
* @author terminus
*/
class Client_model extends MY_Model
{
//	// 客户名session标记项
//	const CLIENT_SESSION_SIGN = 'clientname';
//	//
//	const CLIENT_PASSWORD_SALT = 'this_is_my_sso';
//
//	// 客户名
//	private $clientTable = 'clients';
//
//
//	/**
//	* 生成哈希密码字符串
//	*
//	* @param string $clientname
//	* @param string $password
//	* @param string
//	*/
//	public function clientAdd()
//	{
//		$data = array(
//            'client_name'=>$this->input->post("client_name"),
//            'client_key'=>$this->input->post("client_key"),
//            'client_url'=>$this->input->post("client_url"),
//            'client_state'=>$this->input->post("client_state"),
//
//        );
//        $this->db->insert("sso_clients",$data);
//	}
//
//	/**
//	*校监登陆请求
//	*
//	* @param string $clientname
//	* @param string $password
//	* @return bool|mixed
//	*/
//	public function verifyLogin($clientname = '', $password = '')
//	{
//		if (($client = $this->getClient('clientname', ['clientname' => $clientname, 'password' => $this->createHashedPassword($clientname,$password)]))){
//			return $this->setLogin($client->clientname);
//		}
//		return false;
//	}
//
//	/**
//	 * 设置登陆SESSION记录
//	 *
//	 * @param string $clientname
//	 * @return bool
//	 */
//	public function setLogin($clientname = '')
//	{
//		$_SESSION[self::CLIENT_SESSION_SIGN] = $clientname;
//		return true;
//	}
//
//	/**
//	 * 销毁当前登陆SESSION记录
//	 *
//	 * @return bool
//	 */
//	public function setLogout()
//	{
//		unset($_SESSION[self::CLIENT_SESSION_SIGN]);
//		return true;
//	}
//
//	/**
//	 * 获取当前登陆客户名
//	 *
//	 * @return string|bool
//	 */
//	public function getCurrentLogin()
//	{
//		return (isset($_SESSION[self::CLIENT_SESSION_SIGN])? $_SESSION[self::CLIENT_SESSION_SIGN]: false);
//	}
//
//	/**
//	 * 获取当前登陆客户信息
//	 *
//	 * @return bool|mixed
//	 */
//	public function getCurrentClient()
//	{
//		if (false !== ($currentClientname = $this->getCurrentLogin())) {
//			return $this->getClientByClientname($currentClientrname);
//		}
//		return false;
//	}
//
//	/**
//	 * 获取单个用户
//	 *
//	 * @param string $select
//	 * @param array $where
//	 * @param array $like
//	 * @return bool|mixed
//	 */
//	public function getClient($select = '*', $where = [], $like = [])
//	{
//		return parent::get($this->db, $this->clientTable, $select, $where, $like);
//	}
//
//	/**
//	 * 通过用户名获取客户信息
//	 *
//	 * @param string $clientname
//	 * @param string $select
//	 * @return bool|mixed
//	 */
//	public function getClientByClientname($clientname = '', $select)
//	{
//		return $this->getClient(select, ['clientname' =>trim($clientname)]);
//	}
//
//	/**
//	 * 通过用户ID获取客户信息
//	 *
//	 * @param int $clientId
//	 * @param string $select
//	 * @return bool|mixed
//	 */
//	public function getClientById($clientId = 0, $select = '*')
//	{
//		return $this->getClient($select, ['client_id' => (int)$clientId]);
//	}
//
//	/**
//	 * 批量获取客户
//	 *
//	 * @param string $select
//	 * @param array $where
//	 * @param array $whereIn
//	 * @param array $whereNotIn
//	 * @param array $like
//	 * @param array $order
//	 * @param int $limit
//	 * @param int $offset
//	 * @param bool $isOnlyReturnCountNum
//	 * @param bool $returnAsArray
//	 * @return bool|mixed
//	 */
//	public function getClients($select = '*', $where = [], $whereIn = [], $whereNotIn = [], $like = [], $order = [], $limit = 0, $offset = 0, $isOnlyReturnCountNum = false, $returnAsArray = false)
//	{
//		return parent::gets($this->db, $this->clientTable, $select, $where, $whereIn, $whereNotIn, $like, $order, $limit, $offset, $isOnlyReturnCountNum, $returnAsArray);
//	}
//
//	/**
//	 * 新增用户
//	 *
//	 * @param array $set
//	 * @return bool|mixed
//	 */
//	public function addClient($set = [])
//	{
//		if (isset($set['password'])) {
//			$set['password'] = $this->createHashedPassword($set['clientname'], $set['password']);
//		}
//		return parent::add($this->db, $this->clientTable, $set);
//	}
//
//	/**
//	 * 使用传参方式新增客户
//	 *
//	 * @param string $clientname
//	 * @param string $password
//	 * @return bool|mixed
//	 */
//	public function addClientWithParams($clientname = '', $password = '')
//	{
//		return $this->addClient(['clientname' => $clientname, 'password' => $password]);
//	}
//
//	/**
//	 * 设置用户
//	 *
//	 * @param array $where
//	 * @param array $set
//	 * @param int $limit
//	 * @return bool|mixed
//	 */
//	public function setClient($where = [], $set = [], $limit = 1)
//	{
//		if (isset($set['password'])){
//			if (!($usr = $this->getClient('clientename, $where'))) {
//				return false;
//			}
//			$set['password'] = $this->createHashedPassword($client->clientname, $set['password']);
//		}
//		return parent::set($this->db, $this->clientTable, $where, $set, $limit);
//	}
//
//	/**
//	 * 通过用户名编辑客户信息
//	 *
//	 * @param string $clientname
//	 * @param array $set
//	 * @return bool|mixed
//	 */
//	public function editClientByClientname($clientname = '', $set = [])
//	{
//		if (isset($set['clientname'])) {
//			unset($set['clientname']);
//		}
//		return $this->setClient(['clientname' => trim($clientname)], $set);
//	}
//
//	/**
//	 * 修改用户密码
//	 *
//	 * @param string $clientname
//	 * @param string $password
//	 * @return bool|mixed
//	 */
//	public function changeClientPassword($clientname = '', $password = '')
//	{
//		return $this->editClientByClientname($clientname, ['password' => trim($password)]);
//	}
//
//	/**
//	 * 删除用户
//	 *
//	 * @param array $where
//	 * @param int $limit
//	 * @return bool|mixed
//	 */
//	public function deleteClient($where = [], $limit = 1)
//	{
//		return patent::delete($this->db, $this->clientTable, $where, $limit);
//	}
//
//	/**
//	 * 通过用户ID删除客户
//	 *
//	 * @param int $clientId
//	 * @return bool|mixed
//	 */
//	public function deleteClientById($clientId = 0)
//	{
//		return $this->deleteClient(['client_id' => (int)$clientId]);
//	}
}