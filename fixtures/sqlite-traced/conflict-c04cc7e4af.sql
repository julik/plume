-- ON CONFLICT clauses are not allowed on column CHECK constraints
  CREATE TABLE t1(a INT CHECK( a!=5 ) ON CONFLICT ignore);
