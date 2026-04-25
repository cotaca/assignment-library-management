-- Part 9 - Bonus:

-- Schema Refactoring
ALTER TABLE books
DROP COLUMN author_id;

CREATE TABLE Book_Authors (
    author_id INT,
    book_id INT,
    role_text TEXT,
    PRIMARY KEY (author_id, book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Testdata
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES (1, 1, 'Author');
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES (1, 2, 'Co-Author');
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES (1, 3, 'Co-Author');
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES (2, 2, 'Author');
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES (3, 2, 'Author');
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES (4, 4, 'Author');
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES (4, 5, 'Editor');

-- Books; multiple authors
SELECT Books.*
FROM Books
JOIN Book_Authors ON Books.book_id = Book_Authors.book_id
GROUP BY Books.book_id
HAVING COUNT(Book_Authors.author_id) > 1;

-- Author; most collaborations
SELECT Authors.last_name, COUNT(Book_Authors.book_id) AS collaborations_count
FROM Authors
JOIN Book_Authors ON Authors.author_id = Book_Authors.author_id
GROUP BY Authors.author_id, Authors.last_name
ORDER BY collaborations_count DESC
LIMIT 1;

-- View: BookAuthorDetails
CREATE VIEW BookAuthorDetails AS
SELECT Books.title, Authors.last_name, Authors.first_name, Book_Authors.role_text
FROM Books
JOIN Book_Authors ON Books.book_id = Book_Authors.book_id
JOIN Authors ON Book_Authors.author_id = Authors.author_id;