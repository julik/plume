SELECT a FROM t2
      WHERE (g='qponmlk' AND f GLOB 'qrstu*')
         OR f='bcdefghij'
         OR f='hijklmnop'
         OR a=65
         OR f='ijklmnopq'
         OR (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR g IS NULL
         OR a=26
         OR ((a BETWEEN 38 AND 40) AND a!=39)
         OR a=9
         OR (d>=32.0 AND d<33.0 AND d NOT NULL)
