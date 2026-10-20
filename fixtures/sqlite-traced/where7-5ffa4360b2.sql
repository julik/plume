SELECT a FROM t2
      WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR c=7007
         OR b=429
         OR ((a BETWEEN 25 AND 27) AND a!=26)
         OR b=231
         OR (d>=26.0 AND d<27.0 AND d NOT NULL)
         OR c=22022
         OR f='bcdefghij'
