SELECT quote(a), quote(b), '|' FROM t1 WHERE b in (SELECT a FROM t1) AND a=0;
