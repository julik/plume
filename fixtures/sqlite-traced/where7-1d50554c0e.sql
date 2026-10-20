SELECT a FROM t2
      WHERE a=27
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR ((a BETWEEN 89 AND 91) AND a!=90)
         OR (g='ihgfedc' AND f GLOB 'efghi*')
         OR b=1045
         OR a=84
         OR f='qrstuvwxy'
