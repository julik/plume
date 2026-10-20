SELECT a FROM t2
      WHERE (d>=42.0 AND d<43.0 AND d NOT NULL)
         OR b=825
         OR a=100
         OR (d>=77.0 AND d<78.0 AND d NOT NULL)
         OR a=60
