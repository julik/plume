SELECT a FROM t2
      WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR a=74
         OR (g='utsrqpo' AND f GLOB 'uvwxy*')
         OR ((a BETWEEN 42 AND 44) AND a!=43)
