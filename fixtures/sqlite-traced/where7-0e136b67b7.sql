SELECT a FROM t2
      WHERE b=781
         OR b=671
         OR (d>=60.0 AND d<61.0 AND d NOT NULL)
         OR (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR ((a BETWEEN 39 AND 41) AND a!=40)
         OR b=113
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR b=385
         OR (g='hgfedcb' AND f GLOB 'fghij*')
