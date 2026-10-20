SELECT a FROM t2
      WHERE a=50
         OR ((a BETWEEN 61 AND 63) AND a!=62)
         OR (f GLOB '?stuv*' AND f GLOB 'rstu*')
         OR a=32
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR (g='ponmlkj' AND f GLOB 'tuvwx*')
         OR a=14
         OR (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR b=946
         OR ((a BETWEEN 53 AND 55) AND a!=54)
         OR b=124
