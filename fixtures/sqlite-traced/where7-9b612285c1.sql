SELECT a FROM t2
      WHERE b=924
         OR ((a BETWEEN 6 AND 8) AND a!=7)
         OR (d>=36.0 AND d<37.0 AND d NOT NULL)
         OR (d>=40.0 AND d<41.0 AND d NOT NULL)
         OR a=100
         OR c=15015
         OR (d>=82.0 AND d<83.0 AND d NOT NULL)
         OR (d>=2.0 AND d<3.0 AND d NOT NULL)
