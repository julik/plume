CREATE TABLE albums (
    id integer NOT NULL PRIMARY KEY AUTOINCREMENT,
    name varchar(255),
    artist_id integer REFERENCES artists
  );
