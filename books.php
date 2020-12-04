<?php

	include_once('functions.php');
	$connect = connect();
	$is_admin = isAdmin();
	if (isset($_GET['page'])) {
		$page = $_GET['page'];
	} else {
		$page = 1;
	}
	$books_count = 3;
	$offset = ($page - 1) * $books_count;
	$query = "
		SELECT SQL_CALC_FOUND_ROWS 
		`book_id`, `book_name`, `publisher_name`, `book_price`, `book_pages`, `book_count`, `book_description`, `book_coverage`, `book_year`, `language_name`, `restriction_name`, GROUP_CONCAT(DISTINCT `author_name`), GROUP_CONCAT(DISTINCT `genre_name`), `book_isbn` 
		FROM `books`
		LEFT JOIN `publishers` ON `publisher_id` = `book_publisher_id`
		LEFT JOIN `languages` ON `language_id` = `book_language_id`
		LEFT JOIN `restrictions` ON `restriction_id` = `book_restriction_id`
		LEFT JOIN `books_genres` ON `book_genre_book_id` = `book_id`
		LEFT JOIN `genres` ON `book_genre_genre_id` = `genre_id`
		LEFT JOIN `books_authors` ON `book_author_book_id` = `book_id`
		LEFT JOIN `authors` ON `book_author_author_id` = `author_id`
		GROUP BY `book_id`
		ORDER BY `book_id` ASC
		LIMIT $offset, $books_count;
	";
	$result = mysqli_query($connect, $query);
	$books = mysqli_fetch_all($result, MYSQLI_ASSOC);
	$query = "
		SELECT FOUND_ROWS() AS `count`;
	";
	$result = mysqli_query($connect, $query);
	$all_books_count = mysqli_fetch_assoc($result)['count'];
	$pages_count = ceil($all_books_count / $books_count);
	mysqli_close($connect);
	
	$heads = array('ID', 'Название', 'Издатель', 'Цена', 'Количество страниц', 'Количество', 'Описание', 'Иконка', 'Год', 'Язык', 'Ограничение', 'Автор', 'Жанр', 'ISBN');
	$rows = $books;
	$name = 'book';
	if ($is_admin) {
		view('./templates/buttons/add', compact('name'));
	}
	/* echo '<pre>';
	print_r($_SERVER);
	echo '</pre>'; */
	view('./templates/table/thead', compact('heads', 'is_admin'));
	view('./templates/table/tbody', compact('rows', 'name', 'is_admin'));
	view('./templates/page/pagination', compact('pages_count'));


?>