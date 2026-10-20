SELECT a FROM t2
      WHERE b=539
         OR b=594
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR f='abcdefghi'
         OR a=6
         OR (d>=17.0 AND d<18.0 AND d NOT NULL)
         OR b=762
