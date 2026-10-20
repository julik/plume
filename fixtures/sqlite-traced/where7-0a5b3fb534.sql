SELECT a FROM t2
      WHERE f='fghijklmn'
         OR (d>=44.0 AND d<45.0 AND d NOT NULL)
         OR (d>=15.0 AND d<16.0 AND d NOT NULL)
