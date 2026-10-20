SELECT a FROM t2
      WHERE b=440
         OR f='vwxyzabcd'
         OR b=190
         OR (f GLOB '?mnop*' AND f GLOB 'lmno*')
         OR (d>=42.0 AND d<43.0 AND d NOT NULL)
         OR b=88
         OR b=58
