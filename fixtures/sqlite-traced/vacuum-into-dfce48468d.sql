CREATE TABLE t1(
    a INTEGER PRIMARY KEY,
    b ANY,
    c INT AS (b+1),                          --- See "2024-04-09" block
    CHECK( typeof(b)!='integer' OR b>a-5 )   --- comment below
  );
