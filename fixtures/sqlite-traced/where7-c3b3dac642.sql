SELECT a FROM t2
      WHERE (d>=9.0 AND d<10.0 AND d NOT NULL)
         OR a=8
         OR a=62
         OR b=726
         OR (d>=10.0 AND d<11.0 AND d NOT NULL)
         OR ((a BETWEEN 50 AND 52) AND a!=51)
         OR (g='vutsrqp' AND f GLOB 'opqrs*')
         OR ((a BETWEEN 59 AND 61) AND a!=60)
