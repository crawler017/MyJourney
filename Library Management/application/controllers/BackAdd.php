<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * BackAdd class.
 * 
 * @extends CI_Controller
 */
class BackAdd extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function backA() {

		$this->load->library('form_validation');
		$this->load->view('backAdd');}
	public function backAd() {

		$this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->form_validation->set_rules('book_title', 'Book_title', 'required');
        $this->form_validation->set_rules('isbn', 'Isbn', 'required',
            array('required' => 'You must provide a %s.')
        );
		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_rules('num', 'Num', 'required');
		$this->form_validation->set_rules('date', 'Date', 'required');

        if ($this->form_validation->run() == FALSE)
        {
            $this->load->view('backAdd');
        }else{
			$this->load->model('BackAdd_model');
			$this->BackAdd_model->addBack();
			?>
            <script type="text/javascript"> 
                alert("添加成功！"); 
                window.location.href="<?php echo site_url('BackList/back'); ?>";
            </script>
            <?php
		}
	}
}