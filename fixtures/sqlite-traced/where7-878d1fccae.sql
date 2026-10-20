SELECT a FROM t2
      WHERE (g='fedcbaz' AND f GLOB 'rstuv*')
         OR (d>=68.0 AND d<69.0 AND d NOT NULL)
         OR (g='vutsrqp' AND f GLOB 'pqrst*')
         OR e IS NULL
         OR b=759
