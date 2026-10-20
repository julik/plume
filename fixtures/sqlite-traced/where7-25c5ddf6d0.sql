SELECT a FROM t2
      WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR a=32
         OR (d>=88.0 AND d<89.0 AND d NOT NULL)
         OR a=95
         OR d>1e10
         OR b=429
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'yzabc*')
         OR c=10010
         OR ((a BETWEEN 83 AND 85) AND a!=84)
