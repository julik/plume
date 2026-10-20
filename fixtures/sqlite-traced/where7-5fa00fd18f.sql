SELECT a FROM t2
      WHERE (d>=97.0 AND d<98.0 AND d NOT NULL)
         OR a=40
         OR (d>=86.0 AND d<87.0 AND d NOT NULL)
         OR f='abcdefghi'
         OR b=696
         OR (g='vutsrqp' AND f GLOB 'qrstu*')
         OR b=682
         OR a=32
         OR ((a BETWEEN 34 AND 36) AND a!=35)
         OR b=671
         OR a=15
