SELECT a FROM t2
      WHERE b=220
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR f IS NULL
         OR ((a BETWEEN 25 AND 27) AND a!=26)
         OR b=784
