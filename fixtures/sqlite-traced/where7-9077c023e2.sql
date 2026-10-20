SELECT a FROM t2
      WHERE b=806
         OR (g='ihgfedc' AND f GLOB 'efghi*')
         OR (d>=50.0 AND d<51.0 AND d NOT NULL)
         OR ((a BETWEEN 10 AND 12) AND a!=11)
         OR b=275
         OR ((a BETWEEN 80 AND 82) AND a!=81)
