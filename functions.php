<?php

	function view($template, $data = []) {
		extract($data);
		
		if (file_exists($template . '.html')) {
			include_once($template . '.html'); 
		}
		
	
	}
	
	function connect() {
		$connect = mysqli_connect('localhost', 'root', '', 'book_shop');
		mysqli_set_charset($connect, 'utf8');
		return $connect;
	}

	function isAdmin() {
		$is_admin = false;
		if (isset($_COOKIE['uid'])) {
			$user_id = $_COOKIE['uid'];
			$token = $_COOKIE['ut'];
			$session_id = $_COOKIE['PHPSESSID'];
			
			$connect = connect();
			
			$query = "
				SELECT UNIX_TIMESTAMP(`connect_token_time`) AS `token_time`, `connect_id`
				FROM `connects`
				WHERE `connect_token` = '$token' AND
					  `connect_user_id` = $user_id;
			";
			$result = mysqli_query($connect, $query);
			$connect_info =  mysqli_fetch_assoc($result);
			
			if ($connect_info) {
				$query = "
					SELECT `user_role_id`
					FROM `users`
					WHERE `user_id` = $user_id;
				";
				$result = mysqli_query($connect, $query);
				$role_id = mysqli_fetch_assoc($result)['user_role_id'];
				if ($role_id == 1) {
					$is_admin = true;
				}
				
				if ($connect_info['token_time'] < time()) {
					$new_token = generateToken();
					setcookie('ut', $new_token, time() + 30*24*60*60);
					$new_token_time = time() + 15*60;
					$connect_id = $connect_info['connect_id'];
					$query = "
						UPDATE `connects`
							SET `connect_token` = '$new_token', 
								`connect_token_time` = FROM_UNIXTIME($new_token_time)
							WHERE `connect_id` = $connect_id; 
					";
					mysqli_query($connect, $query);
				}
			}
		}
		return $is_admin;
	}
	
	function generateToken($size = 32) {
	
		$symbols = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e'];
		$symbols_length = count($symbols);
		$token = '';
		for ($i = 0; $i < $size; $i++ ) {
			$token .= $symbols[rand(0, $symbols_length - 1)];
		}
		return $token;
	
	}
?>