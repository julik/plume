SELECT a FROM t2
      WHERE (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR ((a BETWEEN 80 AND 82) AND a!=81)
         OR b=36
         OR ((a BETWEEN 33 AND 35) AND a!=34)
