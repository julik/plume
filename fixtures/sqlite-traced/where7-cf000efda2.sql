SELECT a FROM t2
      WHERE ((a BETWEEN 97 AND 99) AND a!=98)
         OR a=73
         OR b=1048
         OR c>=34035
         OR (g='ihgfedc' AND f GLOB 'cdefg*')
         OR a=72
         OR ((a BETWEEN 91 AND 93) AND a!=92)
         OR b=638
