SELECT a FROM t2
      WHERE ((a BETWEEN 3 AND 5) AND a!=4)
         OR ((a BETWEEN 56 AND 58) AND a!=57)
         OR (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'yzabc*')
         OR a=24
         OR (d>=99.0 AND d<100.0 AND d NOT NULL)
         OR (f GLOB '?bcde*' AND f GLOB 'abcd*')
