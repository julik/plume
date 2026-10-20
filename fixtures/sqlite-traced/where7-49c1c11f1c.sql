SELECT a FROM t2
      WHERE (g='wvutsrq' AND f GLOB 'lmnop*')
         OR b=718
         OR f='vwxyzabcd'
         OR (d>=98.0 AND d<99.0 AND d NOT NULL)
         OR (g='kjihgfe' AND f GLOB 'tuvwx*')
         OR (f GLOB '?uvwx*' AND f GLOB 'tuvw*')
         OR (d>=22.0 AND d<23.0 AND d NOT NULL)
         OR ((a BETWEEN 66 AND 68) AND a!=67)
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR (f GLOB '?klmn*' AND f GLOB 'jklm*')
         OR (d>=11.0 AND d<12.0 AND d NOT NULL)
