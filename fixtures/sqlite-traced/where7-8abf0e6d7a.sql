SELECT a FROM t2
      WHERE (d>=79.0 AND d<80.0 AND d NOT NULL)
         OR ((a BETWEEN 18 AND 20) AND a!=19)
         OR (g='qponmlk' AND f GLOB 'nopqr*')
         OR a=97
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR b=674
         OR c=14014
         OR b=69
