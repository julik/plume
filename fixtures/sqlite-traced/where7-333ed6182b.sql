SELECT a FROM t2
      WHERE (g='ihgfedc' AND f GLOB 'defgh*')
         OR ((a BETWEEN 97 AND 99) AND a!=98)
         OR (d>=18.0 AND d<19.0 AND d NOT NULL)
         OR b=1056
         OR b=146
