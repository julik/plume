SELECT a FROM t2
      WHERE ((a BETWEEN 8 AND 10) AND a!=9)
         OR (d>=94.0 AND d<95.0 AND d NOT NULL)
         OR ((a BETWEEN 34 AND 36) AND a!=35)
         OR c=14014
         OR b=828
