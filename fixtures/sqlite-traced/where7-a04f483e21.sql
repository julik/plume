SELECT a FROM t2
      WHERE (d>=26.0 AND d<27.0 AND d NOT NULL)
         OR b=308
         OR c<=10
         OR (g='xwvutsr' AND f GLOB 'hijkl*')
         OR f='ghijklmno'
         OR b=289
         OR a=5
         OR b=267
         OR b=949
         OR ((a BETWEEN 7 AND 9) AND a!=8)
