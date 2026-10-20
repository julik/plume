SELECT a FROM t2
      WHERE (d>=8.0 AND d<9.0 AND d NOT NULL)
         OR (g='vutsrqp' AND f GLOB 'qrstu*')
         OR a=21
         OR b=1026
         OR ((a BETWEEN 34 AND 36) AND a!=35)
         OR b=473
