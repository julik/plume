SELECT a FROM t2
      WHERE (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR a=21
         OR (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR (d>=3.0 AND d<4.0 AND d NOT NULL)
         OR f='zabcdefgh'
         OR (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR b=506
         OR ((a BETWEEN 14 AND 16) AND a!=15)
         OR b=88
         OR b=190
