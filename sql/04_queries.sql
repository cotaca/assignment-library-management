-- Part 4 - SQL Queries

-- Task 1
SELECT Books.*, Authors.first_name, Authors.last_name
FROM Books
JOIN Authors ON Books.author_id = Authors.author_id;

-- Task 2
SELECT Members.*
FROM Members
LEFT JOIN Borrowing ON Members.member_id = Borrowing.member_id
    GROUP BY Members.member_id
    HAVING count(*) > 3;

-- Task 3
SELECT Books.*
FROM Books
FULL JOIN Borrowing ON Books.book_id = Borrowings.book_id
    WHERE Borrowings.book_id IS NULL;

-- Task 4
SELECT Books.genre, COUNT(Borrowings.borrow_id)
FROM Books
RIGHT JOIN Borrowing ON Books.book_id = Borrowings.book_id
    GROUP BY Books.genre;