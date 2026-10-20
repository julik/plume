SELECT a FROM t2
      WHERE c=18018
         OR (g='ihgfedc' AND f GLOB 'abcde*')
         OR b=410
         OR b=858
         OR (d>=49.0 AND d<50.0 AND d NOT NULL)
