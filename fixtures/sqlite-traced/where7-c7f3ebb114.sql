SELECT a FROM t2
      WHERE ((a BETWEEN 20 AND 22) AND a!=21)
         OR b=1045
         OR (g='ihgfedc' AND f GLOB 'abcde*')
         OR a=26
         OR (g='gfedcba' AND f GLOB 'opqrs*')
