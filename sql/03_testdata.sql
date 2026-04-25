-- Part 3 - Data Insertion

-- (Important for Part 7)
ALTER TABLE borrowing
ALTER COLUMN borrow_id
ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE authors
ALTER COLUMN author_id
ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE books
ALTER COLUMN book_id
ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE members
ALTER COLUMN member_id
ADD GENERATED ALWAYS AS IDENTITY;

-- 5 authors (footballers from the winning teams of the last 5 European Championships)
INSERT INTO Authors (country, first_name, last_name) VALUES ('Spain', 'Pedro', 'González López');
INSERT INTO Authors (country, first_name, last_name) VALUES ('Italy', 'Lorenzo', 'Insigne');
INSERT INTO Authors (country, first_name, last_name) VALUES ('Portugal', 'Cristiano', 'Ronaldo');
INSERT INTO Authors (country, first_name, last_name) VALUES ('Spain', 'David', 'Villa');
INSERT INTO Authors (country, first_name, last_name) VALUES ('Spain', 'Xavier', 'Hernández');

-- 10 books (based on the last 10 World Cup finals, with book-like titles and varied genres)
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Thriller', 2022, 'Der Wahn der Welt gegen Kylian', 1);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Mystery', 2018, 'Das Rätsel des Goldenen Balls', 2);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Romance', 2014, 'Liebe im Strafraum', 3);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Sci-Fi', 2010, 'Die Zukunft des Fußballs', 4);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Adventure', 2006, 'Abenteuer in Berlin', 5);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Drama', 2002, 'Das Herz des Spiels', 1);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Fantasy', 1998, 'Zauberhafte Triumphe', 2);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Horror', 1994, 'Der Fluch des Pokals', 3);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Comedy', 1990, 'Lachende Helden', 4);
INSERT INTO Books (genre, publication_year, title, author_id) VALUES ('Historical Fiction', 1986, 'Die Legende von Maradona', 5);

-- 6 members (famous world stars with some controversy)
INSERT INTO Members (email, join_date, first_name, last_name) VALUES ('controversial@politics.us', '2025-01-01', 'Donald', 'Duck');
INSERT INTO Members (email, join_date, first_name, last_name) VALUES ('billionaire@tesla.com', '2025-02-01', 'Elon', 'John');
INSERT INTO Members (email, join_date, first_name, last_name) VALUES ('reality@tv.net', '2025-03-01', 'Cimberly', 'Cardascam');
INSERT INTO Members (email, join_date, first_name, last_name) VALUES ('popstar@music.ca', '2025-04-01', 'Just', 'Onebieber');
INSERT INTO Members (email, join_date, first_name, last_name) VALUES ('singer@songs.us', '2025-05-01', 'Taylor', 'Whirlwind');
INSERT INTO Members (email, join_date, first_name, last_name) VALUES ('rapper@shoes.com', '2025-06-01', 'Kanye', 'Kanye');

-- 12 borrowing records
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES ('2026-01-20', '2026-01-10', 7, 1, FALSE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-02-01', 7, 2, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-02-05', 5, 4, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-02-10', 1, 5, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-02-15', 10, 6, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES ('2026-01-15', '2026-01-05', 1, 3, FALSE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-03-01', 2, 3, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES ('2026-01-25', '2026-01-12', 2, 5, FALSE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-03-10', 3, 5, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-03-15', 9, 1, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES (NULL, '2026-03-18', 4, 6, TRUE);
INSERT INTO Borrowing (return_date, borrow_date, book_id, member_id, borrow_status) VALUES ('2026-03-01', '2026-02-20', 10, 2, FALSE);
