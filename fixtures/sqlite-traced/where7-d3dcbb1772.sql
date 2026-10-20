SELECT a FROM t2
      WHERE (d>=82.0 AND d<83.0 AND d NOT NULL)
         OR (d>=36.0 AND d<37.0 AND d NOT NULL)
         OR (g='tsrqpon' AND f GLOB 'xyzab*')
         OR (d>=36.0 AND d<37.0 AND d NOT NULL)
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR a=41
         OR (g='xwvutsr' AND f GLOB 'ghijk*')
         OR (g='onmlkji' AND f GLOB 'zabcd*')
         OR b=913
