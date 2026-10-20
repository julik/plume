SELECT a FROM t2
      WHERE (d>=11.0 AND d<12.0 AND d NOT NULL)
         OR c=23023
         OR b=462
         OR ((a BETWEEN 17 AND 19) AND a!=18)
