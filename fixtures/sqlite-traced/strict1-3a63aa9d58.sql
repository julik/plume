CREATE TABLE strict (
    k INTEGER PRIMARY KEY,
    c1 REAL AS(if(k=11,1.5, k=12,2, k=13,'x', k=14,x'34', 0.0))   STORED,
    c2 INT  AS(if(k=21,1.5, k=22,2, k=23,'x', k=24,x'34', 0))     STORED,
    c3 TEXT AS(if(k=31,1.5, k=32,2, k=33,'x', k=34,x'34', 'x'))   STORED,
    c4 BLOB AS(if(k=41,1.5, k=42,2, k=43,'x', k=44,x'34', x'00')) STORED,
    c5 ANY  AS(if(k=51,1.5, k=52,2, k=53,'x', k=54,x'34', 0))     STORED
  ) STRICT;
