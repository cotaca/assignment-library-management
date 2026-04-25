-- Part 1 - SQL Table Creation & Constraints


DROP TABLE Borrowing;
DROP TABLE Members;
DROP TABLE Books;
DROP TABLE Authors;

-- Task 1.
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    country TEXT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    genre TEXT,
    published_year INT CHECK (published_year > 1500),
    title TEXT NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    email TEXT UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE Borrowing (
    borrow_id INT PRIMARY KEY,
    return_date DATE,
    borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
    book_id INT,
    member_id INT,
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