SELECT *, '|'
    FROM t1 AS a, t1 AS b
   WHERE a.seq>b.seq
     AND decimal_cmp(a.val,b.val)<=0;
