SELECT a FROM t2
      WHERE ((a BETWEEN 12 AND 14) AND a!=13)
         OR a=36
         OR a=75
         OR b=179
         OR (d>=43.0 AND d<44.0 AND d NOT NULL)
         OR (g='utsrqpo' AND f GLOB 'stuvw*')
         OR (d>=65.0 AND d<66.0 AND d NOT NULL)
         OR b=850
         OR a=62
