SELECT a FROM t2
      WHERE a=24
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR b=487
         OR (d>=96.0 AND d<97.0 AND d NOT NULL)
         OR ((a BETWEEN 13 AND 15) AND a!=14)
         OR b=132
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR b=795
         OR b=737
