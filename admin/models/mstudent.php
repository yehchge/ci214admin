<?php

class MStudent extends CI_Model {
	// Create student record in database
	function addStudent($data) {
		$this->db->insert('student',$data);
	}
	
	// Retrieve all student records
	function listStudents() {
		return $this->db->get('student');
	}
	
	// Retrieve one student record
	function getStudent($id) {
		return $this->db->get_where('student', array('id'=>$id));
	}
	
	// Update one student record
	function updateStudent($id, $data) {
		$this->db->where('id',$id);
		// Microsoft SQL Server can't update identity column 'id'
		unset($data['id']);
		$this->db->update('student',$data);
	}
	
	// Delete one student record
	function deleteStudent($id) {
		$this->db->where('id', $id);
		$this->db->delete('student');
	}
	
}

/* End of file mstudent.php */
/* Location: ./application/models/mstudent.php */