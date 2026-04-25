-- Part 7 - Stored Procedures

DROP PROCEDURE BorrowBook(INTEGER, INTEGER, TEXT);

CREATE PROCEDURE BorrowBook(
    memberId INT,
    bookId INT,
    OUT result TEXT
)
    LANGUAGE plpgsql
    AS $$
    BEGIN
        INSERT INTO Borrowing (
            borrow_date,
            return_date,
            member_id,
            book_id,
            borrow_status
        ) VALUES (
            CURRENT_DATE,
            CURRENT_DATE + 67,
            memberId,
            bookId,
            TRUE
        );

        result := 'Book borrowed successfully';

    EXCEPTION WHEN OTHERS THEN
        result := 'Error: 404' || SQLERRM;

    END;
    $$;

CALL BorrowBook(1, 3, NULL);