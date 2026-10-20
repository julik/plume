SELECT a FROM t2
      WHERE a=80
         OR ((a BETWEEN 4 AND 6) AND a!=5)
         OR (d>=29.0 AND d<30.0 AND d NOT NULL)
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
         OR b=971
         OR a=60
