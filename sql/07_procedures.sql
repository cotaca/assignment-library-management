-- Part 7 - Stored Procedures

CREATE PROCEDURE BorrowBook(member_id INT, book_id INT)
BEGIN
    START TRANSACTION

        INSERT INTO Borrowing (borrow_id, borrow_date, return_date, member_id, book_id, borrow_status)
        -- ab hier DEFINITIV einfach nur hingerotzt
        VALUES (borrow_counter_seq, CURRENT_DATE, CURRENT_DATE+7, member_id, book_id, ACTIVE)

    COMMIT;
END;