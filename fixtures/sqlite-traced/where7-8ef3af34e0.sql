SELECT a FROM t2
      WHERE c=13013
         OR (d>=55.0 AND d<56.0 AND d NOT NULL)
         OR (d>=75.0 AND d<76.0 AND d NOT NULL)
         OR ((a BETWEEN 87 AND 89) AND a!=88)
         OR f='bcdefghij'
         OR b=586
         OR (g='edcbazy' AND f GLOB 'uvwxy*')
         OR ((a BETWEEN 59 AND 61) AND a!=60)
         OR (g='mlkjihg' AND f GLOB 'ghijk*')
         OR (d>=6.0 AND d<7.0 AND d NOT NULL)
         OR a=9
