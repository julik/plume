SELECT a FROM t2
      WHERE (d>=40.0 AND d<41.0 AND d NOT NULL)
         OR a=77
         OR (d>=85.0 AND d<86.0 AND d NOT NULL)
