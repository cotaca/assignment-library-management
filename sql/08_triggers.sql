-- Part 8 - Triggers (Updated)

-- Task 1: Prevent over-borrowing
CREATE FUNCTION checkOverBorrowing() RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT isbookavailable(NEW.book_id) THEN
        RAISE EXCEPTION 'Book is already loaned';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER preventOverBorrowing
BEFORE INSERT ON Borrowing
FOR EACH ROW
EXECUTE FUNCTION checkOverBorrowing();

-- Task 2: Handle book returns with reference generation
ALTER TABLE borrowing ADD COLUMN reference TEXT;

CREATE FUNCTION checkHandleBookReturn() RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF (OLD.return_date IS NULL AND NEW.return_date IS NOT NULL) THEN
        IF (NEW.return_date >= NEW.borrow_date) THEN
            UPDATE borrowing
            SET reference = borrow_date + member_id
            WHERE borrow_id = NEW.borrow_id;
        ELSE
            RAISE EXCEPTION 'Return date cannot be before borrow date';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER handleBookReturn
AFTER UPDATE ON borrowing
FOR EACH ROW
EXECUTE FUNCTION checkHandleBookReturn();
