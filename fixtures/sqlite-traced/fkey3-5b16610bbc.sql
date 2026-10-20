CREATE TABLE t3(a, b, c, d, 
    UNIQUE(a, b),
    FOREIGN KEY(c, d) REFERENCES t3(a, b)
  );
