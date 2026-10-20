SELECT a FROM t2
      WHERE b=275
         OR ((a BETWEEN 10 AND 12) AND a!=11)
         OR f='ghijklmno'
         OR b=619
         OR (g='edcbazy' AND f GLOB 'vwxyz*')
         OR ((a BETWEEN 91 AND 93) AND a!=92)
         OR b=476
         OR a=83
         OR ((a BETWEEN 47 AND 49) AND a!=48)
