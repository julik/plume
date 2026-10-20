SELECT a FROM t2
      WHERE a=24
         OR b=473
         OR (g='hgfedcb' AND f GLOB 'ijklm*')
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
         OR b=509
         OR b=924
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
