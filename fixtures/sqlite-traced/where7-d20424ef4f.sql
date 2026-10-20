SELECT a FROM t2
      WHERE (g='ponmlkj' AND f GLOB 'vwxyz*')
         OR ((a BETWEEN 59 AND 61) AND a!=60)
         OR (g='nmlkjih' AND f GLOB 'defgh*')
         OR (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR (g='wvutsrq' AND f GLOB 'mnopq*')
         OR b=14
         OR ((a BETWEEN 88 AND 90) AND a!=89)
         OR f='zabcdefgh'
