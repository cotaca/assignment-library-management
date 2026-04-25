-- -- Part 6 - Functions
--
-- Function 1: IsBookAvailable

CREATE FUNCTION IsBookAvailable(
    input_book_id INT
) RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    result BOOLEAN;
BEGIN
    SELECT NOT EXISTS (
        SELECT 1
        FROM borrowing
        WHERE book_id = new_book_id
        AND borrow_status = TRUE
    )
    INTO result;

    RETURN result;
END;
$$;

-- Function 2: BorrowDuration

CREATE FUNCTION BorrowDuration(
    new_borrow_id INT
) RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    days_loaned INT;
BEGIN
    SELECT COALESCE(return_date, CURRENT_DATE) - borrow_date
    INTO days_loaned
    FROM borrowing
    WHERE borrow_id = input_borrow_id;

    RETURN days_loaned;
END;
$$;