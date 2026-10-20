SELECT a FROM t2
      WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR b=880
         OR (d>=86.0 AND d<87.0 AND d NOT NULL)
         OR b=1089
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR f IS NULL
         OR (f GLOB '?ghij*' AND f GLOB 'fghi*')
