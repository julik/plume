SELECT a FROM t2
      WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
         OR b=935
         OR ((a BETWEEN 32 AND 34) AND a!=33)
         OR b=487
         OR b=619
         OR (g='qponmlk' AND f GLOB 'nopqr*')
         OR (g='vutsrqp' AND f GLOB 'rstuv*')
