<?php

/**
 *  @www url: https://sites.google.com/site/ageechen/work_notes/web-developing-in-php/developing-dynamic-web-sites-with-codeigniter
 */

class Student extends CI_Controller {
	function __construct() {
		parent::__construct();
		
		// load helpers
		$this->load->helper('url');
	}
	
	function index() {
		// Display information for the view
		$data['title'] = 'Classroom: Home Page';
		$data['headline'] = 'Welcome to the Classroom Management System';
		$data['include'] = 'student_index';
		
		$this->load->view('template', $data);
	}
	
	function add() {
		$this->load->helper('form');
		
		// display information for the view
		$data['title'] = "Classroom: Add Student";
		$data['headline'] = "Add a New Student";
		$data['include'] = "student_add";
		
		$this->load->view('template', $data);
	}
	
	function create() {
		$this->load->model('MStudent','',TRUE);
		$this->MStudent->addStudent($_POST);
		redirect('student/add','refresh');
	}
	
	function listing() {
		$this->load->library('table');
		
		$this->load->model('MStudent','',TRUE);
		$students_qry = $this->MStudent->listStudents();
		
		// display information for the view
		$data['title'] = "Classroom: Student Listing";
		$data['headline'] = "Student Listing";
		$data['include'] = "student_listing";
		$data['students_qry'] = $students_qry;
		
		$this->load->view('template', $data);
	}
	
	function edit() {
		$this->load->helper('form');
		
		$id = $this->uri->segment(3);
		$this->load->model('MStudent','',TRUE);
		$data['row'] = $this->MStudent->getStudent($id)->result();
		
		// display information for the view
		$data['title'] = "Classroom: Edit Student";
		$data['headline'] = "Edit Student Information";
		$data['include'] = "student_edit";
		
		$this->load->view('template', $data);
	}
	
	function update() {
		$this->load->model('MStudent','',TRUE);
		$this->MStudent->updateStudent($_POST['id'],$_POST);
		redirect('student/listing','refresh');
	}
	
	function delete() {
		$id = $this->uri->segment(3);
		
		$this->load->model("MStudent",'',TRUE);
		$this->MStudent->deleteStudent($id);
		redirect('student/listing','refresh');
	}
	
}

/* End of file student.php */
/* Location: ./applacation/controllers/student.php */