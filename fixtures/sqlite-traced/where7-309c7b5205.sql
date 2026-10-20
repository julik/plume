SELECT a FROM t2
      WHERE (g='qponmlk' AND f GLOB 'nopqr*')
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR b=993
