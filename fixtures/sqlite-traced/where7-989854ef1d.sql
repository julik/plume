SELECT a FROM t2
      WHERE a=22
         OR b=36
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR (d>=31.0 AND d<32.0 AND d NOT NULL)
         OR ((a BETWEEN 81 AND 83) AND a!=82)
