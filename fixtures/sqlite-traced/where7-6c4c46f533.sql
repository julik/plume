SELECT a FROM t2
      WHERE ((a BETWEEN 9 AND 11) AND a!=10)
         OR b=1078
         OR b=806
         OR b=605
         OR ((a BETWEEN 23 AND 25) AND a!=24)
         OR (g='jihgfed' AND f GLOB 'yzabc*')
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
