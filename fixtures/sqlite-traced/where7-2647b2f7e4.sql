SELECT a FROM t2
      WHERE (d>=41.0 AND d<42.0 AND d NOT NULL)
         OR f='bcdefghij'
         OR ((a BETWEEN 68 AND 70) AND a!=69)
         OR (d>=54.0 AND d<55.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'efghi*')
         OR (g='mlkjihg' AND f GLOB 'jklmn*')
         OR b=762
         OR (d>=63.0 AND d<64.0 AND d NOT NULL)
         OR (g='jihgfed' AND f GLOB 'yzabc*')
