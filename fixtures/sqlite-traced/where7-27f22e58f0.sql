SELECT a FROM t2
      WHERE (d>=25.0 AND d<26.0 AND d NOT NULL)
         OR b=509
         OR b=1004
         OR ((a BETWEEN 28 AND 30) AND a!=29)
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR (g='mlkjihg' AND f GLOB 'hijkl*')
         OR f='pqrstuvwx'
