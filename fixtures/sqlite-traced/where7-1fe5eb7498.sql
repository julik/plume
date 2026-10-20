SELECT a FROM t2
      WHERE b=1081
         OR (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR b=473
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR b=586
         OR (g='tsrqpon' AND f GLOB 'abcde*')
         OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
