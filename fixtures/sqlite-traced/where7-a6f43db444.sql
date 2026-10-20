SELECT a FROM t2
      WHERE (d>=30.0 AND d<31.0 AND d NOT NULL)
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR ((a BETWEEN 64 AND 66) AND a!=65)
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR a=33
