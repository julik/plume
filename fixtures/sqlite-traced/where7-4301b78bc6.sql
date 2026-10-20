SELECT a FROM t2
      WHERE ((a BETWEEN 83 AND 85) AND a!=84)
         OR b=784
         OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
         OR b=825
         OR a=80
         OR (g='tsrqpon' AND f GLOB 'xyzab*')
         OR (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR b=531
         OR a=100
