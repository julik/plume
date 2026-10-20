SELECT a FROM t2
      WHERE b=748
         OR (d>=20.0 AND d<21.0 AND d NOT NULL)
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
         OR (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR b=630
