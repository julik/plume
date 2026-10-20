SELECT a FROM t2
      WHERE ((a BETWEEN 94 AND 96) AND a!=95)
         OR b=858
         OR b=806
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
