SELECT a FROM t2
      WHERE (d>=73.0 AND d<74.0 AND d NOT NULL)
         OR c=21021
         OR (g='lkjihgf' AND f GLOB 'nopqr*')
         OR f='zabcdefgh'
         OR (g='yxwvuts' AND f GLOB 'bcdef*')
         OR b=781
         OR a=64
         OR (d>=11.0 AND d<12.0 AND d NOT NULL)
