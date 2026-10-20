SELECT EXISTS(
    SELECT 1
      FROM (SELECT 1 FROM t617 WHERE a='two' OR b='i')
     WHERE a='ex' OR b='iv'
  ) FROM t617;
