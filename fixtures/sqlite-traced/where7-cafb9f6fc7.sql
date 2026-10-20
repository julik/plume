SELECT a FROM t2
      WHERE ((a BETWEEN 21 AND 23) AND a!=22)
         OR a=2
         OR b=784
         OR ((a BETWEEN 21 AND 23) AND a!=22)
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR b=850
