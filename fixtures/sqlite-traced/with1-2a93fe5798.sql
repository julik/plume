CREATE TABLE f(
      id INTEGER PRIMARY KEY, parentid REFERENCES f, name TEXT
  );
