SELECT a FROM t2
      WHERE (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR b=322
         OR (d>=19.0 AND d<20.0 AND d NOT NULL)
         OR (g='fedcbaz' AND f GLOB 'pqrst*')
         OR (g='onmlkji' AND f GLOB 'wxyza*')
         OR b=432
         OR b=55
         OR a=53
         OR (d>=74.0 AND d<75.0 AND d NOT NULL)
         OR (f GLOB '?ijkl*' AND f GLOB 'hijk*')
         OR b=25
