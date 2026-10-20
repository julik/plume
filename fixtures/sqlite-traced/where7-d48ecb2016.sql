SELECT a FROM t2
      WHERE b=275
         OR ((a BETWEEN 57 AND 59) AND a!=58)
         OR (d>=92.0 AND d<93.0 AND d NOT NULL)
         OR (g='rqponml' AND f GLOB 'lmnop*')
         OR (d>=53.0 AND d<54.0 AND d NOT NULL)
         OR f='ijklmnopq'
