SELECT a FROM t2
      WHERE (d>=94.0 AND d<95.0 AND d NOT NULL)
         OR b=883
         OR (d>=35.0 AND d<36.0 AND d NOT NULL)
         OR (d>=3.0 AND d<4.0 AND d NOT NULL)
         OR (d>=78.0 AND d<79.0 AND d NOT NULL)
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR a=81
         OR (f GLOB '?fghi*' AND f GLOB 'efgh*')
         OR f='mnopqrstu'
