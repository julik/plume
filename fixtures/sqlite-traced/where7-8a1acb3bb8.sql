SELECT a FROM t2
      WHERE b=429
         OR (d>=33.0 AND d<34.0 AND d NOT NULL)
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
         OR (g='qponmlk' AND f GLOB 'opqrs*')
         OR b=1070
         OR (g='vutsrqp' AND f GLOB 'rstuv*')
