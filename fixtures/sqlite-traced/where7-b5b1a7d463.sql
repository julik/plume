SELECT a FROM t2
      WHERE b=726
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR f='abcdefghi'
         OR (d>=92.0 AND d<93.0 AND d NOT NULL)
         OR b=869
