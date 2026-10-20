SELECT a FROM t2
      WHERE (g='nmlkjih' AND f GLOB 'efghi*')
         OR b=982
         OR b=781
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR d>1e10
         OR (d>=71.0 AND d<72.0 AND d NOT NULL)
