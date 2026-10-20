SELECT a FROM t2
      WHERE b=671
         OR ((a BETWEEN 86 AND 88) AND a!=87)
         OR (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR b=1004
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR ((a BETWEEN 5 AND 7) AND a!=6)
         OR (d>=82.0 AND d<83.0 AND d NOT NULL)
         OR b=748
         OR (g='tsrqpon' AND f GLOB 'xyzab*')
