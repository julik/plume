SELECT a FROM t2
      WHERE (d>=27.0 AND d<28.0 AND d NOT NULL)
         OR b=55
         OR (d>=13.0 AND d<14.0 AND d NOT NULL)
         OR (g='onmlkji' AND f GLOB 'abcde*')
         OR a=50
         OR (d>=73.0 AND d<74.0 AND d NOT NULL)
         OR (d>=51.0 AND d<52.0 AND d NOT NULL)
         OR (d>=64.0 AND d<65.0 AND d NOT NULL)
