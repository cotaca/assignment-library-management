-- Part 8 - Triggers (Updated)

-- Task 1:
CREATE TRIGGER preventOverBorrowing
BEFORE INSERT ON borrowing
FOR EACH ROW
EXECUTE FUNCTION checkOverBorrowing();

CREATE FUNCTION checkOverBorrowing()
RETURNS TRIGGER AS $$
    BEGIN
        IF NOT isbookavailable(NEW.book_id) THEN
            RAISE EXCEPTION 'Buch nicht verfügbar';
        END IF;
    END;
$$ LANGUAGE plpgsql;

-- Task 2:
ALTER TABLE borrowing
    ADD COLUMN trans_ref TEXT;

CREATE TRIGGER handleBookReturn
    AFTER UPDATE ON borrowing
    FOR EACH ROW
EXECUTE FUNCTION checkHandleBookReturn();

CREATE FUNCTION checkHandleBookReturn()
    RETURNS TRIGGER AS $$
BEGIN
    IF NOT NEW.return_date >= NEW.borrow_date THEN
        RAISE EXCEPTION 'Macht keinen Sinn';
    ELSE
        UPDATE borrowing SET trans_ref = borrow_date + member_id WHERE borrow_id = NEW.borrow_id; -- borrow_date + member_id muss noch gecastet werden
    END IF;
END;
$$ LANGUAGE plpgsql;