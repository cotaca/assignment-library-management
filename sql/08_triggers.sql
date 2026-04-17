-- Part 8 - Triggers (Updated)

-- Task 1:
CREATE FUNCTION checkOverBorrowing() RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
    BEGIN
        IF NOT isbookavailable(NEW.book_id) THEN
            RAISE EXCEPTION 'Buch nicht verfügbar';
        END IF;

        RETURN NEW;
    END;
$$;

CREATE TRIGGER preventOverBorrowing
BEFORE INSERT ON borrowing
FOR EACH ROW
EXECUTE FUNCTION checkOverBorrowing();

-- Task 2:
ALTER TABLE borrowing
    ADD COLUMN trans_ref TEXT;

CREATE FUNCTION checkHandleBookReturn() RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
    BEGIN
        IF OLD.return_date IS NULL AND NEW.return_date IS NOT NULL THEN
            IF NOT NEW.return_date >= NEW.borrow_date THEN
                RAISE EXCEPTION 'Macht keinen Sinn';
            ELSE
                UPDATE borrowing SET trans_ref = borrow_date + member_id WHERE borrow_id = NEW.borrow_id;
            END IF;
        END IF;
    END;
$$;

CREATE TRIGGER handleBookReturn
AFTER UPDATE ON borrowing
FOR EACH ROW
EXECUTE FUNCTION checkHandleBookReturn();