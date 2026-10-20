SELECT a, c, eval(
      printf('DELETE FROM t2 WHERE c=%d AND %d>5', a+c, a+c)
  ) FROM t1, t2;
