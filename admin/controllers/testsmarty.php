<?php

class testsmarty extends CI_Controller {

	function __construct() {
		parent::__construct();
	}
	
	function index() {
		echo "test - smarty !";
		//$smarty->force_compile = true;
		//$this->smarty->debugging = true;
		$this->smarty->caching = true;
		$this->smarty->cache_lifetime = 120;

		$this->smarty->assign("Name","Fred Irving Johnathan Bradley Peppergill",true);
		$this->smarty->assign("FirstName",array("John","Mary","James","Henry"));
		$this->smarty->assign("LastName",array("Doe","Smith","Johnson","Case"));
		$this->smarty->assign("Class",array(array("A","B","C","D"), array("E", "F", "G", "H"),
			  array("I", "J", "K", "L"), array("M", "N", "O", "P")));

		$this->smarty->assign("contacts", array(array("phone" => "1", "fax" => "2", "cell" => "3"),
			  array("phone" => "555-4444", "fax" => "555-3333", "cell" => "760-1234")));

		$this->smarty->assign("option_values", array("NY","NE","KS","IA","OK","TX"));
		$this->smarty->assign("option_output", array("New York","Nebraska","Kansas","Iowa","Oklahoma","Texas"));
		$this->smarty->assign("option_selected", "NE");

		$this->smarty->display('index.tpl');
	}

}