SELECT a FROM t2
      WHERE f='abcdefghi'
         OR a=14
         OR (d>=13.0 AND d<14.0 AND d NOT NULL)
         OR c=27027
         OR a=47
