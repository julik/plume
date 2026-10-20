SELECT a FROM t2
      WHERE (g='nmlkjih' AND f GLOB 'bcdef*')
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR a=75
         OR b=960
         OR (g='tsrqpon' AND f GLOB 'yzabc*')
         OR b=616
         OR b=330
         OR ((a BETWEEN 16 AND 18) AND a!=17)
         OR a=26
         OR (g='kjihgfe' AND f GLOB 'uvwxy*')
