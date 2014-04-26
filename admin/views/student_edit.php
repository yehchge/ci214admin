<?php

echo form_open('student/update');
echo form_hidden('id', $row[0]->id);

// an array of the fields in the student table
$field_array = array('s_name','p_name','address','city','state','zip','phone','email');
foreach($field_array as $field_name) {
	echo '<p>'.$field_name.': ';
	echo form_input($field_name,$row[0]->$field_name).'</p>';
}

// not setting the value attribute omits the submit from the $_POST array
echo form_submit('', 'Update');

echo form_close();