CREATE TABLE t1(a,b,c,d,e,f,
     UNIQUE (a,b),
     PRIMARY KEY (e,c),
     FOREIGN KEY (d,f) REFERENCES t1(e,c)
  ) WITHOUT rowid;
