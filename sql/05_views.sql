-- Part 5 - Views

-- View 1: Active Loans
CREATE VIEW CurrentBorrowings AS
    SELECT
        m.last_name AS m_first_name,
        m.first_name AS m_last_name,
        books.title AS b_title,
        bw.borrow_date AS loan_date,
        (CURRENT_DATE - bw.borrow_date) AS days_on_loan
    FROM
        Members m
    JOIN Borrowing bw ON m.member_id = bw.member_id
    JOIN Books books ON bw.book_id = books.book_id
    WHERE
        bw.borrow_status = TRUE;

-- View 2: Book Popularity
CREATE VIEW popularBooks AS
    SELECT
        books.title AS b_title,
        COUNT(*) AS total_loans
    FROM
        Borrowing bw
    JOIN Books books ON bw.book_id = books.book_id
    GROUP BY
        books.title;
