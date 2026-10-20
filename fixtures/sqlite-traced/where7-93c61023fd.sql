SELECT a FROM t2
      WHERE a=42
         OR e IS NULL
         OR b=495
         OR 1000000<b
         OR (f GLOB '?vwxy*' AND f GLOB 'uvwx*')
         OR a=45
         OR (g='kjihgfe' AND f GLOB 'rstuv*')
         OR a=85
         OR (d>=65.0 AND d<66.0 AND d NOT NULL)
