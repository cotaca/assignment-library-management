-- Part 1 - SQL Table Creation & Constraints


DROP TABLE Borrowing CASCADE ;
DROP TABLE Members CASCADE ;
DROP TABLE Books CASCADE ;
DROP TABLE authors CASCADE ;

-- Task 1.
CREATE TABLE Authors (
                         author_id INT PRIMARY KEY,
                         last_name TEXT NOT NULL,
                         first_name TEXT NOT NULL,
                         country TEXT
);

CREATE TABLE Books (
                       book_id INT PRIMARY KEY,
                       title TEXT NOT NULL,
                       genre TEXT,
                       author_id INT,
                       FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
                         member_id INT PRIMARY KEY,
                         last_name TEXT NOT NULL,
                         first_name TEXT NOT NULL,
                         email TEXT UNIQUE,
                         join_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Borrowing (
                           borrow_id INT PRIMARY KEY,
                           borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
                           return_date DATE,
                           member_id INT,
                           book_id INT,
                           FOREIGN KEY (member_id) REFERENCES Members(member_id),
                           FOREIGN KEY (book_id) REFERENCES Books(book_id),
                           CHECK (return_date >= borrow_date)
);

-- Task 2.
CREATE INDEX idx_title
    ON Books(title);

CREATE INDEX idx_email
    ON Members(email);

-- Task 3.
ALTER TABLE Members
    ADD CONSTRAINT chk_email_length CHECK(LENGTH(email) < 64);

ALTER TABLE Borrowing
    ADD COLUMN borrow_status BOOLEAN NOT NULL;