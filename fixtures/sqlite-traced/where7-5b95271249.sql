SELECT a FROM t2
      WHERE b=22
         OR ((a BETWEEN 61 AND 63) AND a!=62)
         OR e IS NULL
         OR a=1
