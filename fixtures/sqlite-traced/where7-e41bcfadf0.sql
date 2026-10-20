SELECT a FROM t2
      WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR b=957
         OR (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR ((a BETWEEN 87 AND 89) AND a!=88)
         OR ((a BETWEEN 58 AND 60) AND a!=59)
         OR a=40
