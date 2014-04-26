<?php

// generate HTML table from query results
$tmpl = array(
	'table_open' => '<table border="0" cellpadding="3" cellspacing="0">',
	'heading_row_start' => '<tr bgcolor="#66cc44">',
	'row_start' => '<tr bgcolor="#dddddd">'
);
$this->table->set_template($tmpl);

$this->table->set_empty("&nbsp;");

$this->table->set_heading('','Child Name', 'Parent Name', 'Address',
	'City', 'State', 'Zip', 'Phone', 'Email');
	
$table_row = array();
foreach($students_qry->result() as $student) {
	$table_row = NULL;
	//$table_row[] = anchor('student/edit/'.$student->id, 'edit');
	$table_row[] = '<nobr>'.
		anchor('student/edit/'. $student->id, 'edit') . ' | '.
		anchor('student/delete/'. $student->id, 'delete', 
			"onClick=\"return confirm('Are you sure you want to '
			+ 'delete the record for $student->s_name?')\"").
			'</nobr>';
	$table_row[] = $student->s_name;
	$table_row[] = $student->p_name;
	$table_row[] = $student->address;
	$table_row[] = $student->city;
	$table_row[] = $student->state;
	$table_row[] = $student->zip;
	$table_row[] = $student->phone;
	$table_row[] = mailto($student->email);
	

	$this->table->add_row($table_row);
}	

$students_table = $this->table->generate();
echo $students_table;