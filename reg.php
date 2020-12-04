<?php

	include_once('functions.php');
	
	if (isset($_POST['email'])) {
		$connect = connect();
		$email = htmlentities($_POST['email']);
		$email = mysqli_real_escape_string($connect, $email);
		$password = htmlentities($_POST['password']);
		$password = mysqli_real_escape_string($connect, $password);
		$repeat_password = htmlentities($_POST['repeat_password']);
		$repeat_password = mysqli_real_escape_string($connect, $repeat_password);
		// проверка на регулярки и соответсвие password и repeat_password; 
		
		$query = "
			SELECT count(*) AS `count`
			FROM `users`
			WHERE `user_email` = '$email';
		";
		$result = mysqli_query($connect, $query); 
		$count = mysqli_fetch_assoc($result)['count'];
		if (!$count) {
			$hashed_password = md5($password);
			$query = "
				INSERT INTO `users`
					SET `user_email` = '$email', 
						`user_password` = '$hashed_password';
			";
			mysqli_query($connect, $query);
			session_start();
			$user_id = mysqli_insert_id($connect);
			$session_id = session_id();
			$token = generateToken();
			$token_time = time() + 15*60; 
			$query = "
				INSERT INTO `connects`
					SET `connect_token` = '$token', 
						`connect_session` = '$session_id',
						`connect_user_id` = $user_id,
						`connect_token_time` = FROM_UNIXTIME($token_time);
			";
			mysqli_query($connect, $query);
			setcookie('uid', $user_id, time() + 30*24*60*60);
			setcookie('ut', $token, time() + 30*24*60*60);
			header('Location: ./books.php');
		}
	}
	
	view('./templates/form/register');


?>