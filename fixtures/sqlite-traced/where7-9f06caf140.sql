SELECT a FROM t2
      WHERE (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR a=51
         OR ((a BETWEEN 28 AND 30) AND a!=29)
