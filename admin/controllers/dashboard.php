<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	// ------------------------------------------------------------------------

	public function __construct() 
	{
		parent::__construct();
		
		// Get the last segment in the URI, and only redirect out of the
		// protected area if it is NOT the login form
		$section = $this->uri->segment_array();
		array_shift($section);

		$section = end($this->uri->segment_array());
		if ($section != 'login' && $section != 'submit'
				&& $this->mysession->get('user_id') == false
				) {
			redirect(site_url('dashboard/login'));
		}
	}
	
	// ------------------------------------------------------------------------
	
	public function index()
	{
		redirect(site_url('dashboard/login'));
	}
	
	// ------------------------------------------------------------------------
	
	public function login($submit = null)
	{
		if ($submit == null) {
			$this->load->view('dashboard/inc/header');
			$this->load->view('dashboard/login');
			$this->load->view('dashboard/inc/footer');
			return true;
		}
		
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		
		$this->load->model('user_model');
		$result = $this->user_model->login('user', $email, $password);
		
		if ($result == true) {
			$this->mysession->set('user_id', 1);
			redirect(site_url('dashboard/home'));
		} else {
			redirect(site_url('dashboard/login'));
		}
	}
	
	// ------------------------------------------------------------------------
	
	public function home()
	{
		$this->load->view('dashboard/inc/header');
		$this->load->view('dashboard/home');
		$this->load->view('dashboard/inc/footer');
	}
		
	// ------------------------------------------------------------------------
	
	public function account()
	{
		$this->load->view('dashboard/inc/header');
		$this->load->view('dashboard/account');
		$this->load->view('dashboard/inc/footer');
	}
	
	// ------------------------------------------------------------------------
	
	public function logout()
	{
		$this->mysession->destroy();
		redirect(site_url('dashboard/login'));
	}
	
	// ------------------------------------------------------------------------
	
}
