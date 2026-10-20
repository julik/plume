CREATE TABLE t1(a,b,c,
    UNIQUE(b,c),
    PRIMARY KEY(b,c)
  ) WITHOUT ROWID;
