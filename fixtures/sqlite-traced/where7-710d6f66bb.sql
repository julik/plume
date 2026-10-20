SELECT a FROM t2
      WHERE ((a BETWEEN 46 AND 48) AND a!=47)
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR b=641
         OR a=3
         OR a=35
         OR (d>=81.0 AND d<82.0 AND d NOT NULL)
         OR f='opqrstuvw'
         OR a=41
         OR a=83
         OR (g='nmlkjih' AND f GLOB 'cdefg*')
         OR b=751
