-- Part 3 - Data Insertion

-- 5 authors
INSERT INTO Authors (author_id, last_name, first_name, country)
VALUES
    (1, 'Rowling', 'J. Kennedy', 'England'),
    (2, 'Doylch', 'Arfur Conan', 'Türkei'),
    (3, 'Paffpuff', 'Sebastian', 'Deutschland'),
    (4, 'Circ', 'Sharlie', 'USA'),
    (5, 'Ronaltor', 'Christian', 'Portugal');

-- 10 books
INSERT INTO Books (book_id, title, genre, author_id)
VALUES
    (101, 'Harald Gehstock 1: Der Held der Steine', 'Science-Fiction', 1),
    (102, 'Harald Gehstock 2: Der Escape-Room von Andromeda', 'Science-Fiction', 1),
    (103, 'Harald Gehstock 3: Der Gefangene vom Heinz-Krügel-Platz', 'Science-Fiction', 1),
    (104, 'Her Lock''s Home', 'Mystery', 2),
    (105, 'E. Watson, the helper behind', 'Biography', 2),
    (106, 'T''ain''t what you do, it''s the way that you do it', 'Roman', 3),
    (107, 'How to: Urheberrechtsverletzung entgehen', 'Roman', 3),
    (108, 'Kartoffel Ranking, mit Florian Wirtz', 'Comic', 3),
    (109, 'Die besten Kirchenlieder', 'Comedy', 4),
    (110, 'SIUUUUU', 'Biografie', 5);

-- 6 members
INSERT INTO Members (member_id, last_name, first_name, email)
VALUES
    (1, 'Rump', 'Ronald', 'Ronald-important@war.usa'),
    (2, 'Elefantilo', 'Gschianni', 'MoreMoneyThan@footbal.dollar'),
    (3, 'Pitty', 'Sean Shawn', 'WhereAreYou@outlook.net'),
    (4, 'Tusk', 'Eloan', 'ILoveMyself@tesla.com'),
    (5, 'Thunfisch', 'Angela', 'HowDareYou@unicef.com'),
    (6, 'Giung-jun', 'Lim', 'FindMe@small.pp');

-- 12 borrowing records
INSERT INTO Borrowing (borrow_id, borrow_date, return_date, member_id, book_id, borrow_status)
VALUES
    (1, '2026-01-10', '2026-01-20', 1, 107, FALSE), -- Zurückgegeben
    (2, '2026-02-01', NULL,         2, 107, TRUE), -- Aktiv
    (3, '2026-02-05', NULL,         4, 105, TRUE), -- Aktiv
    (4, '2026-02-10', NULL,         5, 101, TRUE), -- Aktiv
    (5, '2026-02-15', NULL,         6, 110, TRUE), -- Aktiv
    (6, '2026-01-05', '2026-01-15', 3, 101, FALSE), -- Zurückgegeben
    (7, '2026-03-01', NULL,         3, 102, TRUE), -- Aktiv
    (8, '2026-01-12', '2026-01-25', 5, 102, FALSE), -- Zurückgegeben
    (9, '2026-03-10', NULL,         5, 103, TRUE), -- Aktiv
    (10, '2026-03-15', NULL,        1, 109, TRUE), -- Aktiv
    (11, '2026-03-18', NULL,        6, 104, TRUE), -- Aktiv
    (12, '2026-02-20', '2026-03-01', 2, 110, FALSE);-- Zurückgegeben