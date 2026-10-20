SELECT a FROM t2
      WHERE (d>=100.0 AND d<101.0 AND d NOT NULL)
         OR f='fghijklmn'
         OR a=70
         OR (d>=4.0 AND d<5.0 AND d NOT NULL)
