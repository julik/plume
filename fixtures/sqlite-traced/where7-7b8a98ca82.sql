SELECT a FROM t2
      WHERE f='hijklmnop'
         OR (g='utsrqpo' AND f GLOB 'vwxyz*')
         OR ((a BETWEEN 31 AND 33) AND a!=32)
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR (d>=1.0 AND d<2.0 AND d NOT NULL)
         OR ((a BETWEEN 77 AND 79) AND a!=78)
         OR b=528
         OR c=30030
         OR (g='qponmlk' AND f GLOB 'qrstu*')
