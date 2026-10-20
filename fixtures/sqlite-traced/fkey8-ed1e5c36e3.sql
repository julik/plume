CREATE TABLE t2(
    a PRIMARY KEY, b, c, d, e,
      FOREIGN KEY(b, c) REFERENCES t2(d, e)
  ) WITHOUT ROWID;
