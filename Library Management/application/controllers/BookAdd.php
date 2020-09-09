<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * BookAdd class.
 * 
 * @extends CI_Controller
 */
class BookAdd extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function add() {
		$this->load->library('form_validation');
		$this->load->view('bookAdd');}
	public function bookAddAct() {

		$this->load->helper(array('form', 'url'));

        $this->load->library('form_validation');

		//赋值了一个数组，数组的三个参数是：表单中字段的名称，错误信息中使用的名称，以及验证规则
		$this->form_validation->set_rules('book_title', 'Book_title', 'required');
		$this->form_validation->set_rules('author', 'Author', 'required');
        $this->form_validation->set_rules('book_copies', 'Book_copies', 'required',
            array('required' => 'You must provide a %s.')
        );
		$this->form_validation->set_rules('publisher_name', 'Publisher_name', 'required');
		$this->form_validation->set_rules('isbn', 'Isbn', 'required');
		$this->form_validation->set_rules('copyright_year', 'Copyright_year', 'required');
		$this->form_validation->set_rules('date_added', 'Date_added', 'required');

        if ($this->form_validation->run() == FALSE)//调用form_validation中的run函数检查表单是否被提交，以及提交的数据是否能通过验证规则
        {
            $this->load->view('bookAdd');//如果未通过验证或未提交表单就显示回bookAdd.php页
        }else{
			$this->load->model('BookAdd_model');//通过。加载model
			$this->BookAdd_model->addBook();//调用BookAdd_model中的addBook这个方法
			?>
            <script type="text/javascript"> 
                alert("添加成功！"); 
                window.location.href="<?php echo site_url('BookList/book'); ?>";
            </script>
            <?php
		}
		
	}
}