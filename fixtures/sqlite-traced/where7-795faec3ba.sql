SELECT a FROM t2
      WHERE b=363
         OR b=630
         OR b=935
         OR (d>=20.0 AND d<21.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR f='yzabcdefg'
         OR ((a BETWEEN 37 AND 39) AND a!=38)
