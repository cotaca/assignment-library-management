-- Part 4 - SQL Queries

-- Task 1 - List all books with their author names
SELECT b.*, a.first_name, a.last_name
FROM Books b
JOIN Authors a
ON b.author_id = a.author_id;

-- Task 2 - List members who borrowed more than 3 books
-- SELECT m.*
-- FROM members m
--          LEFT JOIN borrowing b ON m.member_id = b.member_id
-- GROUP BY b.book_id
-- HAVING count(*) > 3;

-- Task 3 - Find books never borrowed
-- SELECT b.*
-- FROM Books b
-- FULL JOIN Borrowing bw ON b.book_id = bw.book_id
-- WHERE bw.book_id = NULL;

-- Task 4 - Count borrowings per genre
SELECT b.genre, COUNT(bw.borrow_id)
FROM Books b
RIGHT JOIN Borrowing bw
ON b.book_id = bw.book_id
GROUP BY b.genre;