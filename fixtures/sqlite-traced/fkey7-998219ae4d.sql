CREATE TABLE child(
    c UNIQUE REFERENCES parent(p)
  );
