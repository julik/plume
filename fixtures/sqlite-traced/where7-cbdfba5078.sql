SELECT a FROM t2
      WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR ((a BETWEEN 8 AND 10) AND a!=9)
         OR ((a BETWEEN 86 AND 88) AND a!=87)
         OR b=146
         OR (g='ponmlkj' AND f GLOB 'rstuv*')
         OR ((a BETWEEN 73 AND 75) AND a!=74)
         OR (g='utsrqpo' AND f GLOB 'uvwxy*')
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR (g='ihgfedc' AND f GLOB 'efghi*')
         OR b=704
