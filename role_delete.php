<?php
	include_once('functions.php');
	
	if (isset($_GET['id'])) {
	
		$role_id = htmlentities($_GET['id']);
		$connect = connect();
		$role_id = mysqli_real_escape_string($connect, $role_id);
		
		$query = "
			UPDATE `roles`
				SET `role_is_deleted` = 1
				WHERE `role_id` = $role_id;
		";
		mysqli_query($connect, $query);
		mysqli_close($connect);
		header('Location: ./roles.php');
		
	}


?>