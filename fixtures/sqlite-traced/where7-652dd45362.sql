SELECT a FROM t2
      WHERE b=363
         OR (g='tsrqpon' AND f GLOB 'zabcd*')
         OR ((a BETWEEN 58 AND 60) AND a!=59)
         OR (d>=2.0 AND d<3.0 AND d NOT NULL)
         OR (d>=46.0 AND d<47.0 AND d NOT NULL)
         OR (g='wvutsrq' AND f GLOB 'klmno*')
         OR a=39
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
