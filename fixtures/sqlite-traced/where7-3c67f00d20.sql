SELECT a FROM t2
      WHERE ((a BETWEEN 7 AND 9) AND a!=8)
         OR b=652
         OR a=72
         OR b=209
         OR (g='tsrqpon' AND f GLOB 'xyzab*')
         OR a=38
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR d>1e10
