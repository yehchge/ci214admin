<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title><?=$title?></title>
</head>
<body>
	<div class="navigation">
	<?php
		// nav bar
		echo anchor('student/index', 'Home');
		echo (' | ');
		echo anchor('student/add', 'Add a New Student');
		echo (' | ');
		echo anchor('student/listing', 'List All Students');
	?>
	</div>
	<h1><?=$headline?></h1>
	<?=$this->load->view($include)?>
</body>
</html>