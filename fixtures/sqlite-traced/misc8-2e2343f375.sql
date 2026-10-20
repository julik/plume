SELECT a, coalesce(b, eval('ROLLBACK; SELECT ''bam'';')), c
   FROM t1 ORDER BY a;
