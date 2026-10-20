SELECT a FROM t2
      WHERE (d>=57.0 AND d<58.0 AND d NOT NULL)
         OR b=762
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR f='tuvwxyzab'
         OR (d>=44.0 AND d<45.0 AND d NOT NULL)
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR b=1034
         OR (d>=14.0 AND d<15.0 AND d NOT NULL)
