SELECT a FROM t2
      WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
         OR b=1056
         OR b=1012
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR ((a BETWEEN 67 AND 69) AND a!=68)
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
