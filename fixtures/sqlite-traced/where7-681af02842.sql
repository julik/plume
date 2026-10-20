SELECT a FROM t2
      WHERE b=102
         OR c=6006
         OR b=231
         OR b=212
         OR (d>=36.0 AND d<37.0 AND d NOT NULL)
         OR (g='gfedcba' AND f GLOB 'klmno*')
         OR c=30030
         OR (g='onmlkji' AND f GLOB 'abcde*')
