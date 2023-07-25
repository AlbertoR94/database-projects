USE bookstore;

SELECT book_ISBN, book_title, SUM(count) AS total_count
FROM shopping_basket_has_book as SB
LEFT JOIN book AS B
	ON SB.book_ISBN = B.ISBN
GROUP BY book_ISBN, book_title
ORDER BY total_count DESC
LIMIT 1;

SELECT C.customer_email, C.customer_name, SUM(SBHB.count) AS total_books
FROM shopping_basket_has_book AS SBHB
LEFT JOIN shopping_basket AS SB
	ON SBHB.basket_id = SB.basket_id
LEFT JOIN customer as C
	ON SB.customer_email = C.customer_email
GROUP BY C.customer_email, C.customer_name
ORDER BY total_books DESC
LIMIT 1;

SELECT W.warehouse_id, W.warehouse_address, B.book_title
FROM stores AS S
LEFT JOIN warehouse AS W
	ON S.warehouse_id = W.warehouse_id
LEFT JOIN book AS B
	ON S.book_ISBN = B.ISBN
WHERE B.book_title = 'Texas Glory';

SELECT A.author_name, COUNT(B.book_title) AS total_books
FROM book AS B
INNER JOIN author AS A
	ON B.author_id = A.author_id
GROUP BY A.author_name
ORDER BY total_books DESC
LIMIT 1;

SELECT P.publisher_name, COUNT(B.book_title) AS total_books
FROM book AS B
INNER JOIN publisher AS P
	ON B.publisher_id = P.publisher_id
GROUP BY P.publisher_name
ORDER BY total_books ASC
LIMIT 1;




