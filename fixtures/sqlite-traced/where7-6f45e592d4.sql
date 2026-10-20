SELECT a FROM t2
      WHERE (d>=46.0 AND d<47.0 AND d NOT NULL)
         OR b=982
         OR ((a BETWEEN 81 AND 83) AND a!=82)
         OR b=374
