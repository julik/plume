SELECT a FROM t2
      WHERE c=11011
         OR f='tuvwxyzab'
         OR (g='ponmlkj' AND f GLOB 'vwxyz*')
         OR (g='hgfedcb' AND f GLOB 'ghijk*')
