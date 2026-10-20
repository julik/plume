SELECT a, coalesce(b, eval('SELECT ''bam''')), c
    FROM t1
   ORDER BY rowid;
