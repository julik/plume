SELECT a FROM t2
      WHERE ((a BETWEEN 84 AND 86) AND a!=85)
         OR f='pqrstuvwx'
         OR (d>=5.0 AND d<6.0 AND d NOT NULL)
         OR b=278
         OR a=10
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR (d>=28.0 AND d<29.0 AND d NOT NULL)
         OR ((a BETWEEN 63 AND 65) AND a!=64)
         OR (g='kjihgfe' AND f GLOB 'qrstu*')
         OR f='uvwxyzabc'
