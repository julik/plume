SELECT a FROM t2
      WHERE (g='kjihgfe' AND f GLOB 'stuvw*')
         OR b=531
         OR ((a BETWEEN 93 AND 95) AND a!=94)
         OR (d>=3.0 AND d<4.0 AND d NOT NULL)
