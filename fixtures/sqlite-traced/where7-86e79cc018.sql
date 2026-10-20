SELECT a FROM t2
      WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR (g='utsrqpo' AND f GLOB 'tuvwx*')
         OR f='klmnopqrs'
         OR f='lmnopqrst'
