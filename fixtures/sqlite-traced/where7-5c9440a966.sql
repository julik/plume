SELECT a FROM t2
      WHERE b=872
         OR ((a BETWEEN 58 AND 60) AND a!=59)
         OR (f GLOB '?wxyz*' AND f GLOB 'vwxy*')
         OR b=957
         OR (d>=42.0 AND d<43.0 AND d NOT NULL)
         OR a=67
         OR a=72
