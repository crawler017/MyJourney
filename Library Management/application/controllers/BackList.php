<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * BackList class.
 * 
 * @extends CI_Controller
 */
class BackList extends CI_Controller {

	/**
	 * __construct function.
	 * 
	 * @access public
	 * @return void
	 */
	public function back() {
	
		$this->load->view('backList');}
}