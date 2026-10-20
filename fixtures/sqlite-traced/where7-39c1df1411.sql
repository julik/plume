SELECT a FROM t2
      WHERE ((a BETWEEN 90 AND 92) AND a!=91)
         OR a=74
         OR (g='lkjihgf' AND f GLOB 'pqrst*')
         OR ((a BETWEEN 95 AND 97) AND a!=96)
         OR (g='ihgfedc' AND f GLOB 'bcdef*')
         OR (f GLOB '?tuvw*' AND f GLOB 'stuv*')
         OR a=89
