SELECT a FROM t2
      WHERE a=73
         OR ((a BETWEEN 36 AND 38) AND a!=37)
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR ((a BETWEEN 51 AND 53) AND a!=52)
         OR a=9
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR a=44
         OR a=23
         OR (g='ihgfedc' AND f GLOB 'abcde*')
         OR (g='rqponml' AND f GLOB 'lmnop*')
