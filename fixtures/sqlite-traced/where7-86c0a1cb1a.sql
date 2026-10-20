SELECT a FROM t2
      WHERE a=96
         OR (d>=23.0 AND d<24.0 AND d NOT NULL)
         OR (g='ponmlkj' AND f GLOB 'vwxyz*')
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR a=85
         OR ((a BETWEEN 10 AND 12) AND a!=11)
         OR c=11011
         OR b=641
         OR f='vwxyzabcd'
         OR b=286
