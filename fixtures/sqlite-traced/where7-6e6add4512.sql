SELECT a FROM t2
      WHERE ((a BETWEEN 4 AND 6) AND a!=5)
         OR (g='tsrqpon' AND f GLOB 'abcde*')
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR f='rstuvwxyz'
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
         OR (g='wvutsrq' AND f GLOB 'ijklm*')
         OR a=14
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
