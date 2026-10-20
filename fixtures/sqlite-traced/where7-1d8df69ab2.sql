SELECT a FROM t2
      WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
         OR b=286
         OR (d>=31.0 AND d<32.0 AND d NOT NULL)
         OR b=91
         OR ((a BETWEEN 43 AND 45) AND a!=44)
