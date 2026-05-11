-- Part 5 - Views

-- View 1: CurrentBorrowings
CREATE VIEW currentBorrowings AS
SELECT m.last_name AS member_last_name, m.first_name AS member_first_name, b.title, bw.borrow_date, (CURRENT_DATE - bw.borrow_date) AS days_borrowed
FROM Books b
JOIN Borrowing bw
ON b.book_id = bw.book_id
JOIN Members m
ON bw.member_id = m.member_id
WHERE bw.borrow_status = TRUE;

-- View 2: PopularBooks
CREATE VIEW popularBooks AS
SELECT b.title, COUNT(*) AS borrowing_count
FROM Borrowing bw
JOIN Books b
ON b.book_id = bw.book_id
GROUP BY b.title;