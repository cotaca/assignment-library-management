-- -- Part 6 - Functions
--
-- Function 1: IsBookAvailable(book_id)
-- Returns:
-- • TRUE if available copies exist
-- • FALSE otherwise

CREATE FUNCTION IsBookAvailable(searched_book_id INT) RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
    DECLARE is_available BOOLEAN;
    BEGIN

        SELECT NOT EXISTS (
            SELECT 1
            FROM borrowing
            WHERE book_id = searched_book_id
              AND borrow_status = TRUE
        )
        INTO is_available;

        RETURN is_available;
    END;
$$;

-- Function 2: BorrowDuration(borrow_id)
-- Returns number of days between borrow and return (or today).

CREATE FUNCTION BorrowDuration(searched_borrow_id INT) RETURNS INT
LANGUAGE plpgsql
AS $$
    DECLARE days INT;
    BEGIN
        SELECT COALESCE(return_date, CURRENT_DATE) - borrow_date into days
        FROM borrowing
        WHERE borrow_id = searched_borrow_id;

        RETURN days;
    END;
$$;