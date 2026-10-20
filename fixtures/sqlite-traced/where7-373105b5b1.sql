SELECT a FROM t2
      WHERE b=498
         OR (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR (d>=88.0 AND d<89.0 AND d NOT NULL)
         OR ((a BETWEEN 67 AND 69) AND a!=68)
         OR ((a BETWEEN 67 AND 69) AND a!=68)
         OR c=33033
         OR b=11
         OR (g='wvutsrq' AND f GLOB 'lmnop*')
         OR ((a BETWEEN 7 AND 9) AND a!=8)
