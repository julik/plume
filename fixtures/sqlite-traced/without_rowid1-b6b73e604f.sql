CREATE TABLE t2(
    c1,c2,c3,c4,c5,c6,c7,c8,
    PRIMARY KEY(c1 COLLATE nocase,c1 COLLATE rtrim,
                c2 COLLATE nocase,c2 COLLATE rtrim,
                c3 COLLATE nocase,c3 COLLATE rtrim,
                c4 COLLATE nocase,c4 COLLATE rtrim)
  ) WITHOUT ROWID;
