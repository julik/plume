SELECT a FROM t2
      WHERE ((a BETWEEN 76 AND 78) AND a!=77)
         OR (d>=24.0 AND d<25.0 AND d NOT NULL)
         OR f='yzabcdefg'
         OR c=14014
         OR a=1
         OR a=9
         OR b=960
