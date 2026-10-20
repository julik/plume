SELECT a FROM t2
      WHERE b=1078
         OR c=28028
         OR (d>=40.0 AND d<41.0 AND d NOT NULL)
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR (f GLOB '?rstu*' AND f GLOB 'qrst*')
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR ((a BETWEEN 17 AND 19) AND a!=18)
         OR c=9009
         OR a=17
         OR (d>=39.0 AND d<40.0 AND d NOT NULL)
