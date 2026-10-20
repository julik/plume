SELECT a FROM t2
      WHERE (g='qponmlk' AND f GLOB 'pqrst*')
         OR a=52
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR (d>=24.0 AND d<25.0 AND d NOT NULL)
         OR f='ghijklmno'
         OR (g='utsrqpo' AND f GLOB 'stuvw*')
         OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
         OR b=319
         OR a=34
         OR (g='wvutsrq' AND f GLOB 'mnopq*')
         OR f='hijklmnop'
