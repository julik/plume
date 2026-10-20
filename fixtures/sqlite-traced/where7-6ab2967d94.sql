SELECT a FROM t2
      WHERE (g='ihgfedc' AND f GLOB 'abcde*')
         OR ((a BETWEEN 2 AND 4) AND a!=3)
         OR a=86
         OR c=33033
         OR c=2002
         OR a=92
