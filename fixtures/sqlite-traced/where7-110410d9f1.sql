SELECT a FROM t2
      WHERE (g='tsrqpon' AND f GLOB 'abcde*')
         OR (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR ((a BETWEEN 74 AND 76) AND a!=75)
         OR b=1092
         OR b=495
