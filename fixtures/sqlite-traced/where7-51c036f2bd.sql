SELECT a FROM t2
      WHERE (d>=4.0 AND d<5.0 AND d NOT NULL)
         OR a=45
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
         OR a=69
         OR ((a BETWEEN 69 AND 71) AND a!=70)
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
