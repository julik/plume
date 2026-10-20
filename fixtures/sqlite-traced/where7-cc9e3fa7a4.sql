SELECT a FROM t2
      WHERE b=509
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR (g='vutsrqp' AND f GLOB 'nopqr*')
         OR b=718
         OR a=4
         OR ((a BETWEEN 56 AND 58) AND a!=57)
         OR (d>=69.0 AND d<70.0 AND d NOT NULL)
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
