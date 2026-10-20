SELECT a FROM t2
      WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR b=465
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR a=37
         OR b=1056
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR (d>=4.0 AND d<5.0 AND d NOT NULL)
         OR b=1023
