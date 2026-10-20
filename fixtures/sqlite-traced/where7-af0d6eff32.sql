SELECT a FROM t2
      WHERE b=553
         OR ((a BETWEEN 21 AND 23) AND a!=22)
         OR (g='onmlkji' AND f GLOB 'wxyza*')
         OR (d>=59.0 AND d<60.0 AND d NOT NULL)
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR b=583
         OR a=56
