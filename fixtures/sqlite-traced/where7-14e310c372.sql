SELECT a FROM t2
      WHERE b=795
         OR b=671
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR ((a BETWEEN 71 AND 73) AND a!=72)
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR (f GLOB '?qrst*' AND f GLOB 'pqrs*')
         OR b=322
         OR (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR c=34034
         OR b=410
