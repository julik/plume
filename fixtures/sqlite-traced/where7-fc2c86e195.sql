SELECT a FROM t2
      WHERE c=17017
         OR (d>=62.0 AND d<63.0 AND d NOT NULL)
         OR ((a BETWEEN 88 AND 90) AND a!=89)
         OR b=784
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR ((a BETWEEN 54 AND 56) AND a!=55)
         OR ((a BETWEEN 16 AND 18) AND a!=17)
         OR f='zabcdefgh'
