SELECT a FROM t2
      WHERE (g='tsrqpon' AND f GLOB 'zabcd*')
         OR a=24
         OR f IS NULL
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR (d>=57.0 AND d<58.0 AND d NOT NULL)
         OR c=12012
         OR (d>=88.0 AND d<89.0 AND d NOT NULL)
