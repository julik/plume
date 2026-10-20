SELECT a FROM t2
      WHERE (d>=87.0 AND d<88.0 AND d NOT NULL)
         OR b=836
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
         OR (g='wvutsrq' AND f GLOB 'ijklm*')
         OR a=91
         OR b=594
         OR (g='ponmlkj' AND f GLOB 'vwxyz*')
