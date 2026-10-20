SELECT a FROM t2
      WHERE (f GLOB '?abcd*' AND f GLOB 'zabc*')
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR (g='ponmlkj' AND f GLOB 'tuvwx*')
         OR (g='nmlkjih' AND f GLOB 'cdefg*')
         OR (g='srqponm' AND f GLOB 'cdefg*')
         OR (g='ihgfedc' AND f GLOB 'bcdef*')
         OR f='lmnopqrst'
         OR ((a BETWEEN 11 AND 13) AND a!=12)
         OR b=872
         OR a=44
         OR ((a BETWEEN 38 AND 40) AND a!=39)
