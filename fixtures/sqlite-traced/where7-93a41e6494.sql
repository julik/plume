SELECT a FROM t2
      WHERE ((a BETWEEN 3 AND 5) AND a!=4)
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR c=15015
         OR b=146
         OR b=1092
         OR (d>=60.0 AND d<61.0 AND d NOT NULL)
