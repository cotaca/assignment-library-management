-- Part 9 - Bonus:

-- Schema Refactoring
ALTER TABLE books
DROP COLUMN author_id;

-- New Associative Table
CREATE TABLE Book_Authors (
    book_id INT,
    author_id INT,
    role_text TEXT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Testdata
INSERT INTO Book_Authors (book_id, author_id, role_text) VALUES
-- Buch 1 hat zwei Autoren (Kollaboration)
(1, 1, 'Main Author'),
(1, 2, 'Co-Author'),
(1, 3, 'Co-Author'),

-- Autor 3 hat zwei verschiedene Bücher geschrieben
(2, 3, 'Main Author'),
(3, 3, 'Main Author'),

-- Ein Buch mit einem speziellen Mitwirkenden
(4, 4, 'Author'),
(4, 5, 'Editor');

-- Query: Books with multiple authors
SELECT b.*
FROM books b
JOIN Book_Authors ba ON b.book_id = ba.book_id
GROUP BY b.book_id
HAVING COUNT(ba.author_id) > 1;

-- Query: Author with the most collaborations
SELECT a.last_name, COUNT(ba.book_id) AS collaboration_count
FROM authors a
JOIN Book_Authors ba ON a.author_id = ba.author_id
GROUP BY a.author_id, a.last_name
ORDER BY collaboration_count DESC
LIMIT 1;

-- View: BookAuthorDetails
CREATE VIEW BookAuthorDetails AS
SELECT b.title, a.last_name, a.first_name, ba.role_text
FROM books b
JOIN Book_Authors ba ON b.book_id = ba.book_id
JOIN Authors a ON ba.author_id = a.author_id;