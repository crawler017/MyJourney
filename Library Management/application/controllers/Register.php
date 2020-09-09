<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Login class.
 * 
 * @extends CI_Controller
 */
class Register extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function register1() {
    
        $this->load->library('form_validation');//加载CI框架下的form_validation类库
		$this->load->view('register');}
	public function rCheck() {

        $this->load->helper(array('form', 'url'));

        $this->load->library('form_validation');//加载CI框架下的form_validation类库

        $this->form_validation->set_rules('username', 'Username', 'required');//赋值了一个数组，数组的三个参数是：表单中字段的名称，错误信息中使用的名称，以及验证规则
        $this->form_validation->set_rules('password', 'Password', 'required',//同上
            array('required' => 'You must provide a %s.')
        );
        $this->form_validation->set_rules('assertpassword', 'Assertpassword', 'required');//同上

        if ($this->form_validation->run() == FALSE)//调用form_validation中的run函数检查表单是否被提交，以及提交的数据是否能通过验证规则
        {
            $this->load->view('register');//未通过验证或未提交表单就回register.php页
        }else{
			$this->load->model('Register_model');//如果通过验证就加载model:Register_model
			$this->Register_model->addUser();//调用Register_model中的addUser这个方法
            $this->load->view('login');//写入数据库操作（注册）成功完成，跳转到登陆界面
            ?>
            <script type="text/javascript"> 
                alert("注册成功"); 
                window.location.href="<?php echo site_url('Login/login1'); ?>";
            </script>
            <?php
    
		} 
	} 
}