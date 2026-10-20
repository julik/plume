SELECT a FROM t2
      WHERE b=1067
         OR ((a BETWEEN 53 AND 55) AND a!=54)
         OR (g='jihgfed' AND f GLOB 'vwxyz*')
         OR (d>=18.0 AND d<19.0 AND d NOT NULL)
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR b=520
         OR b=399
         OR b=209
         OR a=68
         OR (g='fedcbaz' AND f GLOB 'qrstu*')
