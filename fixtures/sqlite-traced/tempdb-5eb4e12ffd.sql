INSERT INTO t1
    SELECT CASE WHEN y IS NULL THEN test_error('oops', 11) ELSE y END
      FROM t2;
