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

-- 5 authors
INSERT INTO Authors (last_name, first_name, country)
VALUES
    ( 'Rowling', 'J. Kennedy', 'England'),
    ( 'Doylch', 'Arfur Conan', 'Türkei'),
    ( 'Paffpuff', 'Sebastian', 'Deutschland'),
    ( 'Circ', 'Sharlie', 'USA'),
    ( 'Ronaltor', 'Christian', 'Portugal');

-- 10 books
INSERT INTO Books (title, genre, author_id)
VALUES
    ( 'Harald Gehstock 1: Der Held der Steine', 'Science-Fiction', 1),
    ( 'Harald Gehstock 2: Der Escape-Room von Andromeda', 'Science-Fiction', 1),
    ( 'Harald Gehstock 3: Der Gefangene vom Heinz-Krügel-Platz', 'Science-Fiction', 1),
    ( 'Her Lock''s Home', 'Mystery', 2),
    ( 'E. Watson, the helper behind', 'Biography', 2),
    ( 'T''ain''t what you do, it''s the way that you do it', 'Roman', 3),
    ( 'How to: Urheberrechtsverletzung entgehen', 'Roman', 3),
    ( 'Kartoffel Ranking, mit Florian Wirtz', 'Comic', 3),
    ( 'Die besten Kirchenlieder', 'Comedy', 4),
    ( 'SIUUUUU', 'Biografie', 5);

-- 6 members
INSERT INTO Members (last_name, first_name, email)
VALUES
    ( 'Rump', 'Ronald', 'Ronald-important@war.usa'),
    ( 'Elefantilo', 'Gschianni', 'MoreMoneyThan@footbal.dollar'),
    ( 'Pitty', 'Sean Shawn', 'WhereAreYou@outlook.net'),
    ( 'Tusk', 'Eloan', 'ILoveMyself@tesla.com'),
    ( 'Thunfisch', 'Angela', 'HowDareYou@unicef.com'),
    ( 'Giung-jun', 'Lim', 'FindMe@small.pp');

-- 12 borrowing records
INSERT INTO Borrowing (borrow_date, return_date, member_id, book_id, borrow_status)
VALUES
    ( '2026-01-10', '2026-01-20', 1, 7, FALSE), -- Zurückgegeben
    ( '2026-02-01', NULL,         2, 7, TRUE), -- Aktiv
    ( '2026-02-05', NULL,         4, 5, TRUE), -- Aktiv
    ( '2026-02-10', NULL,         5, 1, TRUE), -- Aktiv
    ( '2026-02-15', NULL,         6, 10, TRUE), -- Aktiv
    ( '2026-01-05', '2026-01-15', 3, 1, FALSE), -- Zurückgegeben
    ( '2026-03-01', NULL,         3, 2, TRUE), -- Aktiv
    ( '2026-01-12', '2026-01-25', 5, 2, FALSE), -- Zurückgegeben
    ( '2026-03-10', NULL,         5, 3, TRUE), -- Aktiv
    ( '2026-03-15', NULL,        1, 9, TRUE), -- Aktiv
    ( '2026-03-18', NULL,        6, 4, TRUE), -- Aktiv
    ( '2026-02-20', '2026-03-01', 2, 10, FALSE); -- Zurückgegeben

