SELECT a FROM t2
      WHERE a=97
         OR b=575
         OR (d>=81.0 AND d<82.0 AND d NOT NULL)
         OR ((a BETWEEN 2 AND 4) AND a!=3)
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
