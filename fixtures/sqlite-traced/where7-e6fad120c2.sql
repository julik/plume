SELECT a FROM t2
      WHERE a=73
         OR b=44
         OR b=539
         OR c=11011
         OR (g='fedcbaz' AND f GLOB 'rstuv*')
         OR b=69
         OR b=1001
         OR (d>=26.0 AND d<27.0 AND d NOT NULL)
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
         OR (g='ihgfedc' AND f GLOB 'defgh*')
         OR ((a BETWEEN 32 AND 34) AND a!=33)
