CREATE TABLE t3(
    c1,c2,c3,c4,c5,c6,c7,c8,
    PRIMARY KEY(c1,c2),
    UNIQUE(c3,c4,c5,c6,c7,c8,c3 COLLATE nocase)
  ) WITHOUT ROWID;
