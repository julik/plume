SELECT a FROM t2
      WHERE (d>=29.0 AND d<30.0 AND d NOT NULL)
         OR (g='qponmlk' AND f GLOB 'opqrs*')
         OR f='rstuvwxyz'
         OR (g='qponmlk' AND f GLOB 'nopqr*')
