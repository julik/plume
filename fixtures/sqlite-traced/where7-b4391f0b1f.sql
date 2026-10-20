SELECT a FROM t2
      WHERE (f GLOB '?lmno*' AND f GLOB 'klmn*')
         OR b=806
         OR (g='ponmlkj' AND f GLOB 'rstuv*')
         OR b=1015
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
