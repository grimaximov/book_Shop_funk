<?php
	
	include_once('functions.php');
	
	if (isset($_GET['id'])) {
		
		$role_id = htmlentities($_GET['id']);
		
		$connect = connect();
		
		if (isset($_POST['name'])) {
			
			$role_name = htmlentities($_POST['name']);
			$role_name = mysqli_real_escape_string($connect, $role_name);
			
			$query = "
				UPDATE `roles`
					SET `role_name` = '$role_name'
					WHERE `role_id` = $role_id;
			";
			
			mysqli_query($connect, $query);
			mysqli_close($connect);
			header('Location: ./roles.php');
		}
		$query = "
			SELECT `role_name`
			FROM `roles`
			WHERE `role_id` = $role_id;
		";
		
		$result = mysqli_query($connect, $query);
		$role_name = mysqli_fetch_assoc($result);
		
		$fields = array(
			array(
				'name' => 'name',
				'value' => $role_name['role_name'],
				'type' => 'text'
			)
		);
		
		mysqli_close($connect);
		view('./templates/form/form', compact('fields'));
		
	
	}

?>