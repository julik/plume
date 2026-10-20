SELECT a FROM t2
      WHERE (g='ihgfedc' AND f GLOB 'efghi*')
         OR b=300
         OR (d>=7.0 AND d<8.0 AND d NOT NULL)
         OR b=58
         OR ((a BETWEEN 55 AND 57) AND a!=56)
         OR (g='nmlkjih' AND f GLOB 'defgh*')
         OR b=286
         OR b=234
         OR ((a BETWEEN 43 AND 45) AND a!=44)
         OR f='ghijklmno'
         OR (d>=26.0 AND d<27.0 AND d NOT NULL)
