SELECT a FROM t2
      WHERE b=297
         OR b=143
         OR a=46
         OR b=660
         OR (d>=41.0 AND d<42.0 AND d NOT NULL)
         OR (f GLOB '?yzab*' AND f GLOB 'xyza*')
         OR (g='vutsrqp' AND f GLOB 'rstuv*')
         OR b=355
         OR a=93
         OR b=297
