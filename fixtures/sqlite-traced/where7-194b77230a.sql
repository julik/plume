SELECT a FROM t2
      WHERE (d>=6.0 AND d<7.0 AND d NOT NULL)
         OR ((a BETWEEN 58 AND 60) AND a!=59)
