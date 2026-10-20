SELECT a FROM t2
      WHERE ((a BETWEEN 72 AND 74) AND a!=73)
         OR b=605
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
         OR (g='wvutsrq' AND f GLOB 'mnopq*')
         OR ((a BETWEEN 72 AND 74) AND a!=73)
         OR f='ijklmnopq'
         OR ((a BETWEEN 86 AND 88) AND a!=87)
         OR (d>=13.0 AND d<14.0 AND d NOT NULL)
         OR c=9009
         OR b=374
