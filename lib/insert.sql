INSERT INTO series (title, author_id, subgenre_id)
VALUES  ('A Game of Thrones', 1, 1),
        ('A Clash of Kings', 2, 2);
        
INSERT INTO books (title, year, author_id, series_id)
VALUES  ('A Game of Thrones', 1996, 1, 1),
        ('A Game of Thrones', 1996, 1, 1),
        ('A Game of Thrones', 1996, 1, 1),
        ('A Game of Thrones', 1996, 1, 1),
        ('A Game of Thrones', 1996, 1, 1),
        ('A Game of Thrones', 1996, 1, 1);

INSERT INTO characters (name, motto, species, author_id, series_id)
VALUES  ("JOE", "dont know", "human", 1, 1),
        ("JOE", "dont know", "human", 1, 1),
        ("JOE", "dont know", "human", 1, 1),
        ("JOE", "dont know", "human", 1, 1),
        ("JOE", "dont know", "human", 1, 1),
        ("JOE", "dont know", "human", 1, 1),
        ("JOE", "dont know", "human", 1, 1),
        ("JOE", "dont know", "human", 1, 1);

INSERT INTO subgenres(name)
VALUES  ("name"),
        ("name");

INSERT INTO authors(name)
VALUES  ("name"),
        ("name");

INSERT INTO character_book(book_id, character_id)
VALUES  (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2),
        (1, 2);
