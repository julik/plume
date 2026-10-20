SELECT a FROM t2
      WHERE (f GLOB '?efgh*' AND f GLOB 'defg*')
         OR (g='ihgfedc' AND f GLOB 'efghi*')
         OR (d>=89.0 AND d<90.0 AND d NOT NULL)
         OR f='jklmnopqr'
