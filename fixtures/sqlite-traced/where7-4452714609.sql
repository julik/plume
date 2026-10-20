SELECT a FROM t2
      WHERE c=11011
         OR a=14
         OR c=16016
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR f='jklmnopqr'
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
         OR (d>=96.0 AND d<97.0 AND d NOT NULL)
         OR b=916
