INSERT INTO t2 SELECT a+0, sql(a==3,
          'INSERT INTO t2 SELECT a+10, b FROM t1'
      ) FROM t1;
