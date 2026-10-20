SELECT * FROM (t1 NATURAL JOIN pragma_table_xinfo('t1_a') NATURAL JOIN t3) t1
                NATURAL JOIN t2 NATURAL JOIN t3
   WHERE rowid ISNULL>0 AND 0%y;
