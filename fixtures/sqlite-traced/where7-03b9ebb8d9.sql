SELECT a FROM t2
      WHERE a=2
         OR (d>=11.0 AND d<12.0 AND d NOT NULL)
         OR a=23
         OR b=1092
         OR c=19019
         OR b=245
         OR ((a BETWEEN 97 AND 99) AND a!=98)
         OR (f GLOB '?nopq*' AND f GLOB 'mnop*')
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR b=572
         OR ((a BETWEEN 22 AND 24) AND a!=23)
