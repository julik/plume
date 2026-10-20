SELECT a FROM t2
      WHERE c<=10
         OR (d>=76.0 AND d<77.0 AND d NOT NULL)
         OR b=154
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR b=880
         OR a=55
         OR b=773
         OR b=319
         OR (g='hgfedcb' AND f GLOB 'fghij*')
