SELECT a FROM t2
      WHERE c=9009
         OR a=34
         OR (d>=95.0 AND d<96.0 AND d NOT NULL)
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR b=715
         OR b=619
         OR ((a BETWEEN 98 AND 100) AND a!=99)
