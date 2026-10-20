SELECT a FROM t2
      WHERE a=69
         OR (f GLOB '?defg*' AND f GLOB 'cdef*')
         OR ((a BETWEEN 58 AND 60) AND a!=59)
         OR a=98
         OR b=300
         OR a=41
         OR ((a BETWEEN 37 AND 39) AND a!=38)
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR a=33
         OR ((a BETWEEN 10 AND 12) AND a!=11)
