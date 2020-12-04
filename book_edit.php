<?php
	
	include_once('functions.php');
	$is_admin = isAdmin(); 
	if ($is_admin) {
		if (isset($_GET['id'])) {
			
			$book_id = htmlentities($_GET['id']);
			
			$connect = connect();
			
			if (isset($_POST['name'])) {
				
				$book_name = htmlentities($_POST['name']);
				$book_name = mysqli_real_escape_string($connect, $book_name);
				
				$publisher = $_POST['publisher'];
				$new_authors_ids = $_POST['author'];
				/*
				$query = "
					UPDATE `books`
						SET `book_name` = , 
						`book_publisher_id` = ''
				";
				*/
				
				$query = "
					SELECT GROUP_CONCAT(`book_author_author_id`) AS `authors_ids`
					FROM `books_authors`
					WHERE `book_author_book_id` = $book_id
					GROUP BY `book_author_book_id`
				";
				$result = mysqli_query($connect, $query);
				$old_authors_ids = explode(',', mysqli_fetch_assoc($result)['authors_ids']);
				
				if ($old_authors_ids != $new_authors_ids) {
					foreach ($new_authors_ids as $author_id) {
						if (!in_array($author_id, $old_authors_ids)) {
							$query = "
								INSERT INTO `books_authors`
									SET `book_author_author_id` = $author_id,
										`book_author_book_id` = $book_id;
							";
							mysqli_query($connect, $query);
						}
					}
					foreach ($old_authors_ids as $author_id) {
						if (!in_array($author_id, $new_authors_ids)) {
							$query = "
								DELETE FROM `books_authors`
									WHERE `book_author_book_id` = $book_id AND
										  `book_author_author_id` = $author_id
							";
							mysqli_query($connect, $query);
						}
					}
				}
				header('Location: ./books.php');
			}
			
			$query = "
				SELECT `book_id`, `book_name`, `book_publisher_id`, `book_price`, `book_pages`, `book_count`, `book_description`, `book_coverage`, `book_year`, `book_language_id`, `book_restriction_id`, GROUP_CONCAT(DISTINCT `author_id`) AS `authors_ids`, GROUP_CONCAT(DISTINCT `genre_id`) AS `genres_ids`, `book_isbn` 
				FROM `books`
				LEFT JOIN `books_genres` ON `book_genre_book_id` = `book_id`
				LEFT JOIN `genres` ON `book_genre_genre_id` = `genre_id`
				LEFT JOIN `books_authors` ON `book_author_book_id` = `book_id`
				LEFT JOIN `authors` ON `book_author_author_id` = `author_id`
				GROUP BY `book_id`
			";
			
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
			mysqli_close($connect);
			view('./templates/form/book', compact('book_info', 'publishers', 'authors'));
			
		
		}
	
	} else {
		echo 'У вас недостаточно прав для отображения данных!';
	}
	

?>