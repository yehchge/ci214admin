<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller {

	public function index() {
		$this->load->model('user_model');
		$users = $this->user_model->get();
		
		$this->load->view('inc/header');
		$this->load->view('admin', array('users' => $users));
		$this->load->view('inc/footer');
	}
	
	public function create_user() {
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		
		$this->load->model('user_model');
		echo $this->user_model->create($email, $password);
	}
	
	public function delete_user() {
		$this->load->model('user_model');
		return $this->user_model->delete($user_id);
	}
	
	
}
