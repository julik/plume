SELECT a FROM t2
      WHERE (f GLOB '?mnop*' AND f GLOB 'lmno*')
         OR a=93
         OR a=11
         OR f='nopqrstuv'
         OR (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR a=17
         OR b=366
