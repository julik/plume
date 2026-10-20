SELECT a FROM t2
      WHERE (d>=68.0 AND d<69.0 AND d NOT NULL)
         OR f='zabcdefgh'
         OR b=308
         OR (d>=16.0 AND d<17.0 AND d NOT NULL)
         OR (g='srqponm' AND f GLOB 'defgh*')
         OR ((a BETWEEN 15 AND 17) AND a!=16)
         OR b=443
         OR ((a BETWEEN 12 AND 14) AND a!=13)
         OR f='uvwxyzabc'
         OR (f GLOB '?zabc*' AND f GLOB 'yzab*')
