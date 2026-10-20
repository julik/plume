SELECT a FROM t2
      WHERE b=880
         OR b=982
         OR a=52
         OR (g='onmlkji' AND f GLOB 'abcde*')
         OR a=24
         OR ((a BETWEEN 47 AND 49) AND a!=48)
         OR (g='mlkjihg' AND f GLOB 'ijklm*')
         OR (g='ihgfedc' AND f GLOB 'cdefg*')
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
