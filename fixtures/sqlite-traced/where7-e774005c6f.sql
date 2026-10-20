SELECT a FROM t2
      WHERE ((a BETWEEN 68 AND 70) AND a!=69)
         OR b=421
         OR ((a BETWEEN 22 AND 24) AND a!=23)
         OR (d>=2.0 AND d<3.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR (d>=24.0 AND d<25.0 AND d NOT NULL)
         OR c=22022
         OR b=825
         OR ((a BETWEEN 17 AND 19) AND a!=18)
         OR (f GLOB '?hijk*' AND f GLOB 'ghij*')
