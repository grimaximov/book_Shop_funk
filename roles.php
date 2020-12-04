<?php

	include_once('functions.php');
	$connect = connect();

	$query = "
		SELECT `role_id`, `role_name`
		FROM `roles`
		WHERE `role_is_deleted` = 0;
	";
	
	$result = mysqli_query($connect, $query); 
	$roles = mysqli_fetch_all($result, MYSQLI_ASSOC);
	
	/*
	echo '<pre>';
	print_r($roles);
	echo '</pre>';
	*/
	
	mysqli_close($connect);
	
	$heads = array('ID', 'Название');
	$rows = $roles;
	$name = 'role';
	view('./templates/buttons/add', compact('name'));
	view('./templates/table/thead', compact('heads'));
	view('./templates/table/tbody', compact('rows', 'name'));


?>