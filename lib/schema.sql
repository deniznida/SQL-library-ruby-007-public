CREATE TABLE series(
  id INTEGER Primary key autoincrement,
  title text,
  author_id INTEGER References authors(id),
  subgenre_id INTEGER References subgenres(id)
);

CREATE TABLE subgenres(
  id INTEGER Primary key autoincrement, 
  name TEXT
);

CREATE TABLE authors(
  id INTEGER Primary key autoincrement, 
  name text
);

CREATE TABLE books (
  id INTEGER Primary key autoincrement, 
  title text,
  year INTEGER,
  author_id INTEGER References authors(id),
  series_id INTEGER References series(id)
);

CREATE TABLE characters (
  id INTEGER Primary key autoincrement,
  name text,
  motto text, 
  species text,
  author_id INTEGER References authors(id),
  series_id INTEGER References series(id)
);

CREATE TABLE character_book (
  id INTEGER Primary key autoincrement, 
  book_id INTEGER References books(id),
  character_id INTEGER References characters(id)
);