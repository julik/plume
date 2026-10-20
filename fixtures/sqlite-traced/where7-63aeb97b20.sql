SELECT a FROM t2
      WHERE b=542
         OR a=17
         OR f='jklmnopqr'
         OR ((a BETWEEN 5 AND 7) AND a!=6)
         OR (d>=39.0 AND d<40.0 AND d NOT NULL)
         OR a=23
         OR (d>=25.0 AND d<26.0 AND d NOT NULL)
