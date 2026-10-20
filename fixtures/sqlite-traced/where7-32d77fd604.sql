SELECT a FROM t2
      WHERE ((a BETWEEN 28 AND 30) AND a!=29)
         OR (d>=8.0 AND d<9.0 AND d NOT NULL)
         OR b=1059
         OR b=630
