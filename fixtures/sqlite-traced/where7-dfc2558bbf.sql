SELECT a FROM t2
      WHERE ((a BETWEEN 22 AND 24) AND a!=23)
         OR a=5
         OR b=432
         OR b=979
         OR b=762
         OR b=352
         OR ((a BETWEEN 36 AND 38) AND a!=37)
         OR c=27027
         OR c=20020
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
