<?php
echo form_open('student/create');

// an array of the fields in the student table
$field_array = array('s_name','p_name','address','city','state','zip','phone','email');
foreach($field_array as $field) {
	echo '<p>'.$field.': ';
	echo form_input(array('name' => $field)) . '</p>';
}

// not setting the value attribute omits the submit from the $_POST array
echo form_submit('', 'Add');

echo form_close();