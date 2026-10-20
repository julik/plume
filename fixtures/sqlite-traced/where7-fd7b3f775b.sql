SELECT a FROM t2
      WHERE (d>=66.0 AND d<67.0 AND d NOT NULL)
         OR b=11
         OR (g='fedcbaz' AND f GLOB 'stuvw*')
         OR ((a BETWEEN 14 AND 16) AND a!=15)
         OR (d>=38.0 AND d<39.0 AND d NOT NULL)
         OR a=99
