SELECT a FROM t2
      WHERE (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR ((a BETWEEN 24 AND 26) AND a!=25)
         OR (d>=83.0 AND d<84.0 AND d NOT NULL)
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR b=784
         OR b=718
         OR a=18
         OR a=3
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR c=28028
