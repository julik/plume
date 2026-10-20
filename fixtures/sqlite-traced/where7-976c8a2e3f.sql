SELECT a FROM t2
      WHERE (g='qponmlk' AND f GLOB 'pqrst*')
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR a=45
         OR (d>=81.0 AND d<82.0 AND d NOT NULL)
