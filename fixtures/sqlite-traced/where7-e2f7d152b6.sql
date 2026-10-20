SELECT a FROM t2
      WHERE b=300
         OR (g='mlkjihg' AND f GLOB 'klmno*')
         OR b=319
         OR f='fghijklmn'
         OR (d>=73.0 AND d<74.0 AND d NOT NULL)
         OR ((a BETWEEN 42 AND 44) AND a!=43)
