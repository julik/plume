SELECT a FROM t2
      WHERE (g='mlkjihg' AND f GLOB 'ijklm*')
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR ((a BETWEEN 64 AND 66) AND a!=65)
         OR b=682
         OR (d>=34.0 AND d<35.0 AND d NOT NULL)
         OR (g='lkjihgf' AND f GLOB 'nopqr*')
         OR (d>=22.0 AND d<23.0 AND d NOT NULL)
