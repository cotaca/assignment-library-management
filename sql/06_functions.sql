-- -- Part 6 - Functions
--
-- Function 1: IsBookAvailable(book_id)
-- Returns:
-- • TRUE if available copies exist
-- • FALSE otherwise

-- Ich war mal so frei und habe das Beispiel aus dem Vorlesungssatz genommen

CREATE FUNCTION IsBookAvailable(searched_book_id INT) RETURNS BOOLEAN
BEGIN
    DECLARE is_available BOOLEAN;

    SELECT NOT borrow_status INTO is_available
    FROM borrowing
    WHERE book_id = searched_book_id
    LIMIT 1;

    RETURN is_available;
END;


-- Function 2: BorrowDuration(borrow_id)
-- Returns number of days between borrow and return (or today).

CREATE FUNCTION BorrowDuration(searched_borrow_id INT)
BEGIN
    DECLARE days INT;

    SELECT return_date - borrow_date into days  -- Man müsste noch schauen, dass man unterscheidet zwischen aktuell geliehenen oder abgeschlossenen Leihen
    FROM borrowing
    WHERE borrow_id = searched_borrow_id;

    RETURN days;
END;