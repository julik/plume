SELECT a FROM t2
      WHERE (d>=40.0 AND d<41.0 AND d NOT NULL)
         OR b=110
         OR f='ghijklmno'
         OR (d>=21.0 AND d<22.0 AND d NOT NULL)
