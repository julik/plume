SELECT a FROM t2
      WHERE b=14
         OR a=23
         OR b=748
         OR b=407
         OR (d>=4.0 AND d<5.0 AND d NOT NULL)
         OR (d>=87.0 AND d<88.0 AND d NOT NULL)
         OR b=979
         OR ((a BETWEEN 15 AND 17) AND a!=16)
