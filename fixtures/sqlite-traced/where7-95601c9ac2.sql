SELECT a FROM t2
      WHERE (g='tsrqpon' AND f GLOB 'yzabc*')
         OR (g='wvutsrq' AND f GLOB 'mnopq*')
         OR ((a BETWEEN 62 AND 64) AND a!=63)
         OR c=6006
         OR ((a BETWEEN 50 AND 52) AND a!=51)
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR ((a BETWEEN 88 AND 90) AND a!=89)
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
