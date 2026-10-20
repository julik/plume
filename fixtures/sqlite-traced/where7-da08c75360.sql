SELECT a FROM t2
      WHERE b=828
         OR b=341
         OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR b=902
         OR ((a BETWEEN 64 AND 66) AND a!=65)
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR (g='fedcbaz' AND f GLOB 'rstuv*')
         OR b=242
         OR (g='yxwvuts' AND f GLOB 'cdefg*')
         OR (d>=91.0 AND d<92.0 AND d NOT NULL)
         OR (g='qponmlk' AND f GLOB 'qrstu*')
