SELECT a FROM t2
      WHERE ((a BETWEEN 30 AND 32) AND a!=31)
         OR a=96
         OR b=355
         OR (d>=81.0 AND d<82.0 AND d NOT NULL)
         OR b=597
         OR ((a BETWEEN 92 AND 94) AND a!=93)
         OR (d>=88.0 AND d<89.0 AND d NOT NULL)
         OR (f GLOB '?lmno*' AND f GLOB 'klmn*')
         OR b=168
         OR (g='vutsrqp' AND f GLOB 'pqrst*')
