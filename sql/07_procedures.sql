-- Part 7 - Stored Procedures

DROP PROCEDURE BorrowBook(in_member_id INTEGER, in_book_id INTEGER, result TEXT);

CREATE PROCEDURE BorrowBook(
    IN in_member_id INT,
    IN in_book_id INT,
    OUT result TEXT
)
LANGUAGE plpgsql
AS $$
    BEGIN
        INSERT INTO Borrowing (borrow_date, return_date, member_id, book_id, borrow_status)
        VALUES (CURRENT_DATE, CURRENT_DATE+7, in_member_id, in_book_id, TRUE);

        result := 'Success';

    EXCEPTION WHEN OTHERS THEN
        result := 'Failure: ' || SQLERRM;

    END;
$$;

CALL BorrowBook(1, 3, NULL);