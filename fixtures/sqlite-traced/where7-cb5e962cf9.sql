SELECT a FROM t2
      WHERE c=34034
         OR (d>=68.0 AND d<69.0 AND d NOT NULL)
         OR a=44
         OR (g='tsrqpon' AND f GLOB 'xyzab*')
         OR (d>=12.0 AND d<13.0 AND d NOT NULL)
         OR c=31031
         OR (g='ihgfedc' AND f GLOB 'abcde*')
         OR b=619
         OR (f GLOB '?efgh*' AND f GLOB 'defg*')
         OR ((a BETWEEN 29 AND 31) AND a!=30)
