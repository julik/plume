SELECT a FROM t2
      WHERE b=498
         OR (d>=5.0 AND d<6.0 AND d NOT NULL)
         OR b=880
         OR ((a BETWEEN 60 AND 62) AND a!=61)
         OR b=828
         OR (d>=15.0 AND d<16.0 AND d NOT NULL)
         OR b=113
