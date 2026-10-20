SELECT a FROM t2
      WHERE b=594
         OR f='hijklmnop'
         OR ((a BETWEEN 65 AND 67) AND a!=66)
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR b=707
         OR b=363
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR b=157
         OR (g='tsrqpon' AND f GLOB 'yzabc*')
