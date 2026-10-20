-- ON CONFLICT is allowed on table CHECK constraints
  CREATE TABLE t1(a INT, CHECK( a!=5 ) ON CONFLICT ignore);
