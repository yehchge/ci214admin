<?php

class User_model extends CI_Model {

	public function __construct() {
		parent::__construct();
	}
	
	/**
	 *  Get one or many users
	 *  
	 *  @param integer|void $user_id
	 *  
	 *  @return array 
	 */
	public function get($user_id = null) {
		if ($user_id == null) {
			$query = $this->db->get('user');
		} else {
			$query = $this->db->get_where('user',array('user_id' => $user_id));
		}
		return $query->result();
	}
	
	public function create($email, $password) {
		return $this->db->insert('user', array(
			'email' => $email,
			'password' => sha1($password . HASH_KEY)
		));
	}
	
	public function delete($user_id) {
		$this->db->where(array('user_id' => $user_id));
		$this->db->delete('user');
	}
}