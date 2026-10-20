SELECT a FROM t2
      WHERE ((a BETWEEN 60 AND 62) AND a!=61)
         OR ((a BETWEEN 74 AND 76) AND a!=75)
         OR b=22
         OR b=993
         OR f='tuvwxyzab'
