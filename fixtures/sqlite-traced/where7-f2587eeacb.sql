SELECT a FROM t2
      WHERE ((a BETWEEN 83 AND 85) AND a!=84)
         OR ((a BETWEEN 14 AND 16) AND a!=15)
         OR a=13
         OR b=121
         OR (d>=44.0 AND d<45.0 AND d NOT NULL)
         OR ((a BETWEEN 12 AND 14) AND a!=13)
         OR (g='utsrqpo' AND f GLOB 'stuvw*')
         OR b=660
         OR b=792
         OR (g='xwvutsr' AND f GLOB 'ghijk*')
