SELECT a FROM t2
      WHERE (d>=32.0 AND d<33.0 AND d NOT NULL)
         OR a=27
         OR ((a BETWEEN 55 AND 57) AND a!=56)
         OR (g='utsrqpo' AND f GLOB 'tuvwx*')
