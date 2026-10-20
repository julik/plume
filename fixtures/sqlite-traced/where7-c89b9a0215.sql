SELECT a FROM t2
      WHERE (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR f='cdefghijk'
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR ((a BETWEEN 30 AND 32) AND a!=31)
         OR (d>=29.0 AND d<30.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'ghijk*')
         OR (d>=91.0 AND d<92.0 AND d NOT NULL)
