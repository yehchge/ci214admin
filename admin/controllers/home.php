<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
		$this->load->view('inc/header');
		$this->load->view('home');
		$this->load->view('inc/footer');
	}
	
	public function login($submit = null)
	{
		if ($submit == null) {
			$this->load->view('inc/header');
			$this->load->view('login');
			$this->load->view('inc/footer');
			return true;
		}
		
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		
		$this->load->model('user_model');
		$result = $this->user_model->login('user', $email, $password);
		
		if ($result == true) {
			echo 'We do login data here!';
		}
	}
}
