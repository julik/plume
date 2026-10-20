SELECT a FROM t2
      WHERE (d>=95.0 AND d<96.0 AND d NOT NULL)
         OR b=1070
         OR (g='edcbazy' AND f GLOB 'vwxyz*')
         OR (d>=45.0 AND d<46.0 AND d NOT NULL)
         OR (d>=22.0 AND d<23.0 AND d NOT NULL)
         OR a=22
         OR (d>=11.0 AND d<12.0 AND d NOT NULL)
         OR (d>=61.0 AND d<62.0 AND d NOT NULL)
         OR f='tuvwxyzab'
         OR a=72
         OR ((a BETWEEN 53 AND 55) AND a!=54)
