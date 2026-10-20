SELECT a FROM t2
      WHERE a=79
         OR b=201
         OR b=99
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR a=64
         OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR a=89
