SELECT a FROM t2
      WHERE a=60
         OR a=39
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR b=36
         OR b=814
         OR a=14
         OR (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR b=440
         OR (g='xwvutsr' AND f GLOB 'fghij*')
         OR (f GLOB '?abcd*' AND f GLOB 'zabc*')
