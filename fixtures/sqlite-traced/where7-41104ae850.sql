SELECT a FROM t2
      WHERE (g='qponmlk' AND f GLOB 'pqrst*')
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR (d>=71.0 AND d<72.0 AND d NOT NULL)
         OR a=47
