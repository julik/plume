INSERT INTO t2(a) VALUES('one'),('one'),('three'),('four')
      ON CONFLICT(a) DO UPDATE SET b=b+1;
