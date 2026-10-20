SELECT a FROM t2
      WHERE (d>=5.0 AND d<6.0 AND d NOT NULL)
         OR (g='xwvutsr' AND f GLOB 'ghijk*')
         OR (d>=72.0 AND d<73.0 AND d NOT NULL)
         OR ((a BETWEEN 76 AND 78) AND a!=77)
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR a=99
         OR ((a BETWEEN 12 AND 14) AND a!=13)
