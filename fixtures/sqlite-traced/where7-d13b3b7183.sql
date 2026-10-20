SELECT a FROM t2
      WHERE (g='kjihgfe' AND f GLOB 'tuvwx*')
         OR (g='tsrqpon' AND f GLOB 'zabcd*')
         OR (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR (d>=98.0 AND d<99.0 AND d NOT NULL)
         OR (g='tsrqpon' AND f GLOB 'bcdef*')
         OR a=23
         OR b=737
         OR (d>=71.0 AND d<72.0 AND d NOT NULL)
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR (d>=69.0 AND d<70.0 AND d NOT NULL)
         OR ((a BETWEEN 68 AND 70) AND a!=69)
