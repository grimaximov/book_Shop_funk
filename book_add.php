<?php
	
	include_once('functions.php');
	
	$connect = connect();
	
	if (isset($_POST['name'])) {
	
		$book_name = htmlentities($_POST['name']);
		$book_name = mysqli_real_escape_string($connect, $book_name);
		$new_authors_ids = $_POST['author'];
		
		/* $query = "
				INSERT INTO `books`
					SET `book_name` = , 
					`book_publisher_id` = ''
			";
		mysqli_query($connect, $query);*/
		$book_id = mysqli_last_insert_id();
		
		foreach ($new_authors_ids as $author_id) {
			$query = "
				INSERT INTO `books_authors`
					SET `book_author_author_id` = $author_id, 
					`book_author_book_id` = $book_id; 
			";
			mysqli_query($connect, $query);
			
		}
	}
	$result = mysqli_query($connect, $query);
	$book_info = mysqli_fetch_assoc($result);
	$query = "
		SELECT * 
		FROM `publishers`;
	";
	$result = mysqli_query($connect, $query);
	$publishers = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$query = "
		SELECT * 
		FROM `authors`;
	";
	$result = mysqli_query($connect, $query);
	$authors = mysqli_fetch_all($result, MYSQLI_ASSOC);
	/* echo '<pre>';
	print_r($book_info);
	echo '</pre>'; */
	mysqli_close($connect);
	view('./templates/form/book', compact('publishers', 'authors'));

?>