SELECT a FROM t2
      WHERE a=54
         OR (g='xwvutsr' AND f GLOB 'defgh*')
         OR b=993
         OR c=22022
         OR a=68
         OR ((a BETWEEN 99 AND 101) AND a!=100)
         OR a=62
         OR (f GLOB '?efgh*' AND f GLOB 'defg*')
         OR b=1015
