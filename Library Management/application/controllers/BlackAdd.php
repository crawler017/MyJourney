<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * BlackAdd class.
 * 
 * @extends CI_Controller
 */
class BlackAdd extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function blackA() {

		$this->load->library('form_validation');
		$this->load->view('blackAdd');}
	public function blackAd() {

		$this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->form_validation->set_rules('num', 'Num', 'required');
        $this->form_validation->set_rules('name', 'Name', 'required',
            array('required' => 'You must provide a %s.')
        );

        if ($this->form_validation->run() == FALSE)
        {
            $this->load->view('blackAdd');
        }else{
			$this->load->model('BlackAdd_model');
			$this->BlackAdd_model->addBlack();
			?>
            <script type="text/javascript"> 
                alert("添加成功！"); 
                window.location.href="<?php echo site_url('BlackList/black'); ?>";
            </script>
            <?php
		}
	}
}