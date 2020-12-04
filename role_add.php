<?php
	
	include_once('functions.php');
	
	if (isset($_POST['name'])) {
		$connect = connect();
		$role_name = htmlentities($_POST['name']);
		$role_name = mysqli_real_escape_string($connect, $role_name);
		$query = "
			INSERT INTO `roles`
				SET `role_name` = '$role_name';
		";
		mysqli_query($connect, $query);
		mysqli_close($connect);
		header('Location: ./roles.php');
	}
	
	$fields = array(
		array(
			'name' => 'name',
			'value' => '',
			'type' => 'text'
		)
	);
	
	view('./templates/form/form', compact('fields'));



?>