SELECT a FROM t2
      WHERE a=37
         OR b=88
         OR (g='utsrqpo' AND f GLOB 'wxyza*')
         OR c=23023
         OR (d>=67.0 AND d<68.0 AND d NOT NULL)
         OR a=56
         OR ((a BETWEEN 13 AND 15) AND a!=14)
         OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR f='ijklmnopq'
         OR ((a BETWEEN 85 AND 87) AND a!=86)
