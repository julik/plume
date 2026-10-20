SELECT a FROM t2
      WHERE (d>=47.0 AND d<48.0 AND d NOT NULL)
         OR ((a BETWEEN 33 AND 35) AND a!=34)
         OR (g='edcbazy' AND f GLOB 'uvwxy*')
         OR b=220
         OR (d>=70.0 AND d<71.0 AND d NOT NULL)
         OR ((a BETWEEN 67 AND 69) AND a!=68)
         OR (g='qponmlk' AND f GLOB 'pqrst*')
