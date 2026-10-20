SELECT a FROM t2
      WHERE (g='edcbazy' AND f GLOB 'vwxyz*')
         OR ((a BETWEEN 59 AND 61) AND a!=60)
         OR (g='ihgfedc' AND f GLOB 'cdefg*')
         OR a=78
         OR a=27
         OR b=792
         OR b=946
         OR c=22022
         OR a=23
         OR (f GLOB '?opqr*' AND f GLOB 'nopq*')
         OR b=388
