SELECT a FROM t2
      WHERE (g='utsrqpo' AND f GLOB 'wxyza*')
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR (g='wvutsrq' AND f GLOB 'klmno*')
         OR f='vwxyzabcd'
         OR (g='vutsrqp' AND f GLOB 'nopqr*')
         OR a=37
         OR a=50
